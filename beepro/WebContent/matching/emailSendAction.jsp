<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@page import="util.sha256"%>
<%@page import="util.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	UserDaoImpl dao = new UserDaoImpl();
	String u_id = null;

	if(session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}

	if(u_id == null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'matching/login.jsp'");
		script.println("</script>");
		script.close();
	}

	String emailChecked = dao.getUserEmailChecked(u_id);

	if(emailChecked.equals("Y")) {

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('이미 인증 된 회원입니다.');");
		script.println("location.href = 'matching/index.jsp'");
		script.println("</script>");
		script.close();		
	}

	String host = "http://192.168.130.12:8787/beepro/matching/";	
	String from = "teambeepro@gmail.com";
	u_id = (String) session.getAttribute("u_id");	
	String to = dao.getUserEmail(u_id);	
	System.out.println("to : "+to);

	String subject = "[beepro]회원가입을 위한 이메일 확인 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." +
		"<a href='" + host + "emailCheckAction.jsp?code=" + new sha256().getSHA256(to) + "'>이메일 인증하기</a>";

	
	// SMTP에 접속하기 위한 정보를 기입합니다.
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
	    //ses.setDebug(true);
	    MimeMessage msg = new MimeMessage(ses); 
	    msg.setSubject(subject);
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr);
	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr);
	    msg.setContent(content, "text/html;charset=UTF-8");
	    Transport.send(msg);

	} catch(Exception e){
	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");
		script.println("alert('메일 발송 중 오류가 발생했습니다');");
		script.println("history.back();");
		script.println("</script>");
		script.close();		

	    return;

	}
%>

<!doctype html>
<style>
div{
	font : 20px, bold;
	font : 고딕;
	color : white;
	text-align: center;
}
</style>
<html>

  <head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
    <title>BEEPRO - 이메일 인증</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

   <header class="masthead" style="background-color: rgba(75,97,207);">
    <div class="container">
      <div class="intro-text" style="padding-top: 150px; padding-bottom: 100px;">
        <div class="alert alert-success mt-4">
        	입력하신 이메일 주소로 인증메일이 전송되었습니다:)<br>
        	인증이 완료되면 beepro의 모든 기능을 이용하실 수 있습니다!</div>

      </div>
    </div>
  </header>

    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="./js/jquery.min.js"></script>

    <!-- Popper 자바스크립트 추가하기 -->

    <script src="./js/popper.min.js"></script>

    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="./js/bootstrap.min.js"></script>

  </body>

</html>
