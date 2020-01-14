<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@page import="java.io.PrintWriter"%>
<!doctype html>
<html lang="en">
<%	
UserDaoImpl dao = new UserDaoImpl();
String u_email = (String)session.getAttribute("u_email");
String emailChecked = dao.getUserEmailChecked(u_email);

if(emailChecked.equals("Y")) {

	PrintWriter script = response.getWriter();

	script.println("<script>");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();		
} %>

  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>BEEPRO - 이메일 인증 오류</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="css/agency.css" rel="stylesheet">

  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

  <!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.profile-bd{
  background: linear-gradient(to bottom, rgba(75,97,207) 50%, white 0%); 
}
.pf_input {
  background-color: #eee;
  border: none;
  padding: 12px 15px;
  margin: 8px 0;
  width: 100%;
  /* text-align: center; */
}
.form-check-inline {
    margin-right: 1.75rem;
}
div{
	font : 20px;
	font : 고딕;
	color : white;
	text-align: center;
}
</style>
</head>
  <body>
<body id="page-top">


  <!-- Header -->
  <header class="masthead" style="background-color: rgba(75,97,207); ">
    <div class="container">
      <div class="intro-text" style="padding-top: 150px; padding-bottom: 100px; ">
        <div class="intro-lead-in">이메일을 인증해주세요:)</div>
        	
      </div>
    </div>
  </header>
  <!-- profile -->
 

	<div class="container">

	    <div class="alert alert-warning mt-4" role="alert">
	    <br>
			가입한 이메일 주소 인증을 하셔야 Beepro 사이트 이용 가능합니다. <br>
		  	혹시 인증 메일을 받지 못하셨나요?
		  <br><br>
		</div>
		<a href="emailSendAction.jsp" class="btn btn-primary">인증 메일 다시 받기</a>

    </div>

    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">

      Copyright ⓒ 2019 beepro Rights Reserved.

    </footer>

    <!-- 제이쿼리 자바스크립트 추가하기 -->

    <script src="./js/jquery.min.js"></script>

    <!-- Popper 자바스크립트 추가하기 -->

    <script src="./js/popper.min.js"></script>

    <!-- 부트스트랩 자바스크립트 추가하기 -->

    <script src="./js/bootstrap.min.js"></script>

  </body>

</html>
