package com.semi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.service.ProjectService;
import com.semi.vo.TodoVo;

@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProjectServlet() {
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
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	private void dual(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * dual method : get, post 방식으로 들어온 요청을 둘다 받는다
		 * 			   : 구분값 설정 필요 (hidden값(예: command) or url/(추가 url로 구분 문자열 예: userservlet/login의 login)) 
		 *			   : 구분값을 통해 service 로 값 전달
		 *  방식 예시
		 *	https://github.com/jaewookleeee/semi/blob/master/src/com/semi/controller/Controller.java#L44
		 *  */
		String command = request.getParameter("command");
		System.out.println("[ "+command+" ]" );
		// 서비스와 연결
		ProjectService projectService = new ProjectService();
			if(command.equals("issueWrite")) {
				System.out.println("이슈 쓰기 요청");
				projectService.issueWrite(request,response);
				
			} else if(command.equals("issueDelete")) {
				System.out.println("이슈 삭제 요청");
				projectService.issueDelete(request,response);
				
			} else if(command.equals("issueAll")) {
				System.out.println("이슈 전체 보기");
				projectService.issueAll(request,response);
				
			} else if(command.equals("issueDetail")) {
				System.out.println("선택한 하나의 이슈의 정보 자세히");
				projectService.issueDetail(request,response);
				
			} else if(command.equals("todo-list")) {
				System.out.println("업무 리스트 출력");
				// index.jsp 에서 project, id 에 세션 요구됨
				List<TodoVo> todoList = projectService.selectAllTodo(1, "매니저 or 아이디");
				
				request.setAttribute("todoList", todoList);
				dispatch("cowork/todo.jsp", request, response);
				
			} else if(command.equals("todoForm")) {
				System.out.println("새 업무 생성");
				int success = projectService.insertTodo(request, response);
				
				if(success>0) {
					System.out.println("성공적으로 생성");
					dispatch("../cowork/todo.jsp", request, response);
				} else {
					System.out.println("생성 오류 발생");
				}
			
			} else if(command.equals("todo-detail")) {
				System.out.println("상세 보기 페이지");
				TodoVo detail = projectService.selectOneTodo(request, response);
				if(detail != null) {
					System.out.println("디테일 정보 출력");
					request.setAttribute("detail", detail);
					dispatch("/cowork/todoDetail.jsp", request, response);
				}
			} else if(command.equals("updateTodo")) {
				System.out.println("업무 수정");
				
			} else if(command.equals("todo-list")) {
			System.out.println("업무 리스트 출력");
			// index.jsp 에서 project, id 에 세션 요구됨
			List<TodoVo> todoList = projectService.selectAllTodo(1, "매니저 or 아이디");
			
			request.setAttribute("todoList", todoList);
			dispatch("cowork/todo.jsp", request, response);
			
		} else if(command.equals("todoForm")) {
			System.out.println("새 업무 생성");
			int success = projectService.insertTodo(request, response);
			
			if(success>0) {
				System.out.println("성공적으로 생성");
				dispatch("../cowork/todo.jsp", request, response);
			} else {
				System.out.println("생성 오류 발생");
			}

		}
	}

}
