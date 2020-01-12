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

  <title>NAME</title>

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
</head>
<body id="page-top">
<c:import url="common/nav_bar.jsp">
	<c:param name="pageName" value="main"></c:param>
</c:import>
  <%-- <jsp:include page="common/main_nav.jsp"></jsp:include> --%>
  
  <!-- Header -->
  <header class="masthead" style="background-image:url('${pageContext.request.contextPath}/matching/img/main_keyimage.jpg')">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in">matching & cowork</div>
        <div class="intro-heading text-uppercase">logo</div>
        <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Tell Me More</a>
      </div>
    </div>
  </header>

  <!-- Services -->
  <section class="page-section" id="advantage">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Advantages</h2>
          <h3 class="section-subheading text-muted">장점 픽토그램 사용</h3>
        </div>
      </div>
      <div class="row text-center">
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">E-Commerce</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">Responsive Design</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">Web Security</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="matching">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">matching</h2>
          <h3 class="section-subheading text-muted">프로젝트 & 사람 매칭 연결</h3>
        </div>
      </div>
      

      <div class="row">
        <div class="col-md-6 col-sm-6 portfolio-item" style="padding: 20px;">
          <div class="portfolio-caption">
            <h4>project</h4>
            <img src="https://previews.123rf.com/images/unitonevector/unitonevector1908/unitonevector190800830/128682281-vector-illustration-coworking-large-long-table-people-share-workspace-by-working-together-on-laptop-.jpg" alt="" style="width: 100%;">
            <button class="btn btn-primary btn-lg" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/matching?command=matchingAll'">project matching</button>
          </div>
        </div>
        <div class="col-md-6 col-sm-6 portfolio-item" style="padding: 20px;">
          <div class="portfolio-caption">
            <h4>personal</h4>
            <img src="https://media.istockphoto.com/vectors/vector-illustration-coworking-meeting-room-flat-vector-id1148521016" alt="" style="width: 100%;">
            <button class="btn btn-primary btn-lg" style="float: right;" onclick="location.href='${pageContext.request.contextPath}/personMatching?command=selectAllPer'">personal matching</button>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- About -->
  <section class="page-section" id="cowork">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">cowork</h2>
          <h3 class="section-subheading text-muted">협업 섹션</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12" style="text-align: center;">
        	<button class="btn btn-primary btn-xl" onclick="selectProject();">cowork</button>
			<img src="${pageContext.request.contextPath}/matching/img/cowork.jpg" alt="" style="width: 100%;">

        </div>
      </div>
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
	function selectProject(){
		var userId = "${u_id}";
		if(userId == ""){
			alert("로그인 후 이용 가능합니다");
			return false;
		}
		$("#selectProject").modal();
	}
</script>
</body>
</html>
    