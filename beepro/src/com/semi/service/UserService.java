package com.semi.service;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.UserDaoImpl;

public class UserService {
	
	public void chatSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String send_id = request.getParameter("send_id");
		String get_id = request.getParameter("get_id");
		String chatContent = request.getParameter("chatContent");
		
		//아이디 값이(보낸사람과 받는사람) 널값이거나 비어있으면 0이라는 문자를 클라이언트에게 보낸다.
		if(send_id == null || send_id.equals("") || get_id == null || get_id.equals("")
				|| chatContent == null || chatContent.equals("")) {
			response.getWriter().write("0");
		}else if(send_id.equals(get_id)) {
			response.getWriter().write("-1");
		}else {
			//보내는사람과 받는 사람이 있을 때 보낸다.
			send_id = URLDecoder.decode(send_id, "UTF-8");
			get_id = URLDecoder.decode(get_id,"UTF-8");
			chatContent = URLDecoder.decode(chatContent, "UTF-8");
			response.getWriter().write(new UserDaoImpl().submit(send_id, get_id, chatContent)+"");
			
		}
		
		
	}
	

}
