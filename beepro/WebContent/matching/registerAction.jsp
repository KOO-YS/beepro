<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%> 

<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page import="com.semi.vo.UserVo"%>
<%@ page import="util.sha256"%>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");

	String u_id = null;
	String u_pwd1 = null;
	String u_pwd2 = null;
	String u_email = null;
	String u_name = null;
	
	if(request.getParameter("u_id").equals("")|| request.getParameter("u_pwd1").equals("") ||request.getParameter("u_pwd2").equals("")||
		request.getParameter("u_email").equals("")||request.getParameter("u_name").equals("")) {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();

	}else{
		u_id = (String) request.getParameter("u_id");
		u_pwd1 = sha256.getSHA256(request.getParameter("u_pwd1"));
		u_pwd2 = sha256.getSHA256(request.getParameter("u_pwd2"));
		u_email = (String) request.getParameter("u_email");
		String u_emailhash = sha256.getSHA256(u_email);
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
		
		UserDaoImpl dao = new UserDaoImpl();
		
		int result = dao.join(new UserVo(u_id, u_name, u_pwd1, u_email, sha256.getSHA256(u_email), "N"));

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
			script.println("location.href = 'emailSendAction.jsp';");							
			script.println("</script>");
			script.close();

		}

	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>