<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page import="com.semi.vo.UserVo"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%> 

<%
 	request.setCharacterEncoding("UTF-8");

 	String u_id = null;

 	String u_pwd = null;

 	if(request.getParameter("u_id") != null) {

 		u_id = (String) request.getParameter("u_id");

 	}

 	if(request.getParameter("u_pwd") != null) {

 		u_pwd = (String) request.getParameter("u_pwd");

 	}

 	UserDaoImpl dao = new UserDaoImpl();

 	int result = dao.login(u_id, u_pwd);

 	if (result == 1) {

 		session.setAttribute("u_id", u_id);

 		PrintWriter script = response.getWriter();

 		script.println("<script>");

 		script.println("location.href='index.jsp'");

 		script.println("</script>");

 		script.close();

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