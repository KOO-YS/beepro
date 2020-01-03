package com.semi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.MatchingDao;
import com.semi.dao.MatchingDaoImpl;
import com.semi.service.MatchingService;
import com.semi.vo.MatchingProVo;

//매칭

@WebServlet("/matching")
public class MatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MatchingServlet() {
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
	
	private void dual(HttpServletRequest request, 
			
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * dual method : get, post 방식으로 들어온 요청을 둘다 받는다
		 * 			   : 구분값 설정 필요 (hidden값(예: command) or url/(추가 url로 구분 문자열 예: userservlet/login의 login)) 
		 *			   : 구분값을 통해 service 로 값 전달
		 *  방식 예시
		 *	https://github.com/jaewookleeee/semi/blob/master/src/com/semi/controller/Controller.java#L44
		 *  */

		String command = request.getParameter("command"); //동작 구분을 위한 데이터
		System.out.println("[ " + command + " ]");
		//서비스와 연결
		MatchingService matchingService = new MatchingService();
		
		if(command.equals("matchingWrite")) {
          int success = matchingService.matchingWrite(request, response);
         
         if(success > 0) {
            System.out.println("글 게시 성공");
            //dispatch("/matching/matching.jsp", request, response);
            response.sendRedirect("matching?command=matchingAll");
         } else{
            System.out.println("글 게시 실패"); 
         }
			System.out.println("매칭 생성");
		
		} else if (command.equals("matchingAll")) {
		  System.out.println("매칭 전체 보기");
		  List<MatchingProVo> list = matchingService.matchingProAll(request);
		  request.setAttribute("matchingList", list);
		  dispatch("matching/matchingList.jsp", request, response);
		  
		} else if (command.equals("matchingRead")) {
			System.out.println("매칭 상세보기");
			MatchingProVo matchingProVo = matchingService.matchingRead(request);
			System.out.println(matchingProVo.toString());
			request.setAttribute("matchingVo", matchingProVo);
			dispatch("matching/matchingRead.jsp", request, response);
			
		} else if(command.equals("matchingDelete")) {
			System.out.println("매칭 글 삭제");
			int success = matchingService.matchingDelete(request);
			 if(success > 0) {
	            System.out.println("글 삭제 성공");
	            //dispatch("/matching/matching.jsp", request, response);
	            response.sendRedirect("matching?command=matchingAll");
	         } else{
	            System.out.println("글 수정 실패"); 
	         }
		} else if( command.equals("matchingView")) {
			System.out.println("매칭 글 수정 페이지");
			MatchingProVo matchingProVo = matchingService.matchingRead(request);
			
			request.setAttribute("matchingVo", matchingProVo);
			dispatch("matching/matchingRead.jsp", request, response);
		} else if( command.equals("matchingModifyProc")) {
			System.out.println("매칭 글 수정 수정");
			String project_seq = (String) request.getParameter("project_seq");
			int success = matchingService.matchingModifyProc(request);
			 if(success > 0) {
	            System.out.println("글 수정 성공");
	            //dispatch("/matching/matching.jsp", request, response);
	            response.sendRedirect("matching?command=matchingAll");
	         } else{
	            System.out.println("글 수정 실패"); 
	         }
		}
	}
	
		
	
}
