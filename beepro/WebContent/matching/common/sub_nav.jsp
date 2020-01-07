<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% //로그인 상태일때 로그인 세션 유지하는 부분
   String u_id = null;

	if(session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	} 
	
%> 
      <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    
    <link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet"> 
    
    <script type="text/javascript">
    	function alertLogin(){
    		alert("로그인 후 이용해 주세요.");
    	}
    </script>
    
    
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/matching/index.jsp">BeePro	</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#matching" id="match-sub" >매칭 matching</a>
            <ul class="sub-nav">
              <li><a class="nav-link" href="${pageContext.request.contextPath}/matching?command=matchingAll">by project</a></li>
              <li><a class="nav-link" href="${pageContext.request.contextPath}/personMatching?command=selectAllPer">by personal</a></li>
            </ul>
          </li>

           <%
		if(u_id == null) {
		%> 
		 <li class="nav-item">
            <a class="nav-link js-scroll-trigger" onclick="alertLogin();">협업 cowork</a>
         </li>
		<li class="nav-item" style="margin-top: 10px;">
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/matching/login.jsp'">
              login
            </button>
          </li>
          
         <% } else { 
         %> 
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/cowork/dashboard.jsp">협업 cowork</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/matching?command=mypage">마이페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/msg?command=getAllMsg&u_id=<%=u_id%>">쪽지</a>
          </li>
          <li class="nav-item" style="margin-top: 10px;">
          	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/user?command=logout'">
             logout
            </button> 
             </li>
         <%	} %>
          
         
        </ul>
      </div>
    </div>
  </nav>
  