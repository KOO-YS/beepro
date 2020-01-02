package com.semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.UserDaoImpl;
import com.semi.service.UserService;
import com.semi.vo.MessageVo;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		dual(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			
		}else if (command.equals("findPwd")) {
			System.out.println("비밀번호 찾기");
			
			try {
				userService.findPwd(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("chatList")) {
			System.out.println("주고받은 대화 반환");
			userService.chatList(request, response);
		}else if(command.equals("chatUnread")) {
			System.out.println("읽지 않은 메세지");
			userService.chatUnread(request, response);
		} else if (command.equals("chatBox")) {
			System.out.println("대화 목록");
			String u_id = request.getParameter("u_id");
			UserDaoImpl chatDAO = new UserDaoImpl();
			ArrayList<MessageVo> list = chatDAO.getBox(u_id);
			request.setAttribute("list", list);
			dispatch("/cowork/chatList.jsp", request, response);
		}else if (command.equals("chatting")) {
			System.out.println("채팅하기");
			String get_id = request.getParameter("get_id");
			request.setAttribute("get_id", get_id);
			dispatch("/cowork/chat.jsp", request, response);
		}else if(command.equals("sendHeart")) {
			System.out.println("하트보내기");
			
		}

	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
