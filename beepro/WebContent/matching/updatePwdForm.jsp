<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page import="com.semi.vo.UserVo"%>
<%@ page import="com.semi.vo.UserVo"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="util.sha256"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%> 
<%
 	response.setCharacterEncoding("UTF-8");
	UserDaoImpl dao = new UserDaoImpl();

 	String u_id = null;
 	String u_pwd = null;
 	String oriPwd = null;
 	String shaOriPwd = null;
 	String newPwd = null;

	if(session.getAttribute("u_id") != null) {
		
		u_id = (String) session.getAttribute("u_id");	
		u_pwd = dao.getUserPwd(u_id);
		oriPwd = (String) request.getParameter("oriPwd");
		shaOriPwd = sha256.getSHA256(oriPwd);
	}

 	if(!(shaOriPwd.equals(u_pwd))) {
 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('현재 비밀번호가 틀립니다');");
 		script.println("history.back();");
 		script.println("</script>");
 		script.close();
 		
 		return;
 	}
 	
 	if(!(request.getParameter("newPwd_chk").equals(request.getParameter("newPwd")))) {  //입력받은 새로운 비밀번호 일치 확인  
 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('새로운 비밀번호와 확인이 일치하지 않습니다');");
 		script.println("history.back();");
 		script.println("</script>");
 		script.close();
 		return;
 	}
 	
 	newPwd = (String) request.getParameter("newPwd");
 	
 	int result = dao.updatePwd(newPwd, u_id);

 	if (result == 1) {

 		PrintWriter script = response.getWriter();
 		script.println("<script>");		
 		script.println("alert('비밀번호가 성공적으로 변경되었습니다.');");
 		script.println("location.href='mypage.jsp'");
 		script.println("</script>");
 		script.close();

 	} else if (result == 2) {

 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('데이터베이스 오류로 비밀번호 변경에 실패하였습니다..');");
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