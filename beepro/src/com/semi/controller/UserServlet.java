package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.UserDao;
import com.semi.dao.UserDaoImpl;
import com.semi.service.MatchingService;
import com.semi.service.UserService;
import com.semi.vo.MessageVo;
import com.semi.vo.ProjectVo;
import com.semi.vo.UserVo;

import util.sha256;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		dual(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		dual(request, response);
	}

	private void dual(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * dual method : get, post 방식으로 들어온 요청을 둘다 받는다 : 구분값 설정 필요 (hidden값(예: command)
		 * or url/(추가 url로 구분 문자열 예: userservlet/login의 login)) : 구분값을 통해 service 로 값 전달
		 * 방식 예시
		 * https://github.com/jaewookleeee/semi/blob/master/src/com/semi/controller/Controller.java#L44
		 */

		String command = request.getParameter("command");

		// 서비스와 연결
		UserService userService = new UserService();

		if (command.equals("chatSubmit")) {
			System.out.println("메세지 보내기");
			userService.chatSubmit(request, response);
			
		}else if(command.equals("login")) {
			System.out.println("로그인");
			loginAction(request, response);
			
		}else if(command.equals("logout")) {
			System.out.println("로그아웃");
			logoutAction(request, response);
			
		}else if(command.equals("register")) {
			System.out.println("회원가입");
			registerAction(request, response);
		
		}else if(command.equals("naverLogin")) {
			System.out.println("네이버로그인");
			naverLoginAction(request, response);	
			
		}else if(command.equals("withdrawal")) {
			System.out.println("회원탈퇴");
			withdrawalAction(request, response);
			
		}else if(command.equals("updatePwd")) {
			System.out.println("비밀번호 변경");
			updatePwdAction(request, response);		
			
		}else if(command.equals("updateArea")) {
			System.out.println("지역 변경");
			userService.updateArea(request, response);			
			
		}else if(command.equals("updateSkill")) {
			System.out.println("스킬 변경");
			userService.updateSkill(request, response);	
			
			
		}else if(command.equals("userprofile")) {
			System.out.println("프로필사진 변경");
			try {
				userService.profileUpdate(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("findPwd")) {
			System.out.println("비밀번호 찾기");
			
			try {
				userService.findPwd(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
						
		}else if (command.equals("chatList")) {
			System.out.println("주고받은 대화 반환");
			userService.chatList(request, response);
			
		} else if (command.equals("chatUnread")) {
//			System.out.println("읽지 않은 메세지");
			userService.chatUnread(request, response);
			
		} else if (command.equals("chatBox")) {
			System.out.println("대화 목록");
			userService.chatBox(request, response);
			
		} else if (command.equals("chatting")) {
			System.out.println("채팅하기");
			String get_id = request.getParameter("get_id");
			request.setAttribute("get_id", get_id);
			
			dispatch("/cowork/chat.jsp", request, response);
			
		} else if(command.equals("oneUnread")) {
			System.out.println("특정 사용자의 안읽은 메세지");
			userService.oneUnread(request, response);
			
		} else if(command.equals("getAllMsg")) {
			System.out.println("받은 쪽지 출력");
			userService.getAllMsg(request, response);
			
		} else if(command.equals("sendAllMsg")) {
			System.out.println("보낸 쪽지 출력");
			userService.sendAllMsg(request, response);
			
		} else if(command.equals("sendMsg")) {
			System.out.println("쪽지 보내기");
			userService.sendMsg(request, response);
			
		} else if(command.equals("readMsg")) {
			System.out.println("쪽지 읽음");
			userService.readMsg(request, response);
			
		} else if(command.equals("deleteSendMsg")) {
			System.out.println("보낸 쪽지 삭제");
			userService.deleteSendMsg(request, response);
			
		} else if(command.equals("deleteGetMsg")) {
			System.out.println("받은 쪽지 삭제");
			userService.deleteGetMsg(request, response);
			
		} else if(command.equals("msgUnread")) {
//			System.out.println("읽지 않은 쪽지");
			userService.msgUnread(request, response);
			
		} else if(command.equals("follow")) {
			System.out.println("팔로우 하기");
			userService.follow(request, response);
			
		} else if(command.equals("followerCount")) {
			System.out.println("팔로우한 갯수 반환");
			userService.followerCount(request,response);
			
		}  else if(command.equals("followerCount")) {
			System.out.println("팔로잉한 갯수 반환");
			userService.followingCount(request,response);
		} 
	}

	private void registerAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		String u_id = null;
		String u_pwd1 = null;
		String u_pwd2 = null;
		String u_email = null;
		String u_name = null;
		
		if(request.getParameter("u_id").equals("")|| request.getParameter("u_pwd1").equals("") ||request.getParameter("u_pwd2").equals("")||
			request.getParameter("u_email").equals("")||request.getParameter("u_name").equals("")) {

			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('입력되지 않은 문항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();

		}else{
			u_id = (String) request.getParameter("u_id");
			u_pwd1 = sha256.getSHA256(request.getParameter("u_pwd1"));
			u_pwd2 = sha256.getSHA256(request.getParameter("u_pwd2"));
			u_email = (String) request.getParameter("u_email");
			u_name = (String) request.getParameter("u_name");
		}

		if(!(u_pwd1.equals(u_pwd2))){
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('비밀번호 확인이 일치하지 않습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
					

		} else{
			
			UserDao dao = new UserDaoImpl();		
			int result = dao.join(new UserVo(u_id, u_name, u_pwd1, u_email, sha256.getSHA256(u_email), "N",""));

			if (result == -1) {

				PrintWriter script = response.getWriter();

				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();

			} else {
				session.setAttribute("u_id", u_id);

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'matching/emailSendAction.jsp';");							
				script.println("</script>");
				script.close();

			}
		}		
	}
	private void naverLoginAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		UserService UserService = new UserService();
		String u_id = (String) session.getAttribute("u_id");
		String u_email = (String) session.getAttribute("u_email");
		String u_name = (String) session.getAttribute("u_name");
		
		int CheckID = UserService.CheckID(request, response);
		
		if(CheckID==1) { //가입된 회원	
			UserDaoImpl dao = new UserDaoImpl();
	 		String u_photo = dao.getUserPhoto(u_id);	
	 		session.setAttribute("u_photo", u_photo);

	 		PrintWriter script = response.getWriter();	 		
	 		script.println("<script>");		
	 		script.println("location.href='matching/index.jsp'");
	 		script.println("</script>");
	 		script.close();
			
		}else {//회원정보 없음
			UserService.naverRegister(request, response);
			
			PrintWriter script = response.getWriter();
			script.println("<script>");		
	 		script.println("location.href='matching/index.jsp'");
	 		script.println("</script>");
	 		script.close();
		}
		
	}
	private void withdrawalAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//UserDao dao = new UserDaoImpl();
		UserService UserService = new UserService();
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("u_id");
	 	String u_pwd = UserService.getUserPwd(request, response);
	 	String oriPwd = (String) request.getParameter("pwd_chk");
		String pwd_chk = sha256.getSHA256(oriPwd);
	
 	if(!(pwd_chk.equals(u_pwd))) {
 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('입력하신 비밀번호가 맞지 않습니다');");
 		script.println("history.back();");
 		script.println("</script>");
 		script.close();
 		
 		return;
 	} 	 	
 	
 	int result = UserService.withdrawal(request, response);

 	if (result == 1) {

 		PrintWriter script = response.getWriter();
 		script.println("<script>");		
 		script.println("alert('회원탈퇴처리 완료');");
 		script.println("location.href='matching/index.jsp'");
 		script.println("</script>");
 		script.close();

 	} else if (result == 0) {

 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('데이터베이스 오류로 회원탈퇴에 실패하였습니다..');");
 		script.println("history.back();");
 		script.println("</script>");
 		script.close();

		}
	}

	private void loginAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MatchingService matchingService = new MatchingService();
		
		HttpSession session = request.getSession();
		List<ProjectVo> list = matchingService.selectAllProject(request, response);
		session.setAttribute("projectList", list);
		
		String u_id = null;
	 	String u_pwd = null;	
	 	String u_email = null;
	 	String u_name = null;
	 	String u_photo = null;		

	 	if(request.getParameter("u_id") != null) {
	 		u_id = (String) request.getParameter("u_id");
	 	}

	 	if(request.getParameter("u_pwd") != null) {
	 		u_pwd = (String) request.getParameter("u_pwd");
	 	}

	 	UserDao dao = new UserDaoImpl();
	 	int result = dao.login(u_id, u_pwd);

	 	if (result == 1) {

	 		session.setAttribute("u_id", u_id);		
	 		u_email = dao.getUserEmail(u_id);	
	 		session.setAttribute("u_email", u_email);
	 		
	 		String emailChecked = dao.getUserEmailChecked(u_id);
	 		System.out.println("emailChecked: "+ emailChecked);
		 	if(emailChecked.equals("N")) {

		 		PrintWriter script = response.getWriter();

		 		script.println("<script>");
		 		script.println("location.href = 'matching/emailSendConfirm.jsp'");
		 		script.println("</script>");
		 		script.close();	
		 	}else {
	 		
	 		u_name = dao.getUserName(u_id);		
	 		session.setAttribute("u_name", u_name);
	 		
	 		u_photo = dao.getUserPhoto(u_id);	
	 		session.setAttribute("u_photo", u_photo);

	 		PrintWriter script = response.getWriter();
	 		
	 		script.println("<script>");		
	 		script.println("location.href='matching/index.jsp'");
	 		script.println("</script>");
	 		script.close();
		 	}
	 	} else if (result == 0) {

	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('비밀번호가 틀립니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();

	 	} else if (result == -1) {

	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('존재하지 않는 아이디입니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();

	 	} else if (result == -2) {

	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('데이터베이스 오류가 발생했습니다.');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();

	 	}
	}
	private void logoutAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("matching/index.jsp");
		
	}
	
	private void updatePwdAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		UserService UserService = new UserService();

	 	String u_id = null;
	 	String u_pwd = null;
	 	String oriPwd = null;
	 	String shaOriPwd = null;

		if(session.getAttribute("u_id") != null) {
			
			u_id = (String) session.getAttribute("u_id");	
			u_pwd = UserService.getUserPwd(request, response);
			oriPwd = (String) request.getParameter("oriPwd");
			shaOriPwd = sha256.getSHA256(oriPwd);
		}

	 	if(!(shaOriPwd.equals(u_pwd))) {
	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('현재 비밀번호를 잘못 입력하셨습니다');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		
	 		return;
	 	}
	 	
	 	if(!(request.getParameter("newPwd_chk").equals(request.getParameter("newPwd")))) {  //입력받은 새로운 비밀번호 일치 확인  
	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('새로운 비밀번호와 확인이 일치하지 않습니다');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		return;
	 	}
	 	
	 	String newPwd = (String) request.getParameter("newPwd");
	 	
	 	int result = UserService.updatePwd(request, response);

	 	if (result == 1) {

	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");		
	 		script.println("alert('비밀번호가 성공적으로 변경되었습니다.');");
	 		script.println("location.href='matching?command=mypage'");
	 		script.println("</script>");
	 		script.close();

	 	} else if (result == 2) {

	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('데이터베이스 오류로 비밀번호 변경에 실패하였습니다..');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();

	 	} 
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}
}
