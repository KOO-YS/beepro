<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page import="com.semi.vo.UserVo"%>
<%@ page import="java.io.PrintWriter"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%> 
<%
 	request.setCharacterEncoding("UTF-8");
	UserDaoImpl dao = new UserDaoImpl();

 	String u_id = null;
 	String u_pwd = null;
 	String u_email = null;
 	String u_name = null;
 	String shaOriPwd = null;

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
 	}
 	
 	if(!(request.getParameter("newPwd_chk").equals(request.getParameter("newPwd")))) {  //입력받은 새로운 비밀번호 일치 확인  
 		PrintWriter script = response.getWriter();

 		script.println("<script>");
 		script.println("alert('새로운 비밀번호와 확인이 일치하지 않습니다');");
 		script.println("history.back();");
 		script.println("</script>");
 		script.close();
 	}
 	
 	int result = dao.login(u_id, u_pwd);

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
 		script.println("alert('새로운 비밀번호를 다시 입력해주세요.');");
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


public int updatePwd(String newPwd, String u_id)
<form action="updatePwdForm">
      <div class="modal-body">
      
        	  <div class="form-group">
			    <label for="oriPwd">기존 패스워드</label>
			    <input type="password" class="form-control" id="oriPwd" required>
			  </div>
			  <hr>
			  <div class="form-group">
			    <label for="newPwd">새 패스워드</label>
			    <input type="password" class="form-control" id="newPwd" required>
			  </div>
			  <div class="form-group">
			    <label for="newPwd_chk">새 패스워드 확인</label>
			    <input type="password" class="form-control" id="newPwd_chk" required aria-describedby="pwdinfo">
			    <small id="pwdinfo" class="form-text text-muted">위와 같게 입력해주시기 바랍니다</small>
			  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">변경</button>

</body>
</html>