package com.semi.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.semi.dao.UserDaoImpl;
import com.semi.vo.HeartVo;
import com.semi.vo.MessageVo;
import com.semi.vo.MsgVo;

import util.Gmail;

public class UserService {
	UserDaoImpl dao = new UserDaoImpl();

	/* 유저관리 부분 서비스 */	
	
	//임시 비밀번호 재설정
	public void findPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String host = "http://localhost:8787/beepro/matching/";		
		String from = "teambeepro@gmail.com";		
		String u_id = request.getParameter("u_id");			
		String to = request.getParameter("u_email");			
	 	String u_name = request.getParameter("u_name");	
	 	
	 	//DB에 가입된 회원정보 비교
	 	String db_email = dao.getUserEmail(u_id);
	 	String db_name = dao.getUserName(u_id);	 		 	
	 		 	
		if((u_name.equals(db_name)) == false) {
			PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('가입시 입력하신 이름과 일치하지 않습니다');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();		
	 		
		}else if((to.equals(db_email))== false) {
			PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('가입시 입력하신 이메일과 일치하지 않습니다');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();	
	 		
		}else {

		 	int result = dao.CheckID(u_id);
	
		 	if (result == 1) {
			System.out.println("**등록된 회원정보와 일치하여 가입한 이메일로 임시 비밀번호 전송완료**");

			String subject = "[beepro] 임시 비밀번호 안내";		
			String newPwd = util.newPwd.createKey();
	
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
			}
	 	} else if (result == 0) {

	 		PrintWriter script = response.getWriter();

	 		script.println("<script>");
	 		script.println("alert('가입되지 않은 회원입니다');");
	 		script.println("history.back();");
	 		script.println("</script>");
	 		script.close();
	 		}
	 	} 
	}		

	//프로필 사진 업로드
	public void profileUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MultipartRequest multi = null;
		int fileMaxSize = 10*1024*1024;
		String savePath =request.getServletContext().getRealPath("upload");
		HttpSession session = request.getSession();
	    String u_id = (String)session.getAttribute("u_id");
	
		System.out.println("1. savePath : " + savePath);
		
		try {			
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
	
			String userID = multi.getParameter("u_id");			
			String fileName = "";
			File file = multi.getFile("userProfile");
			
			if(file !=null) {
				String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
						if(ext.equals("jpg")|| ext.equals("png")|| ext.equals("gif")) {
							
							String prev = new UserDaoImpl().getUserPhoto(userID);
							File prevFile = new File(savePath + "/"+prev);
							if(prevFile.exists()) {
								System.out.println("---중복파일 존재---");
								prevFile.delete();//기존파일 있다면 삭제							
							}
							fileName = file.getName();
						}else {
							if(file.exists()) {
								file.delete();
							}
						}
					new UserDaoImpl().changePhoto(userID,fileName);
					String u_photo = dao.getUserPhoto(u_id);	
			 		session.setAttribute("u_photo", u_photo);
					System.out.println("---DB에 프로필 변경완료---");
					response.sendRedirect("matching?command=mypage");
				}
		
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("matching?command=mypage");
			}
	}
	public String getUserPwd(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");
		return dao.getUserPwd(u_id);
	}
	
	public int withdrawal(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");
		return dao.withdrawal(u_id);
	}
	
	public int updatePwd(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");
		String newPwd = (String) request.getParameter("newPwd");
		return dao.updatePwd(newPwd, u_id);
	}
	
	public int CheckID(HttpServletRequest request, HttpServletResponse response) {
		String u_id = request.getParameter("u_id");

		return dao.CheckID(u_id);
	}

	public int naverRegister(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("u_id");
		String u_email = (String) session.getAttribute("u_email");
		String u_name = (String) session.getAttribute("u_name");
		
		return dao.naverRegister(u_id, u_name,u_email);
		
	}



	
	/* 메세지 부분 서비스 */

	// 메세지 보내는 서비스
	public void chatSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String send_id = request.getParameter("send_id");
		String get_id = request.getParameter("get_id");
		String chatContent = request.getParameter("content");

		System.out.println("send_id : " + send_id);
		System.out.println("get_id : " + get_id);

		// 아이디 값이(보낸사람과 받는사람) 널값이거나 비어있으면 0이라는 문자를 클라이언트에게 보낸다.
		if (send_id == null || send_id.equals("") || get_id == null || get_id.equals("") || chatContent == null
				|| chatContent.equals("")) {
			response.getWriter().write("0");
		} else if (send_id.equals(get_id)) {
			response.getWriter().write("-1");
		} else {
			// 보내는사람과 받는 사람이 있을 때 보낸다.
			send_id = URLDecoder.decode(send_id, "UTF-8");
			get_id = URLDecoder.decode(get_id, "UTF-8");
			chatContent = URLDecoder.decode(chatContent, "UTF-8");
			response.getWriter().write(new UserDaoImpl().submit(send_id, get_id, chatContent) + "");

		}

	}

	// 주고받은 대화 리스트 서비스
	public void chatList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String send_id = request.getParameter("send_id");
		String get_id = request.getParameter("get_id");
		String listType = request.getParameter("listType");

		System.out.println("send_id : " + send_id);
		System.out.println("get_id : " + get_id);
		System.out.println("listType : " + listType);

		// 아이디 값이(보낸사람과 받는사람) 널값이거나 비어있으면 0이라는 문자를 클라이언트에게 보낸다.
		if (send_id == null || send_id.equals("") || get_id == null || get_id.equals("") || listType == null
				|| listType.equals("")) {

			response.getWriter().write("");
		} else if (listType.equals("ten")) {

			response.getWriter().write(getTen(URLDecoder.decode(send_id, "UTF-8"), URLDecoder.decode(get_id, "UTF-8")));

		} else {
			try {
				response.getWriter().write(
						getID(URLDecoder.decode(send_id, "UTF-8"), URLDecoder.decode(get_id, "UTF-8"), listType));
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}

	}

	public String getTen(String send_id, String get_id) {

		// json 사용
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDaoImpl messageDao = new UserDaoImpl();
		ArrayList<MessageVo> chatList = messageDao.getChatListByRecent(send_id, get_id, 100);
		// chatList가 비어있으면 공백 문자열을 반환한다.
		if (chatList.size() == 0)
			return "";
		// chatList가 있으면 그 대화내용을 불러온다.
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getSend_id() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getGet_id() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getRegdate() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getMessageSeq() + "\"}");
		messageDao.readChat(send_id, get_id); // 모든채팅을 읽었다.

		System.out.println(result.toString());
		return result.toString();

	}

	public String getID(String send_id, String get_id, String messageSeq) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDaoImpl messageDao = new UserDaoImpl();
		ArrayList<MessageVo> chatList = messageDao.getChatListBySeq(send_id, get_id, messageSeq);

		if (chatList.size() == 0)
			return "";

		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getSend_id() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getGet_id() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getRegdate() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getMessageSeq() + "\"}");
		messageDao.readChat(send_id, get_id);
		return result.toString();

	}

	public void chatUnread(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String u_id = request.getParameter("u_id");

		if (u_id == null || u_id.equals("")) {
			response.getWriter().write("0");
		} else {
			u_id = URLDecoder.decode(u_id, "UTF-8");
			response.getWriter().write(new UserDaoImpl().getAllUnreadChat(u_id) + "");
		}
	}

	public void oneUnread(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String u_id = request.getParameter("u_id");
		String send_id = request.getParameter("send_id");

		if (u_id == null || u_id.equals("")) {
			response.getWriter().write("0");
		} else {
			u_id = URLDecoder.decode(u_id, "UTF-8");
			response.getWriter().write(new UserDaoImpl().getUnreadChat(send_id, u_id) + "");
		}
	}

	public void chatBox(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String u_id = request.getParameter("u_id");
		if (u_id == null || u_id.equals("")) {
			response.getWriter().write("");
		} else {
			try {
				u_id = URLDecoder.decode(u_id, "UTF-8");
				response.getWriter().write(getBox(u_id) + "");
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
	}

	public String getBox(String u_id) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		UserDaoImpl chatDAO = new UserDaoImpl();
		ArrayList<MessageVo> chatList = chatDAO.getBox(u_id);
		if (chatList.size() == 0)
			return "";
		for (int i = chatList.size() - 1; i >= 0; i--) {

			String unread = "";
			if (u_id.equals(chatList.get(i).getGet_id())) {
				unread = chatDAO.getUnreadChat(chatList.get(i).getSend_id(), u_id) + "";
				if (unread.equals("0")) {
					unread = "";
				}
			}
			result.append("[{\"value\": \"" + chatList.get(i).getSend_id() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getGet_id() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getRegdate() + "\"},");
			result.append("{\"value\": \"" + unread + "\"}]");
			if (i != 0) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getMessageSeq() + "\"}");
		return result.toString();
	}

	
	
	
	
	
	/* 쪽지 서비스 */

	// 쪽지 보내기 서비스
	public void sendMsg(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String send_id = request.getParameter("send_id");
		String get_id = request.getParameter("get_id");
		String content = request.getParameter("content");
		
		String history = request.getParameter("backMsgBox");
		
		System.out.println("send_id : " + send_id);
		System.out.println("get_id : " + get_id);
		System.out.println("content : " + content);

		// 아이디 값이(보낸사람과 받는사람) 널값이거나 비어있으면 0이라는 문자를 클라이언트에게 보낸다.
		if (send_id == null || send_id.equals("") || get_id == null || get_id.equals("") || content == null
				|| content.equals("")) {
			response.getWriter().write("<script type='text/javascript'>alert('내용을 입력해 주세요'); history.back(); </script>");
		} else {
			// 보내는사람과 받는 사람이 있을 때 보낸다.
			send_id = URLDecoder.decode(send_id, "UTF-8");
			get_id = URLDecoder.decode(get_id, "UTF-8");
			content = URLDecoder.decode(content, "UTF-8");

			if (dao.insertMsg(send_id, get_id, content) > 0) {
				System.out.println("쪽지 보내기 성공");
			
			} else {
				System.out.println("쪽지 보내기 실패");
			}

			if(history.equals("backMsgBox")) {
				dispatch("msg?command=getAllMsg&u_id="+send_id,request,response);
			}else {
				response.getWriter().write("<script type='text/javascript'>alert('쪽지보내기 성공'); history.back(); </script>");
			}
		}

	}
	
	// 보낸 쪽지 삭제 서비스
	public void deleteSendMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String[] list = request.getParameterValues("list");
		System.out.println(list[0]);

		if (dao.deletSendMsg(list)>0) {
			System.out.println("보낸 쪽지 삭제 성공");
			response.getWriter().write("1");
		} else {
			System.out.println("보낸 쪽지 삭제 실패");
			response.getWriter().write("-1");
		}

	}
	
	// 받은 쪽지 삭제 서비스
	public void deleteGetMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String[] list = request.getParameterValues("list");
		
		if (dao.deletGetMsg(list)>0) {
			System.out.println("받은 쪽지 삭제 성공");
			response.getWriter().write("1");
		} else {
			System.out.println("보낸 쪽지 삭제 실패");
			response.getWriter().write("-1");
		}
		
	}
	//읽지 않은 쪽지 갯수
	public void ureadAllMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String u_id = request.getParameter("u_id");

		if (u_id == null || u_id.equals("")) {
			response.getWriter().write("0");
		} else {
			u_id = URLDecoder.decode(u_id, "UTF-8");
			response.getWriter().write(new UserDaoImpl().getUnreadAllMsg(u_id) + "");
		}
	}
	
	//받은 쪽지 목록 불러오기
	public void getAllMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		 ArrayList<MsgVo> list = new  ArrayList<MsgVo>();
		
		String u_id = request.getParameter("u_id");
		if (u_id == null || u_id.equals("")) {
			System.out.println("로그인 안하고 쪽지 페이지");
		} else {
			System.out.println("받은 쪽지함 출력");
			
			list = dao.getAllMsg(u_id);
			request.setAttribute("list", list);
			
			ArrayList<Integer> readList =  dao.readChk(u_id);
			request.setAttribute("readList", readList);
			
			dispatch("/matching/messageGetBox.jsp",request,response);
		}
	}
	
	//보낸 쪽지 목록
	public void sendAllMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		 ArrayList<MsgVo> list = new  ArrayList<MsgVo>();
		
		String u_id = request.getParameter("u_id");
		if (u_id == null || u_id.equals("")) {
			System.out.println("로그인 안하고 쪽지 페이지");
		} else {
			System.out.println("보낸 쪽지함 출력");
			
			list = dao.sendAllMsg(u_id);
			request.setAttribute("list", list);
			
			ArrayList<Integer> readList =  dao.sendMsgReadChk(u_id);
			request.setAttribute("readList", readList);
			
			dispatch("/matching/messageSendBox.jsp",request,response);
		}
	}
	
	// 쪽지 읽음 처리
	public void readMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		if (no == 0) {
			System.out.println("메세지 번호 못받아옴");
		} else {
			System.out.println("메세지 읽음");
			response.getWriter().write(dao.readMsg(no));
		}
		
	}
	
	public void msgUnread(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String u_id = request.getParameter("u_id");

		if (u_id == null || u_id.equals("")) {
			response.getWriter().write("0");
		} else {
			u_id = URLDecoder.decode(u_id, "UTF-8");
			response.getWriter().write(new UserDaoImpl().getUnreadAllMsg(u_id) + "");
		}
	}
	
	
	
	
	
	
	/* 관심 사람 서비스 (heart) */
	
	
	public void follow(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
	    String send_id = (String)session.getAttribute("u_id");
	    String get_id = request.getParameter("get_id");
	    
	    HeartVo vo = new HeartVo(send_id, get_id);
	   
	    
	    if(dao.heartChk(send_id, get_id) > 0) {
	    	System.out.println("팔로우 완료");
	    	if(dao.insertHeart(vo) > 0) {
	    		response.getWriter().write("1");
	    	}
	    } else {
	    	System.out.println("언팔로우");
	    	if(dao.deleteHeart(vo) > 0) {
	    		response.getWriter().write("-1");
	    	}
	    }
	}
	
	public ArrayList<String> getAllFollowing(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
	    String u_id = (String)session.getAttribute("u_id");
		
	    UserDaoImpl userDAO = new UserDaoImpl();
		
		ArrayList<String> list = new ArrayList<String>();
		list = userDAO.selectFollowing(u_id);
		
		return list;
	}
	
	public String followerCount(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	    UserDaoImpl userDAO = new UserDaoImpl();
		String userId = request.getParameter("userId");
		
		String followers =  userDAO.followerCount(userId)+"";
		return followers;
	}
	
	public String followingCount(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	    UserDaoImpl userDAO = new UserDaoImpl();
		String userId = request.getParameter("userId");
		
		String follwing = userDAO.followingCount(userId)+"";
		return follwing;
	}
	

	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}




}
