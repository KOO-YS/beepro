<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 




                                             main.jsp 를 통해서 실행해주세요!!!!! 




-->
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>BEEPRO - MAIN</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet">
  <style type="text/css">
  #Cbutton {
  width: 250px;
  height: 80px;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 1.8px;
  font-weight:bold;
  color: #fff;
  background-color: #fed136;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

#Cbutton:hover {
  background-color:#fed136;
  box-shadow: 0px 15px 20px rgba(255, 215, 75, 0.6);
  color: #fff;
  transform: translateY(-7px);
}

  </style>
</head>
<style type="text/css">
#s1 { width:500px;
      height:700px;
      float:left;
      margin-left:120px;}

#s2 { width:500px;
      height:700px;
      float:right;
      margin-right:50px;
      margin-top:350px;}  

#cowork { background-image:url('${pageContext.request.contextPath}/matching/img/cowork_keyimage.png');
          background-repeat: no-repeat;
          width:100%;
          height:800px;
          margin-top:700px;}
          
#cowork-title { width:500px;
                height:auto;
                font-size:45px;
                font-weight:bold;
                margin-left:120px;
                padding-top:165px;
              }

#cowork-button { margin-top:100px;
                 margin-left:120px;
               }

#Cbutton {
  width: 250px;
  height: 80px;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 1.8px;
  font-weight:bold;
  color: #fff;
  background-color: #fed136;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

#Cbutton:hover {
  background-color:#fed136;
  box-shadow: 0px 15px 20px rgba(255, 215, 75, 0.6);
  color: #fff;
  transform: translateY(-7px);
}

#Cbutton2 {
  width: 200px;
  height: 80px;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 1.8px;
  font-weight:bold;
  color: #fff;
  background-color: #fed136;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

#Cbutton2:hover {
  background-color:#fed136;
  box-shadow: 0px 15px 20px rgba(255, 215, 75, 0.6);
  color: #fff;
  transform: translateY(-7px);
}

#bee { z-index:999;
       margin-top:-94px;
       margin-left:294px;

     } 

#b1 { width:250px;
      height:auto;
      margin-top:180px;
      float:right;}
      
#b1 { width:250px;
      height:auto;
      margin-top:300px;
      float:left;}
</style>
<body id="page-top">
<c:import url="common/nav_bar.jsp">
   <c:param name="pageName" value="main"></c:param>
</c:import>
  
  <!-- Header -->
  <header class="masthead" style="background-image:url('${pageContext.request.contextPath}/matching/img/main.jpg')">
    <div class="container">
      <div class="intro-text">
	 <div class="intro-heading" style="color:black; text-align:left; font-size:50px; line-height:67.257px; letter-spacing :-1px;word-spacing:-4px;" >누구나 쉽고 빠르게<br>프로젝트를 만들고<br>협업하는 가장 쉬운 공간</div>     
        <button class='js-scroll-trigger' onclick="startProject();" style="float:left;" id="Cbutton">Beepro 시작하기</button>
      </div>
    </div>
  </header>

  <!-- Services -->
  <section class="page-section" id="advantage" style="padding-top:140px; padding-bottom:300px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Advantages</h2>
          <h3 class="section-subheading "></h3>
        </div>
      </div>
      <div class="row text-center">
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-hands-helping fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">MATCHING SYSTEMS</h4>
          <p class="text-muted">Beepro에는 참여할 수 있는 다양한  프로젝트와 <br> 다양한 사람들이 있습니다. <br>지금 바로 함께할 팀원들을 찾아보세요.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-users fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">COLLABORATION TOOLS</h4>
          <p class="text-muted">내맘대로 작성하는  워크프로우로 프로젝트의 <br> 업무 진행현황을 쉽고 재미있게 관리해보세요.<br> 일정관리, 이슈관리, 진행상황까지 하나로 끝!</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-hand-holding-usd fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">FREE SERVICE</h4>
          <p class="text-muted">초보 개발자 및 학생 개발자를 위해 <br>Beepro의 모든 기능들은 무료로 제공됩니다. <br>부담없이 포트폴리오를 채워보세요!</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="matching">
     <div id="s1">
       <img src="${pageContext.request.contextPath}/matching/img/personal.png" width=430>
     </div>
    
     <div id="s2">
       <img src="${pageContext.request.contextPath}/matching/img/project.jpg" width=430>
     </div>
     
       <div id="b1">
          <button onclick="selectProject();" id="Cbutton" >Personal Matching</button>
       </div>
       
     <div id="b2">
         <button onclick="selectProject();" id="Cbutton">Project Matching</button>
       </div>
  </section>

  <!-- About -->
  <section class="page-section" id="cowork">
     <div id="cowork-title">
        <p>Better Efficiency for Your Business with <span style="color:rgb(75,97,207)">BEE</span><span style="color:#fed136">PRO</span></p>
     </div>
     
     <div id="bee">
        <img src="${pageContext.request.contextPath}/cowork/images/bee.png" width=43 height=auto>
     </div>
     
     <div id="cowork-button">
        <button onclick="selectProject();" id="Cbutton">GO COWORK</button>
     </div>
  </section>
  
   <jsp:include page="common/footer.jsp"></jsp:include>

<!-- 프로젝트 생성 -->
<div class="modal fade" id="selectProject" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
               <c:if test="${ empty projectList}">
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
  </div>
</div>
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/matching/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery-easing/jquery.easing.min.js"></script>
  
  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/matching/js/agency.js"></script>

<script type="text/javascript">
	function startProject(){
		var userId = "${u_id}";
      	if(userId == ""){
         	alert("로그인 후 이용 가능합니다");
         	location.href='${pageContext.request.contextPath}/matching/login.jsp';
         	return false;
      	} else {
      		location.href='#advantage';
      	}
	}

   	function selectProject(){
      	var userId = "${u_id}";
      	if(userId == ""){
         	alert("로그인 후 이용 가능합니다");
         	location.href='${pageContext.request.contextPath}/matching/login.jsp'; 
         	return false;
      	}
      	$("#selectProject").modal();
   	}
</script>
</body>
</html>
    