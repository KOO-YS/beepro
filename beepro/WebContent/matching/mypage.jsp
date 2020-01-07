<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
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
</style>
</head>

<body id="page-top">
  <jsp:include page="common/sub_nav.jsp"></jsp:include>

  <!-- Header -->
  <header class="masthead" style="background-color: rgba(75,97,207);">
    <div class="container">
      <div class="intro-text" style="padding-top: 150px; padding-bottom: 100px;">
        <div class="intro-lead-in">by project</div>
        <div class="intro-heading text-uppercase">MyPage</div>
      </div>
    </div>
  </header>
  <!-- profile -->
  <div class="profile-bd">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <img src="<%= request.getContextPath() %>/upload/${u_photo}";
      	  onerror="this.src='img/bee.png'"
          style="width: 30%; border-radius: 50%; border:10px solid rgba(75,97,207);">
       	<br>
       	<!-- <button class="btn btn-primary" onclick="window.open('profilePhoto.jsp','profilePhotoUpdate','width=330,height=80,location=no,status=no,scrollbars=no');" style="margin-top: 40px;">프로필사진 변경</button> -->
        <button class="btn btn-primary" data-toggle="modal" data-target="#test" style="margin-top: 40px;"> 프로필사진 변경</button>
        
        </div>        
      </div>
    </div>    
  </div>
	<div class="container" style="padding: 40px 0;">
		<div class="row">
			<div class="col-12">
				<span> name </span>
				<input type="email" value="${u_name}" class="pf_input" readonly/>
			</div>
			<div class="col-12">
				<span> email</span>
				<input type="email" value="${u_email}" class="pf_input"	readonly/>
			</div>
			<div class="col-8">
				<span> password </span>
				<input type="password" value="own pwd"  class="pf_input"/>
			</div>
			<div class="col-4">
				<button class="btn btn-primary" data-toggle="modal" data-target="#updatePwd" style="margin-top: 40px;"> 비밀번호 변경</button>
			</div>
			<div class="col-12">
				<span> area </span>
				<select class="pf_input">
					<option>------ 선택하지 않음 ------</option>
					<option>서울</option>
					<option>경기도</option>
					<option>충청도</option>
				</select>
			</div>
			
			<div class="col-12">
				<span>skills</span>
				<div class="card">
				    <div class="card-body">
				    <fieldset>
				    	<legend>front-end</legend>
					    <div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  <label class="form-check-label" for="inlineCheckbox1">HTML</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
						  <label class="form-check-label" for="inlineCheckbox2">CSS</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  <label class="form-check-label" for="inlineCheckbox1">JavaScript</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
						  <label class="form-check-label" for="inlineCheckbox2">Augularjs</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
						  <label class="form-check-label" for="inlineCheckbox3">React</label>
						</div>
				    </fieldset>
				    <hr>
				    <fieldset>
				    	<legend>back-end</legend>
					    <div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  <label class="form-check-label" for="inlineCheckbox1">Java</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
						  <label class="form-check-label" for="inlineCheckbox2">Python</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
						  <label class="form-check-label" for="inlineCheckbox1">Nodejs</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
						  <label class="form-check-label" for="inlineCheckbox2">Spring</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" disabled>
						  <label class="form-check-label" for="inlineCheckbox3">C++ (disabled)</label>
						</div>
				    </fieldset>
				    </div>
				    <button class="btn btn-primary">수정</button>
				</div>
				
			</div>
		</div>
	</div>	<!-- container end -->
	<section>
	<c:choose>	
			<c:when test="${empty projectList}">	
			<div class="container">
			<hr style="margin:3em 0;">	
			<h5>내가 쓴 project 글 목록</h5><br>
			<div class="row">	
			<div class="col-lg-3">
					<div class="card">
					  <div class="card-body">
					  <h5 class="card-title"> 등록된 글이 없습니다.	</h5>
					    <a href="${pageContext.request.contextPath}/matching/matchingWriting.jsp" class="card-link">글 작성하기</a>					    
					  </div>
					</div>
				</div>
				</div>
				<hr style="margin:3em 0;">
			</div>	
			</c:when>	
			
			<c:otherwise>
			<div class="container">
			<hr style="margin:3em 0;">	
			<h5>내가 쓴 project 목록</h5><br>
			<div class="row">	
			<c:forEach items="${projectList}" var="list" > 
			<div class="col-lg-3">
					<div class="card" style="height: 100%;">
					  <div class="card-body">
					    <h5 class="card-title"> 
					   		 <c:choose>
								        <c:when test="${fn:length(list.title) gt 12}">
								        <c:out value="${fn:substring(list.title, 0, 11)}..."></c:out></c:when>
								        <c:otherwise>
								        <c:out value="${list.title}">
								        </c:out></c:otherwise>
							</c:choose>	
					    </h5>
					    <h6 class="card-subtitle mb-2 text-muted">시작일 : <c:out value="${list.startdate}"/></h6>
					    <p class="card-text">
								<c:choose>
								        <c:when test="${fn:length(list.content) gt 29}">
								        <c:out value="${fn:substring(list.content, 0, 28)}..."></c:out></c:when>
								        <c:otherwise>
								        <c:out value="${list.content}">
								        </c:out></c:otherwise>
								</c:choose>					    				    
					    </p>
					    <a href="#" class="card-link">자세히보기</a>					    
					  </div>
					</div>
				</div>
				</c:forEach>
				</div>
				<hr style="margin:3em 0;">	
			</div>	
			</c:otherwise>					
		</c:choose>	
		
		<c:choose>	
			<c:when test="${empty personalList}">	
			<div class="container">
			<h5>내가 쓴 personal 목록</h5><br>
			<div class="row">	
			<div class="col-lg-3">
					<div class="card">
					  <div class="card-body">
					  <h5 class="card-title"> 등록된 글이 없습니다.	</h5>
					    <a href="${pageContext.request.contextPath}/matching/personalWriting.jsp" class="card-link">글 작성하기</a>					    
					  </div>
					</div>
				</div>
				</div>
			</div>	
			</c:when>	
			<c:otherwise>
			<div class="container">
			<h5>내가 쓴 personal 목록</h5><br>
			<div class="row">	
			<c:forEach items="${personalList}" var="list" > 
			<div class="col-lg-3">
					<div class="card" style="height: 100%;">
					  <div class="card-body">
					    <h5 class="card-title"> 
					   			<c:choose>
								        <c:when test="${fn:length(list.title) gt 12}">
								        <c:out value="${fn:substring(list.title, 0, 11)}..."></c:out></c:when>
								        <c:otherwise>
								        <c:out value="${list.title}">
								        </c:out></c:otherwise>
								</c:choose>	
					    </h5>
					    <h6 class="card-subtitle mb-2 text-muted">희망 분야 : <c:out value="${list.emp_category}"/></h6>
					    <p class="card-text">
								<c:choose>
								        <c:when test="${fn:length(list.content) gt 29}">
								        <c:out value="${fn:substring(list.content, 0, 28)}..."></c:out></c:when>
								        <c:otherwise>
								        <c:out value="${list.content}">
								        </c:out></c:otherwise>
								</c:choose>					    				    
					    </p>
					    <a href="#" class="card-link">자세히보기</a>					    
					  </div>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>	
			</c:otherwise>					
		</c:choose>	
		<!-- 게시글 end -->
			<div class="container">
			<hr style="margin:3em 0;">
			 <h5>관심 유저목록</h5>
			 <div class="row">
				 <div class="col-lg-6 col-sm-5">
				 	<table class="table table-sm table-hover">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">followers</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td><a href="matching?command=profile&userId=<%-- ${} --%>">yans</a></td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>hyeingg</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>tuna</td>
					    </tr>
					  </tbody>
					</table>
				 </div>
				 
				 <div class="col-lg-6 col-sm-5">
				 	<table class="table table-sm table-hover">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">following</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>pomi</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>gymin</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>edie</td>
					    </tr>
					  </tbody>
					</table>
				 </div>
			 </div> <!-- 관심목록 end -->	
			 </div>
			 <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
         
       	<br>
         <button class="btn btn-primary" data-toggle="modal" data-target="#withdrawal" style="margin-top: 40px; background:#ff4040;"> 회원 탈퇴</button>
        
        </div>        
      </div>
    </div>    		 
	</section>
	
  <jsp:include page="common/footer.jsp"></jsp:include>

