<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page import="java.util.List" %>
<%@ page import="com.semi.vo.ProjectVo" %>

<% //로그인 상태일때 로그인 세션 유지하는 부분
   String u_id = null;

	if(session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
	
	// 로그인 상태일 때 프로젝트 세션 유지하는 부분
	List<ProjectVo> project = null;
    if(session.getAttribute("projectList") != null){
    	project = (List)session.getAttribute("projectList");
    }
%> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
   function getUnread(){
      $.ajax({
         type : "POST",
         url : "${pageContext.request.contextPath}/msg?command=msgUnread",
         data : {
            u_id : encodeURIComponent('<%=u_id%>')
         },
         success : function(result){
            
            if(result >= 1){   //결과값이 1보다 크면 결과 출력
               showUnread(result);
            } else{
               showUnread('');
            }
         }
         
      });
   }
   function getInfiniteUnread(){
      setInterval(function(){
         getUnread();
      }, 4000);
   }
   function showUnread(result){
      $('#unread').html(result);
   }
   
</script>
<style type="text/css">
.arrow_box {
	position: relative;
	background: #ffffff;
}
.arrow_box:after {
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(255, 255, 255, 0);
	border-bottom-color: #ffffff;
	border-width: 30px;
	margin-left: -30px;
}

</style>
<%
	String pageName = request.getParameter("pageName");
%>

<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
   		<% if(pageName.equals("main")){		%>
	    		<!-- <a class='navbar-brand js-scroll-trigger' href='#page-top'>BeePro</a> -->
	    		<a class='navbar-brand js-scroll-trigger' href='#page-top'><img src="${pageContext.request.contextPath}/matching/img/logo.png" style="width: 7vw;"></a>
	    <% } else {		%>
	        	<a class='navbar-brand js-scroll-trigger' href='matching?command=main'><img src="${pageContext.request.contextPath}/matching/img/logo.png" style="width: 7vw;"></a>
	    <% } %>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="">
        <ul class="navbar-nav text-uppercase ml-auto">
        <% 	if(pageName.equals("main")){ %>
	    		<li class='nav-item'>
          		<a class='nav-link js-scroll-trigger' href='#advantage'>장점 info</a>
          		</li>
	   	<%	}	%>
          <li class="nav-item">
            <!-- <a class="nav-link js-scroll-trigger" href="#matching"><span id="match-sub"> 매칭 matching </span></a> -->
            <a class="nav-link js-scroll-trigger" href="#matching" id="match-sub">매칭 matching</a>
            <ul class="sub-nav">
              <li><a class="nav-link" href="${pageContext.request.contextPath}/matching?command=matchingAll">by project</a></li>
              <li><a class="nav-link" href="${pageContext.request.contextPath}/personMatching?command=selectAllPer">by personal</a></li>
            </ul>
          </li>
          <% if(pageName.equals("main")){ %>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#cowork">협업 cowork</a>
	          </li>
          <% } else { %>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/matching?command=main#cowork">협업 cowork</a>
	          </li>
          <% }
		if(u_id == null) {
		%> <li class="nav-item" style="margin-top: 10px;">
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/matching/login.jsp'">
              login
            </button>
             </li>
         <% } else { %> 
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/matching?command=mypage">마이페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/msg?command=getAllMsg&u_id=<%=u_id%>">쪽지
            <!-- Counter - Messages -->
            <span class="badge badge-danger badge-counter" id="unread"></span>
            </a>
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
  
<%-- <div class="modal fade" id="selectProject" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="selectProjectLabel">프로젝트를 선택해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	  <div class="form-group" style="text-align:center;">
       	  	<c:if test="${ empty  projectList}">
				<div class="col-lg-8 mb-8"> 
					프로젝트가 존재하지 않습니다<br>
					<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/matching?command=matchingAll'" >매칭 게시판 가기</button>
				</div>
			</c:if>
		    <c:forEach var="project" items="${projectList}">
		    	<button type="button" class="btn btn-primary col-6" onclick="location.href='project?command=goToProject&projectSeq=${project.projectSeq}'" style="margin:20px 0;">
				  ${project.projectName}
				</button>
		    </c:forEach>
		  </div>
      </div>
      <div class="modal-footer">
		</div>
      </div>
    </div>
  </div> --%>