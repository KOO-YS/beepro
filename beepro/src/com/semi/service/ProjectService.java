package com.semi.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.ProjectDao;
import com.semi.dao.ProjectDaoImple;
import com.semi.vo.CommentVo;
import com.semi.vo.IssueVo;
import com.semi.vo.TodoVo;

public class ProjectService {
	ProjectDao projectDao = new ProjectDaoImple();

	// 이슈 생성 서비스
	public boolean issueWrite(HttpServletRequest request, HttpServletResponse response) {
		ProjectDaoImple dao = new ProjectDaoImple();
		HttpSession session = request.getSession();
		
		

		String title = request.getParameter("title");
		String u_id = (String)session.getAttribute("u_id");
		String issue_level = request.getParameter("issue_level");
		String issue_category = request.getParameter("issue_category");
		String content = request.getParameter("content");

		
		System.out.println("u_id 서비스에 들어왔음 : "+u_id);
		
		IssueVo vo = new IssueVo();
		vo.setTitle(title);
		vo.setWriter(u_id);
		vo.setLevel(issue_level);
		vo.setCategory(issue_category);
		vo.setContent(content);

		boolean res = dao.insertIssue(vo);

		if (res == true) {
			System.out.println("데이터 입력 성공");
		}
		return res;
	}

	// 이슈 삭제 서비스
	public boolean issueDelete(HttpServletRequest request, HttpServletResponse response) {
        int issueSeq = Integer.parseInt(request.getParameter("issue_seq"));
        return projectDao.deleteIssue(issueSeq);
	}

	// 이슈 전체 조회 서비스
	public List<IssueVo> issueAll(HttpServletRequest request, HttpServletResponse response) {
          return projectDao.selectAllIssue();
	}
	
	// 이슈 수정
	public boolean issueUpdate(HttpServletRequest request, HttpServletResponse response) {
		return false;
	}

	// 선택한 하나의 이슈 정보를 자세히
	public IssueVo issueDetail(HttpServletRequest request, HttpServletResponse response) {
		int issueSeq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("선택한 이슈 번호 : " + issueSeq);
		return projectDao.selectOneIssue(issueSeq);
		
	}

	// 업무 생성 서비스
	public int insertTodo(HttpServletRequest request, HttpServletResponse response) {

		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String title = request.getParameter("title");
		String manager = request.getParameter("manager");
		String content = request.getParameter("content");
		Date startDate = Date.valueOf(request.getParameter("from"));
		Date endDate = Date.valueOf(request.getParameter("to"));
		String category = request.getParameter("category");
		int priority = Integer.parseInt(request.getParameter("priority"));

		TodoVo todo = new TodoVo(1, title, content, manager, startDate, endDate, category, priority);

		System.out.println(todo.toString());

		return projectDao.insertTodo(todo);
	}

	// 업무 리스트 출력 (조건 : 아이디)
	public List<TodoVo> selectAllTodo(int project_seq, String manager) {
		return projectDao.selectAllTodo(project_seq, manager);
	}
	
	// 선택 업무 출력
	public TodoVo selectOneTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("seq"));
		System.out.println("선택한 seq : " + todoSeq);
		return projectDao.selectOneTodo(todoSeq);
	}
	// 업무 내용 변경
	public int updateTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int priority = Integer.parseInt(request.getParameter("priority"));
		Date startDate = Date.valueOf(request.getParameter("from"));
		Date endDate = Date.valueOf(request.getParameter("to"));
		TodoVo todo = new TodoVo(todoSeq, projectSeq, title, content, startDate, endDate, priority);
		
		System.out.println(todo.toString());
		
		return projectDao.updateTodo(todo);
	}
	
	// 업무 상태 변경
	public void updateTodoStatus(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		String status = request.getParameter("status");
		char finishCk = 'N';
		if(status.equals("완료")) {	// 완료 상태로 변경했을 경우
			finishCk = 'Y';
		}
		projectDao.updateTodoStatus(todoSeq, projectSeq, status, finishCk);
	}
	
	// 업무 삭제
	public int deleteTodo(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		
		return projectDao.deleteTodo(todoSeq, projectSeq);
	}
	// 업무 중요도 변경
	public void updateTodoPriority(HttpServletRequest request, HttpServletResponse response) {
		int todoSeq = Integer.parseInt(request.getParameter("todoSeq"));
		int projectSeq = Integer.parseInt(request.getParameter("projectSeq"));
		int priority = Integer.parseInt(request.getParameter("priority"));
		
		projectDao.updateTodoPriority(todoSeq, projectSeq, priority);
	}
	// 대시보드 통계 데이터 출력
	public HashMap<String, Integer> getCounts(String userId, int projectSeq) {
		
		// TODO 1개씩 출력 - 전체업무진행률(finishCk Y/N)*, 업무별진행률*, 이슈Count*, 업무count*, N업무
		HashMap<String, Integer> totalInfo = new HashMap<String, Integer>();
		
		HashMap<String, Integer> todoInfo = projectDao.getTodoInfo(userId, projectSeq);		// -> 업무
		HashMap<String, Integer> issueInfo = projectDao.getIssueInfo(userId, projectSeq);	// ->이슈
		// TODO 분야별 업무개수, 진행률
		
		// total로 hashMap 병합
		totalInfo.putAll(todoInfo);
		totalInfo.putAll(issueInfo);
		
		return totalInfo;
	}
	
	// 이번주에 생성된 이슈 리스트 
	public List<IssueVo> getWeekIssue(int projectSeq) {
		// TODO 이번주 발생 이슈 리스트 출력 (최대 3개?)
		List<IssueVo> issues = projectDao.getWeekIssue(projectSeq);
		return issues;
	}
	// 업무 분류별 통계 데이터 출력
	public HashMap<String, Integer> getTodoType(int projectSeq) {
		HashMap<String, Integer> todoType = projectDao.getTodoType(projectSeq);
		return todoType;
	}
	
	// 마감일자 1주 이내 업무 알람
	public List<TodoVo> getUrgentTodo(String userId, int projectSeq) {
		// TODO Auto-generated method stub
		List<TodoVo> urgentTodo = projectDao.getUrsentTodo(userId, projectSeq);
		return urgentTodo;
	}

	// 댓글 작성
	public boolean commentWrite(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("시퀀스 받아오기 전");
		int issueSeq = Integer.parseInt(request.getParameter("issueSeq"));
		System.out.println("시퀀스 : "+issueSeq);
		
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("u_id");
		System.out.println("아이디 : " + writer);
		String content = request.getParameter("content");
		System.out.println("내용 : " +content);
		
		CommentVo vo = new CommentVo();
		
		vo.setIssueSeq(issueSeq);
		vo.setWriter(writer);
		vo.setContent(content);

		return projectDao.insertComment(vo);
	
	}

	// 댓글 삭제
	public boolean commentDelete(HttpServletRequest request, HttpServletResponse response) {
		int commentSeq = Integer.parseInt(request.getParameter("commentSeq"));
		return projectDao.deleteComment(commentSeq);
	}
    
	// 댓글 수정
	public void updateComment(HttpServletRequest request, HttpServletResponse response) {
		int commentSeq = Integer.parseInt(request.getParameter("commentSeq"));
		int issueSeq = Integer.parseInt(request.getParameter("issueSeq"));
		String content = request.getParameter("content");
		
		projectDao.updateComment(commentSeq, issueSeq, content);
	}
}
