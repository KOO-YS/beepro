package com.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.service.UserService;

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

		if (command.equals("submit")) {
			System.out.println("메세지 보내기");
			userService.chatSubmit(request, response);
			
		}

	}
}
