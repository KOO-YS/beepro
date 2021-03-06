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

  <title>BEEPRO - 프로젝트 매칭 리스트</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
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
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$(document).ready(function(){
			$(".dropdown-menu .dropdown-item").on("click", function(){
				var data = $(this).data("cat");
				$("[name=searchCat]").val(data);
			});
			$("#searchIcon").click(function(){
		    	 if($("[name=searchCat]").val() == ""){
		    		 alert("분류를 선택해주세요."); 
		    		 $("sort").focus(); return false;
		    	}else{
		    		$("[name=searchForm]").submit();
		    	}
		   	});
		});
		
		$("#location").click( function() {
		    if( $("#sort").html() != '지역' ) {
		      $("#sort").html('지역');
		    }
		  });
		  
		  $("#skill").click( function() {
		    if( $("#sort").html() != '사용 언어' ) {
		      $("#sort").html('사용 언어');
		    }
		  });
		  
		  $("#pm_id").click( function() {
		    if( $("#sort").html() != '작성자' ) {
		      $("#sort").html('작성자');
		    }
		  });
	});
	
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
				} else if(result == 0){
					alert("로그인 후 이용해 주세요.");
					location.reload();
				} else {
					alert("해당 게시글이 관심 게시글에서 삭제되었습니다. ");
				}
			}
		});
	}
</script>
</head>
<body id="page-top">
  <c:import url="common/nav_bar.jsp">
  	<c:param name="pageName" value="matching"></c:param>
  </c:import>
  <%-- <jsp:include page="common/sub_nav.jsp"></jsp:include> --%>
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
            </div>
            <div class="col-12"  style="float:left; ">
              <!-- <div class="input-group-prepend"> -->
              <form action="${pageContext.request.contextPath}/matching" method="post" name="searchForm">
              	<input type="hidden" name="command" value="matchingAll" />
              	<input type="hidden" name="searchCat" value="" />
			  	<div>
			  		<button style="left;" class="btn btn-outline-primary dropdown-toggle" id="sort" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분류</button>
				    <div class="dropdown-menu">
				      <a class ="dropdown-item" href="#none" id="pm_id" data-cat="pm_id">작성자 아이디</a>
				      <a class="dropdown-item" href="#none" id="skill" data-cat="skill">사용 언어</a>
				      <a class="dropdown-item" href="#none" id="location" data-cat="location">지역</a>
				    </div>
				    
				  <input class="form-control form-control-sm mr-3 w-50" type="text" placeholder="Search" name="searchKeyword"
				    aria-label="Search" style="display: inline-block; margin-left:1%; height:40px;">
				    <button type="button" class="btn btn-primary" id="searchIcon"><i class="fa fa-search" aria-hidden="true" style="cursor: pointer;height:25px;" ></i></button>
				 </div>
				  </form>
			  </div>
        </div>    
      </div>
  </div>
  
<!-- project -->
  <section class="bg-light page-section">
    <div class="container">
        <div class="row" >
            <div class="row" style="float:right; ">
               <c:if test="${!empty sessionScope.u_id }">
                  <button onclick="location.href='matching/matchingWriting.jsp'" type="button" class="col-1-4 btn btn-primary" style="width:200px; height:35px; margin-left:950px;">새 글 작성</button>
               </c:if>
            </div>
          <div class="col-12" style="margin-top: 20px">
              <!-- 게시물 -->
               <c:forEach var="matchingVo" items="${matchingList}" varStatus="matching" begin="${page.startRow}" end="${page.startRow + 9}">
               																			<!-- 페이징 : begin부터 +9까지 -->
                  <!-- 하트 색 유지 -->
								<c:forEach var="postList" items="${postList}">
									<c:if test="${ postList eq matchingVo.projectM_seq}">
										<script type="text/javascript">
										$( document ).ready(function() {
											$('#heart${matchingVo.projectM_seq}').attr('class','heart press');
										});
										</script>
									</c:if>
								</c:forEach>
                  <div class="row post-card">
                       <div class="col-lg-12">
                           <div class="row">
                               <div class="col-lg-10 col-sm-9" style="margin-left:40px;">
                               <h4><a href="matching?command=matchingView&projectM_seq=${matchingVo.projectM_seq }" >${matchingVo.title }</a></h4>
                           </div>
                           <div class="col-lg-1 col-sm-1">
                               <!-- heart -->
							<i class="heart" id="heart${matchingVo.projectM_seq}"
									onclick="addPostFunction('${matchingVo.projectM_seq}');"></i>
						    </div>
                           <hr>
                           </div>
                           <div class="row">

 
                               <div class="col-lg-4"  style="margin-left:40px">
                              <b>모집 인원 : </b> ${matchingVo.need_person}명 <br>
                              <b>위	치  : </b> ${matchingVo.location}<br><br>
                              <b>프로그램 및 언어  :</b> ${matchingVo.skill}
                               </div>
                               <div class="col-lg-3"  style="margin-left:20px">
                              <b>프로젝트 시작일  :</b> ${matchingVo.startdate}<br> 
                              <b>프로젝트 마감일  :</b> ${matchingVo.enddate }<br>
                               </div>
                           </div>
                       </div>
                   </div>
            </c:forEach>
                <!-- 게시물 end -->
          </div>
      </div>
      <!-- 페이징 : 여기에서부터 -->
               
                 
<script type="text/javascript">
   function PageMove(page){
          location.href = "matching?command=matchingAll&curpagenum="+page;
   }
</script> 

<c:if test="${listsize>=0 }">
   <c:choose> 
      <c:when test="${listsize == 0}">
         <script>
            $("#tableheader").hide();
         </script>
      </c:when>
      
      <c:otherwise>
         <c:forEach var="vo" items="${list}" begin="${page.startRow}" end="${page.startRow+9}" ></c:forEach>
   
      </c:otherwise>
   </c:choose>
</c:if>

<c:choose> 
   <c:when test="${page.listCount >0 }">
      <c:if test="${page.listCount ne '0'}">

         <div class="row" style="display: block;">
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
               <li class="active">
                  <a class="page-link" href="javascript:PageMove(${page.startPage})">Pre</a>
               </li>

                  <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" >
                     <c:choose>
                        <c:when test="${i eq page.currentPage }">
                           <li class="active"><a class="page-link" href="javascript:PageMove(${i})">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                           <li><a class="page-link" href="javascript:PageMove(${i})">${i}</a></li>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>

                  <c:if test="${page.next eq true }">
                     <li><a class="page-link" href="javascript:PageMove(${page.currentPage+1 })">Next</a></li>
                  </c:if>
               </ul>
            </nav>
         </div> 

      </c:if>
   </c:when>
</c:choose>

<!-- 여기까지 페이징 완료 -->
      
      
      
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
    