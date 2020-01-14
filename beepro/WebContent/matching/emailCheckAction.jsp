<%@page import="java.io.PrintWriter"%>
<%@page import="util.sha256"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
%> 

<%
 	request.setCharacterEncoding("UTF-8");

 	String code = request.getParameter("code");
 	System.out.println("code : "+ code);

 	UserDaoImpl dao = new UserDaoImpl();

 	String u_id = null;
 	String u_email = null;
 	
 	if(u_id == null) {
 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('로그인을 해주세요.');");
 		script.println("location.href = 'login.jsp'");
 		script.println("</script>");
 		script.close();	
 	}
 	
	if(session.getAttribute("u_id") != null) {
 		u_id = (String) session.getAttribute("u_id");
 	}	
 	
	u_email = dao.getUserEmail(u_id);	
	String rightCode = (new sha256().getSHA256(u_email).equals(code)) ? "Y" : "N";
	System.out.println("rightCode 확인 : "+rightCode);

	if(rightCode.equals("Y")) {

		dao.setUserEmailChecked(u_email);
		
		PrintWriter script = response.getWriter();
		
		System.out.println("Y로 변경");		
		script.println("<script>");
		script.println("alert('메일 인증에 성공했습니다');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		
		script.close();		

	} else {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