<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="updatePwd" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updatePwdLabel">패스워드 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	<form action="../user?command=updatePwd" method="post">
      <div class="modal-body">
        	  <div class="form-group">
			    <label for="oriPwd">기존 패스워드</label>
			    <input type="password" class="form-control" name ="oriPwd" id="oriPwd" required>
			  </div>
			  <hr>
			  <div class="form-group">
			    <label for="newPwd">새 패스워드</label>
			    <input type="password" class="form-control" name ="newPwd" id="newPwd" required>
			  </div>
			  <div class="form-group">
			    <label for="newPwd_chk">새 패스워드 확인</label>

			    <input type="password" class="form-control" name="newPwd_chk" id="newPwd_chk" required aria-describedby="pwdinfo">
			    <small id="pwdinfo" class="form-text text-muted">위와 동일하게 입력해주시기 바랍니다</small>

			  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">변경</button>
      </div>
	</form>
    </div>
  </div>
</div>
<!-- 비밀번호 변경 모달 end--> 
<!-- 프로필 사진 변경 모달-->
<div class="modal fade" id="test" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updatePwdLabel">프로필사진 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        	  <form method ="post" action="../user?command=userprofile" enctype="multipart/form-data">
			      <div class="modal-body">
			      
				<span class="btn-file">
				<input type="file" id="userProfile" name="userProfile">
				<input type="hidden" name="u_id" value="${u_id}">
				</span>
			
		      </div>
	      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary" >변경</button>
      </div>
	</form>
    </div>
  </div>
</div>
<!-- 프로필 사진 변경 모달 end-->
<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="withdrawal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="withdrawalLabel">beepro 탈퇴하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	<form action="../user?command=withdrawal" method="post">
      <div class="modal-body">
			  <div class="form-group">
			    <label for="newPwd_chk">패스워드 확인</label>
			    <input type="password" class="form-control" name="pwd_chk" id="pwd_chk" required aria-describedby="pwdinfo">
			    <small id="pwdinfo" class="form-text text-muted">비밀번호를 입력하신 후 확인을 누르면 탈퇴처리가 됩니다.</small>

			  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">확인</button>
      </div>
	</form>
    </div>
  </div>
</div>
<!-- 회원탈퇴 모달 end--> 
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/matching/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/matching/js/agency.js"></script>
<script type="text/javascript">
</script>
</body>

</html>
    