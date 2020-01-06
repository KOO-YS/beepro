<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
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

  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

  <!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">


<style>
.search-form .form-group {
  float: right !important;
  transition: all 0.35s, border-radius 0s;
  width: 32px;
  height: 32px;
  background-color: #fff;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
  border-radius: 25px;
  border: 1px solid #ccc;
}
.search-form .form-group input.form-control {
  padding-right: 20px;
  border: 0 none;
  background: transparent;
  box-shadow: none;
  display:block;
}
.search-form .form-group input.form-control::-webkit-input-placeholder {
  display: none;
}
.search-form .form-group input.form-control:-moz-placeholder {
  /* Firefox 18- */
  display: none;
}
.search-form .form-group input.form-control::-moz-placeholder {
  /* Firefox 19+ */
  display: none;
}
.search-form .form-group input.form-control:-ms-input-placeholder {
  display: none;
}
.search-form .form-group:hover,
.search-form .form-group.hover {
  width: 100%;
  border-radius: 4px 25px 25px 4px;
}
.search-form .form-group span.form-control-feedback {
  position: absolute;
  top: -1px;
  right: -2px;
  z-index: 2;
  display: block;
  width: 34px;
  height: 34px;
  line-height: 34px;
  text-align: center;
  color: #3596e0;
  left: initial;
  font-size: 14px;
}

</style>

<script type="text/javascript">

	function addPostFunction(post_no){
		var u_id = "${u_id}";
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/post?command=togglePost",
			data : {
				u_id : encodeURIComponent(u_id),
				type : encodeURIComponent("project"),
				post_no : encodeURIComponent(post_no)
			}, 
			success : function(result) {
				if (result > 0) {
					alert("해당 게시글이 관심 게시글에  추가되었습니다.");
					$('#heart').attr('class', 'heart press'); 
				} else if(result == 0){
					alert("로그인 후 이용해 주세요.");
					$('#heart').attr('class', 'heart'); 
				} else {
					alert("해당 게시글이 관심 게시글에서 삭제되었습니다. ");
					
				}
			}
		});
	}

</script>



</head>
<body id="page-top">

  <jsp:include page="common/sub_nav.jsp"></jsp:include>
  
  <!-- Header -->
  
  
  <header class="masthead" style="background-color: rgba(75,97,207);">
    <div class="container">
      <div class="intro-text" style="padding-top: 150px; padding-bottom: 100px;">
        <div class="intro-lead-in">by project</div>
        <div class="intro-heading text-uppercase">matching</div>
      </div>
    </div>
  </header>

  
  <div class="keywords">
      <div class="container">
        <div class="row" id="keywordBtns">
        	<div class="col-5">
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            <button class="btn btn-outline-primary" style="margin-right: 30px;">#keyword</button>
            </div>
            <div class="col-7">
              <!-- <div class="input-group-prepend"> -->
			    <button class="btn btn-outline-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">Action</a>
			      <a class="dropdown-item" href="#">Another action</a>
			      <a class="dropdown-item" href="#">Something else here</a>
			      <div role="separator" class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			    </div>
			  
				  <form class="form-inline md-form form-sm active-cyan-2 mt-2">
					  <input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search"
					    aria-label="Search">
					  <i class="fas fa-search" aria-hidden="true"></i>
					</form>
			  </div>
        </div>    
      </div>
  </div>
  
  
  
<!-- project -->
  <section class="bg-light page-section">
    <div class="container">
        <div class="row" >
          <div class="col-3">
              <div class="chk-block" style="margin-top:50px">
                  search
                  <hr>
					</div>
          </div>
          <div class="col-9">
            <div class="row" style="float:right; ">
               <c:if test="${!empty sessionScope.u_id }">
                  <button onclick="location.href='matching/matchingWriting.jsp'" type="button" class="col-1-4 btn btn-primary" style="width:200px; height:35px;">글쓰기</button>
               </c:if>
            </div>
              <!-- 게시물 -->
               <c:forEach var="matchingVo" items="${matchingList}" varStatus="matching">
                  <div class="row post-card" <c:if test="${matching.index == 0 }">style="margin-top:50px"</c:if>>
                       <div class="col-lg-12">
                           <div class="row">
                               <div class="col-lg-11 col-sm-10">
                               <h4><a href="matching?command=matchingView&projectM_seq=${matchingVo.projectM_seq }" >${matchingVo.title }</a></h4>
                           </div>
                           <div class="col-lg-1 col-sm-1">
                               <!-- heart -->
                               <i class="heart" id="heart" onclick="addPostFunction('${matchingVo.projectM_seq}');"></i>
                           </div>
                           <hr>
                           </div>
                           <div class="row">
                               <div class="col-lg-5" >
                                                                     모집 인원  : ${matchingVo.need_person}명 <br>
                                                                     위치 : ${matchingVo.location}<br><br>
                                                                     프로그램 및 언어 능력 : ${matchingVo.skill}
                               </div>
                               <div class="col-lg-6">
                                                                     프로젝트 시작일 : ${matchingVo.startdate}<br> 
                                                                     프로젝트 마감일 : ${matchingVo.enddate }<br>
                               </div>
                           </div>
                       </div>
                   </div>
            </c:forEach>
                <!-- 게시물 end -->
                <div class="row" style="display: block;">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#">Next</a>
                        </li>
                      </ul>
                    </nav>
                </div>
          </div>
      </div>
      
    </div>
</section>

  <jsp:include page="common/footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/matching/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/matching/js/agency.js"></script>

</body>

</html>
    