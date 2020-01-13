package com.semi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.dao.MatchingDao;
import com.semi.dao.MatchingDaoImpl;

import com.semi.dao.ProjectDao;
import com.semi.dao.ProjectDaoImple;
import com.semi.service.MatchingService;
import com.semi.service.ProjectService;
import com.semi.vo.CommentVo;
import com.semi.vo.FileVo;
import com.semi.vo.IssueVo;
import com.semi.vo.TodoVo;

@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 전역 변수 설정
	int projectSeq;
	String projectMember= "";
	String projectName = "";
	
	public ProjectServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		dual(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		dual(request, response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	private void dual(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String command = request.getParameter("command");
		System.out.println("[ " + command + " ]");
		// 서비스와 연결
		ProjectService projectService = new ProjectService();
		ProjectDao projectDao = new ProjectDaoImple();

		HttpSession session = request.getSession(); 
		/* 자바 변수 컨벤션에 맞지 않은 부분들 일부 수정 -> 언더바 사용 비추 */

		try {
			projectSeq = (int)session.getAttribute("projectSeq");
			projectMember = projectDao.selectAllMember(projectSeq);
			projectName = projectDao.selectOneProjectName2(projectSeq);
			
			session.setAttribute("pMember", projectMember); 
			session.setAttribute("pName",projectName);
			
		} catch(NullPointerException nullPointer) {
			System.out.println("널값 발생");
			nullPointer.printStackTrace();
			
		} catch (Exception e) {
			System.out.println("세션 값이 설정되지 않았습니다");
		} finally {
			System.out.print("projectSeq : "+projectSeq);
			System.out.println("  pmem : "+projectMember+"   p_name: "+projectName);
		}
	
		if(command.equals("goToProject")) {
			int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
			session.setAttribute("projectSeq", projectSeq);
			response.sendRedirect("cowork/index.jsp");
			
		} else if (command.equals("enterCowork")) {
			dispatch("cowork/dashboard.jsp", request, response);

		} else if (command.equals("issueWrite")) {
			System.out.println("이슈 생성 폼으로 이동");

			String userId = (String) session.getAttribute("u_id");
			String userName = (String) session.getAttribute("u_name");
			
			System.out.println("아이디:" + userId);

			int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
			System.out.println("프로젝트 시퀀스:" + projectSeq);

			List<String> member = projectService.getMember(projectSeq);
			request.setAttribute("member", member);
			session.setAttribute("projectSeq", projectSeq);
			dispatch("cowork/issueWrite.jsp", request, response);

		} else if (command.equals("issueform")) {
			System.out.println("이슈 생성");

			String userId = (String) session.getAttribute("u_id");
			String userName = (String) session.getAttribute("u_name");
			
			System.out.println(userId);

			int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
			System.out.println("프로젝트 시퀀스 : " + projectSeq);
			session.setAttribute("projectSeq", projectSeq);

			boolean success = projectService.issueWrite(request, response);

			if (success) {
				System.out.println("이슈 생성 성공");
				dispatch("issue?command=issueAll", request, response);
			} else {
				System.out.println("이슈 생성 실패");
				session.setAttribute("projectSeq", projectSeq);
				dispatch("issue?command=issueWrite", request, response);
			}
		} else if (command.equals("issueDelete")) {
			System.out.println("이슈 삭제 요청");
			boolean success = projectService.issueDelete(request, response);

			if (success) {
				System.out.println("이슈 삭제 성공");
				dispatch("issue?command=issueAll", request, response);
			} else {
				System.out.println("이슈 삭제 실패");
				dispatch("cowork/issueDetail.jsp", request, response);
			}

		} else if (command.equals("issueUpdate")) {
			System.out.println("이슈 수정");
			int issueSeq = Integer.parseInt(request.getParameter("issue_seq"));
			System.out.println("이슈 시퀀스:" + issueSeq);

			IssueVo vo = projectDao.selectOneIssue(issueSeq);

			request.setAttribute("vo", vo);
			dispatch("cowork/issueUpdate.jsp", request, response);

		} else if (command.equals("issueUpdateform")) {
			System.out.println("이슈 수정 입력 완료");

			int issueSeq = Integer.parseInt(request.getParameter("issue_seq"));

			boolean success = projectService.issueUpdate(request, response);

			if (success) {
				System.out.println("성공적으로 수정");
				dispatch("issue?command=issueDetail&issue_seq=" + issueSeq, request, response);
			} else {
				System.out.println("수정 실패");
				dispatch("issue?command=issueUpdate&issue_seq=" + issueSeq, request, response);
			}

		} else if (command.equals("issueAll")) {
			System.out.println("이슈 전체 보기");

			int projectSeq = (int) session.getAttribute("projectSeq");
			System.out.println("시퀀스번호:" + projectSeq);

			List<IssueVo> list = projectDao.selectAllIssue(projectSeq);

			request.setAttribute("issueList", list);
			dispatch("cowork/issueList.jsp", request, response);

		} else if (command.equals("issueDetail")) {
			System.out.println("이슈 상세 정보");
			int seq = Integer.parseInt(request.getParameter("issue_seq"));
			// 이슈 디테일
			IssueVo vo = projectDao.selectOneIssue(seq);

			// 댓글리스트
			List<CommentVo> list = projectDao.selectAllComment(seq);
			request.setAttribute("vo", vo);
			request.setAttribute("list", list);

			dispatch("cowork/issueDetail.jsp", request, response);

		} else if (command.equals("todo-list")) { // 1

			List<TodoVo> todoList = projectService.selectAllTodo(request, response);
			request.setAttribute("todoList", todoList);
			dispatch("cowork/todo.jsp", request, response);

		} else if (command.equals("todoForm")) { // 2
			int success = projectService.insertTodo(request, response);
			if (success > 0) {
				System.out.println("성공적으로 생성");
				response.sendRedirect("todo?command=todo-list");
			} else {
				System.out.println("생성 오류 발생");
			}

		} else if (command.equals("todo-detail")) { // 3
			System.out.println("상세 보기 페이지");
			TodoVo detail = projectService.selectOneTodo(request, response);
			if (detail != null) {
				System.out.println("디테일 정보 출력");
				request.setAttribute("detail", detail);
				dispatch("/cowork/todoDetail.jsp", request, response);
			}

		} else if (command.equals("updateTodo")) { // 4
			System.out.println("업무 내용 수정");
			int success = projectService.updateTodo(request, response);
			String msg = "";
			if (success > 0) {
				msg = "성공적으로 수정되었습니다";
			} else {
				msg = "수정을 실패했습니다";
			}
			JSONObject obj = new JSONObject();
			obj.put("result", msg);
			response.getWriter().print(obj);

		} else if (command.equals("updateTodoStatus")) { // 5
			System.out.println("진행도 변경");
			projectService.updateTodoStatus(request, response);

		} else if (command.equals("deleteTodo")) { // 6
			System.out.println("업무 삭제");
			int success = projectService.deleteTodo(request, response);
			String msg = "";
			if (success > 0) {
				msg = "업무가 성공적으로 삭제되었습니다";
			} else {
				msg = "업무 삭제 실패했습니다";
			}
			JSONObject obj = new JSONObject();
			obj.put("result", msg);
			response.getWriter().print(obj);

		} else if (command.equals("updateTodoPriority")) { // 7
			System.out.println("중요도 변경");
			projectService.updateTodoPriority(request, response);

		} else if (command.equals("dashboard")) {
			// 기존 userId 변수명 => userName 으로 변경했습니다.
			String userName = (String) session.getAttribute("u_name");
			String userId = (String) session.getAttribute("u_id");

			int projectSeq = session.getAttribute("projectSeq") == null ? 0 : (int) session.getAttribute("projectSeq");
			System.out.println("userId :: " + userName + "\nprojectSeq :: " + projectSeq);

			HashMap<String, Integer> count = projectService.getCounts(userName, projectSeq); // issue Count
			// TODO 개인 업무 or 팀 업무? -> 우선 개인 업무로 진행
			List<TodoVo> urgentTodo = projectService.getUrgentTodo(userName, projectSeq); // deadline todo
			List<IssueVo> weekIssue = projectService.getWeekIssue(projectSeq); // week issues
			HashMap<String, Integer> todoType = projectService.getTodoType(projectSeq); // todo category Count & Rate

			// 나에게 할당된 이슈 조회
			int issueCount = projectDao.getIssueToMe(userId);

			request.setAttribute("issueToMe", issueCount);
			request.setAttribute("count", count);
			request.setAttribute("urgent", urgentTodo);
			request.setAttribute("weekIssue", weekIssue);
			request.setAttribute("todoType", todoType);

			dispatch("/cowork/dashboard.jsp", request, response);

		} else if (command.equals("commentWrite")) {
			System.out.println("댓글 생성");
			String userId = (String) session.getAttribute("u_id");

			boolean success = projectService.commentWrite(request, response);

			int num = Integer.parseInt(request.getParameter("issueSeq"));

			if (success) {
				System.out.println("댓글 생성 성공");
				response.sendRedirect("issue?command=issueDetail&issue_seq=" + num);
//				dispatch("issue?command=issueDetail&issue_seq="+num, request, response);
			} else {
				System.out.println("댓글 생성 실패");
			}

		} else if (command.equals("deleteComment")) {
			System.out.println("댓글 삭제");
			projectService = new ProjectService();

			boolean success = projectService.commentDelete(request, response);

			int num = Integer.parseInt(request.getParameter("issueSeq"));
			System.out.println("이슈시퀀스:" + num);

			if (success) {
				System.out.println("댓글 삭제 성공");
				response.sendRedirect("issue?command=issueDetail&issue_seq=" + num);
			} else {
				System.out.println("댓글 삭제 실패");
			}

		} else if (command.equals("FileUpload")) {
			System.out.println("[파일 업로드 및 생성]");
			// 프로젝트 시퀀스 세션 설정 :: 제대로 받아옴 (맨 위에 설정)
			// 로그인한 아이디 세션 설정 :: 제대로 받아옴
			int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
			
			List<FileVo> list = projectDao.selectAllFile(projectSeq);
			System.out.println(list.toString());
			request.setAttribute("FileList", list);
			dispatch("cowork/fileupload.jsp", request, response);
			
		} else if (command.equals("uploadbutton")) {
			String savePath = request.getServletContext().getRealPath("upload");
			int maxSize = 1024 * 1024 * 100;
			String encoding = "UTF-8";

			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());

			String userId = (String) session.getAttribute("u_id");
			String fileName = multipartRequest.getOriginalFileName("file");
			int projectSeq = (int) session.getAttribute("projectSeq");

			projectDao.upload(userId, fileName, projectSeq);

			dispatch("project?command=FileUpload&projectSeq=" + projectSeq, request, response);

		} else if (command.equals("download")) {
			System.out.println("다운로드 버튼 눌렀음");
			
			    String fileName = request.getParameter("fileName");
			 
			    String filePath = this.getServletContext().getRealPath("upload");
		        File downloadFile = new File(filePath+"/"+fileName);
		        FileInputStream inStream = new FileInputStream(downloadFile);
		         
		        // if you want to use a relative path to context root:
		        String relativePath = getServletContext().getRealPath("");
		        System.out.println("relativePath = " + relativePath);
		         
		        // obtains ServletContext
		        ServletContext context = getServletContext();
		         
		        // gets MIME type of the file
		        String mimeType = context.getMimeType(filePath);
		        if (mimeType == null) {        
		            // set to binary type if MIME mapping not found
		            mimeType = "application/octet-stream";
		        }
		        System.out.println("MIME type: " + mimeType);
		         
		        // modifies response
		        response.setContentType(mimeType);
		        response.setContentLength((int) downloadFile.length());
		         
		        // forces download
		        String headerKey = "Content-Disposition";
		        String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
		        response.setHeader(headerKey, headerValue);
		         
		        OutputStream outStream = response.getOutputStream();
		         
		        byte[] buffer = new byte[4096];
		        int bytesRead = -1;
		         
		        while ((bytesRead = inStream.read(buffer)) != -1) {
		            outStream.write(buffer, 0, bytesRead);
		        }
		         
		        inStream.close();
		        outStream.close();     
		}
	}
}
