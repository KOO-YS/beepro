<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	main_nav : section 장점 info <li> 추가 & ** 일단은 가장 우측 메뉴 login.jsp로 이어짐 
	sub_nav : 가장 우측 메뉴 profile.jsp 로 이어짐
 -->
<%@ page import="java.io.PrintWriter"%>

<%@ page import="com.semi.dao.UserDaoImpl"%>
<% //로그인 상태일때 로그인 세션 유지하는 부분
   String u_id = null;

	if(session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	} 
	
%> 
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">BeePro</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#advantage">장점 info</a>
          </li>
          <li class="nav-item">
            <!-- <a class="nav-link js-scroll-trigger" href="#matching"><span id="match-sub"> 매칭 matching </span></a> -->
            <a class="nav-link js-scroll-trigger" href="#matching" id="match-sub">매칭 matching</a>
            <ul class="sub-nav">
              <li><a class="nav-link" href="project.jsp">by project</a></li>
              <li><a class="nav-link" href="personal.jsp">by personal</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#cowork">협업 cowork</a>
          </li>

          <li class="nav-item" style="margin-top: 10px;">
          <%
		if(u_id == null) {
		%> 
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='login.jsp'">
              login
            </button>
         <% } else { 
         %> 
          	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='userLogout.jsp'">
             logout
            </button> 
            
         <%	} %>
          </li>


         
        </ul>
      </div>
    </div>
  </nav>