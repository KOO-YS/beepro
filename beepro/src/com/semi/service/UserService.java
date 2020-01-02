package com.semi.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.UserDaoImpl;
import com.semi.vo.MessageVo;

import util.Gmail;

public class UserService {
	UserDaoImpl dao = new UserDaoImpl();
	
	
	
	//비밀번호 찾기 
	public void findPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String host = "http://localhost:8787/beepro_2/matching/";		
		String from = "teambeepro@gmail.com";		
		String u_id = request.getParameter("u_id");	
		
		String to = request.getParameter("u_email");	
		System.out.println("받는 사람 메일주소: "+to);
		System.out.println("u_id : "+u_id);
		
		String subject = "[beepro] 임시 비밀번호 안내";
		
		String newPwd = util.newPwd.createKey();
		//session.setAttribute("keyCode", keyCode);

		String content = "";
		content += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		content += "<h3 style='color: blue;'><strong>" + u_id;
		content += "님</strong>의 임시 비밀번호 입니다. 로그인 후 마이페이지에서 비밀번호를 변경하세요.</h3>";
		content += "<p>임시 비밀번호 : <strong>" + newPwd + "</strong></p><br><br></div>";
		
		int updatePwdres = dao.updatePwd(newPwd, u_id); //임시 비밀번호로 정보 변경 
		
		if(updatePwdres == 1) {
			
			System.out.println("\n******* 비밀번호 변경 성공! *********\n");
		
			Properties p = new Properties();
	
			p.put("mail.smtp.user", from);	
			p.put("mail.smtp.host", "smtp.gmail.com");	
			p.put("mail.smtp.port", "465");	
			p.put("mail.smtp.starttls.enable", "true");			
			p.put("mail.smtp.trust", "smtp.gmail.com");	
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");	
			p.put("mail.smtp.socketFactory.port", "465");	
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");	
			p.put("mail.smtp.socketFactory.fallback", "false");

		try{

		    Authenticator auth = new Gmail();

		    Session ses = Session.getInstance(p, auth);
		    //ses.setDebug(true); 발송메일 관련 정보 콘솔창 출력
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject(subject);
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    
		    Transport.send(msg);
		    
		    PrintWriter script = response.getWriter();	
		    System.out.println("\n\n rrrrrrrrr\n\n");	
		    script.println("<script>");
			script.println("alert('메일로 임시 비밀번호를 발송하였습니다');");
			script.println("history.back();");
			script.println("</script>");			
			script.close();		


		} catch(Exception e){

		    e.printStackTrace();

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('메일 발송 중 오류가 발생했습니다');");
			script.println("history.back();");
			script.println("</script>");
			script.close();		

			}
		
		}else {//새로운 비밀번호로 변경 실패
			System.out.println("\n*******비밀번호 변경 실패*********\n");
		}
	}
	
	
	/* 메세지 부분 서비스 */
	
	
	//메세지 보내는 서비스
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
	
	
	
	//주고받은 대화 리스트 서비스
	public void chatList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String send_id = request.getParameter("send_id");
		String get_id = request.getParameter("get_id");
		String listType = request.getParameter("listType");
		
		//아이디 값이(보낸사람과 받는사람) 널값이거나 비어있으면 0이라는 문자를 클라이언트에게 보낸다.
		if(send_id == null || send_id.equals("") || get_id == null || get_id.equals("")
				|| listType == null || listType.equals("")) {
			System.out.println("send_id : " + send_id );
			System.out.println("get_id : " + get_id );
			System.out.println("listType : " + listType );
			
			response.getWriter().write("");
		}else if(listType.equals("ten")) {
			response.getWriter().write(getTen(URLDecoder.decode(send_id,"UTF-8"),URLDecoder.decode( get_id,"UTF-8")));
		}else {
			try {
				response.getWriter().write(getID(URLDecoder.decode(send_id,"UTF-8"), URLDecoder.decode( get_id,"UTF-8"), listType));
			}catch(Exception e) {
				response.getWriter().write("");
			}
		}
		
	}
	
	public String getTen(String send_id, String get_id) {
		//json 사용
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDaoImpl messageDao = new UserDaoImpl();
		ArrayList<MessageVo> chatList = messageDao.getChatListByRecent(send_id, get_id, 100);
		//chatList가 비어있으면 공백 문자열을 반환한다.
		if(chatList.size() == 0) return "";		
		//chatList가 있으면 그 대화내용을 불러온다.
		for(int i = 0 ; i < chatList.size() ; i++) {
			result.append("[{\"value\": \""+chatList.get(i).getSend_id()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getGet_id()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getContent()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getRegdate()+"\"}]");
			if(i != chatList.size() -1) 
				result.append(",");
		}
		result.append("], \"last\":\""+chatList.get(chatList.size() -1).getMessageSeq()+"\"}");
		messageDao.readChat(send_id, get_id);	//모든채팅을 읽었다.
		return result.toString();
		
	}
	
	public String getID(String send_id, String get_id,String messageSeq) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDaoImpl messageDao = new UserDaoImpl();
		ArrayList<MessageVo> chatList = messageDao.getChatListBySeq(send_id, get_id, messageSeq);
		
		if(chatList.size() == 0) return "";
		
		for(int i = 0 ; i < chatList.size() ; i++) {
			result.append("[{\"value\": \""+chatList.get(i).getSend_id()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getGet_id()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getContent()+"\"},");
			result.append("{\"value\": \""+chatList.get(i).getRegdate()+"\"}]");
			if(i != chatList.size() -1) 
				result.append(",");
		}
		result.append("], \"last\":\""+chatList.get(chatList.size() -1).getMessageSeq()+"\"}");
		messageDao.readChat(send_id, get_id);
		return result.toString();
		
	}

	public void chatUnread(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String u_id = request.getParameter("u_id");
		
		if(u_id == null || u_id.equals("")) {
			response.getWriter().write("0");
		} else {
			u_id = URLDecoder.decode(u_id, "UTF-8");
			response.getWriter().write(new UserDaoImpl().getAllUnreadChat(u_id)+"");
		}
	}
	
	
	
	
	
	/* 관심 사람관련 서비스 */
	
	
}
