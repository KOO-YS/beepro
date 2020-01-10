<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>NAME</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
  <link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">	

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/matching/css/agency.css"
	rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<style>
.profile-bd {
	background: linear-gradient(to bottom, rgba(75, 97, 207) 50%, white 0%);
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

<script type="text/javascript">

function CheckForm(){
	if($('#inputBody').val() ==""){ 
		alert("보내실 쪽지 내용을 입력하세요.");
		$('#inputBody').focus(); //id가 id인 태그에 커서깜빠거리는 포커스 주기
		return false; //현재 submit이벤트를 중지하는 개념(즉, 전송을 막는다->페이지안넘김)
	} else{ 

		$('#sendForm').submit(); //form안에 있는 데이터를 action속성의 주소로 전송
	}
}

function sendMsgFunction(get_id){
	$('#sendMsgModal').css("display","block");
	$('#inputTo').val(get_id);
	$('#reset').click(function(){
		$('#sendMsgModal').css("display","none");
	});
	$('#close').click(function(){
		$('#sendMsgModal').css("display","none");
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
        <div class="intro-heading text-uppercase">MyPage</div>
      </div>
    </div>
  </header>
  <!-- profile -->
  <div class="profile-bd">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <img src="<%= request.getContextPath() %>/upload/${u_photo}"
      	  onerror="this.src='<%= request.getContextPath() %>/matching/img/bee.png'"
          style="width: 22vw; height: 22vw;border-radius: 50%; border:10px solid rgba(75,97,207);">
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
				<span> name </span> <input type="email" value="${u_name}"
					class="pf_input" readonly />
			</div>
			<div class="col-12">
				<span> email</span> <input type="email" value="${u_email}"
					class="pf_input" readonly />
			</div>
			<div class="col-8">
				<span> password </span> <input type="password" value="own pwd"
					class="pf_input" />
			</div>
			<div class="col-4">
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#updatePwd" style="margin-top: 40px;">비밀번호 변경</button>
			</div>
			<div class="col-12">

				<span> area </span>
				<select class="pf_input" name="areaSelect" id = "area">
					<option>------ 선택하지 않음 ------</option>
					<option value ="서울">서울</option>
					<option value ="인천/경기">인천/경기</option>
					<option value ="강원">강원</option>
					<option value ="충청">충청</option>
					<option value ="전라">전라</option>
					<option value ="경상">경상</option>
					<option value ="제주">제주</option>
				</select>
			</div>

			<div class="col-12">
				<span>skills</span>
				<form action="${pageContext.request.contextPath}/user?command=updateSkill" method="post">
				<div class="card">
				    <div class="card-body">		    
				    <fieldset>
				    	<legend>front-end</legend>
					    <div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="skill" value="HTML">
						  <label class="form-check-label" for="inlineCheckbox1">HTML</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="skill" value="CSS">
						  <label class="form-check-label" for="inlineCheckbox2">CSS</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" name="skill"  value="JavaScript">
						  <label class="form-check-label" for="inlineCheckbox1">JavaScript</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" name="skill" value="Augularjs">
						  <label class="form-check-label" for="inlineCheckbox2">Augularjs</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" name="skill" value="React">
						  <label class="form-check-label" for="inlineCheckbox3">React</label>
						</div>
				    </fieldset>
				    <hr>
				    <fieldset>
				    	<legend>back-end</legend>
					    <div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" name="skill" value="Java">
						  <label class="form-check-label" for="inlineCheckbox1">Java</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" name="skill" value="Python">
						  <label class="form-check-label" for="inlineCheckbox2">Python</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox8" name="skill" value="Nodejs">
						  <label class="form-check-label" for="inlineCheckbox1">Nodejs</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox9" name="skill" value="Spring">
						  <label class="form-check-label" for="inlineCheckbox2">Spring</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox10" name="skill" value="C++" >
						  <label class="form-check-label" for="inlineCheckbox3">C++</label>
						</div>
				    </fieldset>
				    </div>
				</div>				
				    <br><button type="submit" class="btn btn-primary">수정</button>
				    </form>
			</div>
		</div>
	</div>
	<!-- container end -->
	<section style="padding: 0;">
		<c:choose>
			<c:when test="${empty projectList}">
				<div class="container">
					<hr style="margin: 3em 0;">
					<h5>내가 쓴 project 글 목록</h5>
					<br>
					<div class="row">
						<div class="col-lg-3">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">등록된 글이 없습니다.</h5>
									<a
										href="${pageContext.request.contextPath}/matching/matchingWriting.jsp"
										class="card-link">글 작성하기</a>
								</div>
							</div>
						</div>
					</div>
					<hr style="margin: 3em 0;">
				</div>
			</c:when>

			<c:otherwise>
				<div class="container">
					<hr style="margin: 3em 0;">
					<h5>내가 쓴 project 목록</h5>
					<br>
					<div class="row">
						<c:forEach items="${projectList}" var="list">
							<div class="col-lg-3">
								<div class="card" style="height: 100%;">
									<div class="card-body">
										<h5 class="card-title">
											<c:choose>
												<c:when test="${fn:length(list.title) gt 12}">
													<c:out value="${fn:substring(list.title, 0, 11)}..."></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="${list.title}">
													</c:out>
												</c:otherwise>
											</c:choose>
										</h5>
										<h6 class="card-subtitle mb-2 text-muted">
											시작일 :
											<c:out value="${list.startdate}" />
										</h6>
										<p class="card-text">
											<c:choose>
												<c:when test="${fn:length(list.content) gt 29}">
													<c:out value="${fn:substring(list.content, 0, 28)}..."></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="${list.content}">
													</c:out>
												</c:otherwise>
											</c:choose>
										</p>
										<a
											href="matching?command=matchingView&projectM_seq=${list.projectM_seq }"
											class="card-link">자세히보기</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<hr style="margin: 3em 0;">
				</div>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${empty personalList}">
				<div class="container">
					<h5>내가 쓴 personal 목록</h5>
					<br>
					<div class="row">
						<div class="col-lg-3">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">등록된 글이 없습니다.</h5>
									<a
										href="${pageContext.request.contextPath}/matching/personalWriting.jsp"
										class="card-link">글 작성하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container">
					<h5>내가 쓴 personal 목록</h5>
					<br>
					<div class="row">
						<c:forEach items="${personalList}" var="list">
							<div class="col-lg-3">
								<div class="card" style="height: 100%;">
									<div class="card-body">
										<h5 class="card-title">
											<c:choose>
												<c:when test="${fn:length(list.title) gt 12}">
													<c:out value="${fn:substring(list.title, 0, 11)}..."></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="${list.title}">
													</c:out>
												</c:otherwise>
											</c:choose>
										</h5>
										<h6 class="card-subtitle mb-2 text-muted">
											희망 분야 :
											<c:out value="${list.emp_category}" />
										</h6>
										<p class="card-text">
											<c:choose>
												<c:when test="${fn:length(list.content) gt 29}">
													<c:out value="${fn:substring(list.content, 0, 28)}..."></c:out>
												</c:when>
												<c:otherwise>
													<c:out value="${list.content}">
													</c:out>
												</c:otherwise>
											</c:choose>
										</p>
										<a
											href="personMatching?command=selectOnePer&personal_seq=${list.personal_seq}"
											class="card-link">자세히보기</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 게시글 end -->
		<!-- 관심 게시글 목록 start -->
		<div class="container">
			<hr style="margin: 3em 0;">
			<div class="row">
				<div class="col-lg-6 col-sm-5">
					<h5>관심 project 게시글 목록</h5>
				</div>
				<div class="col-lg-6 col-sm-5">
					<h5>관심 personal 게시글 목록</h5>
				</div>
			</div>
			<!-- 관심 프로젝트 -->
			<div class="row">
				<div class="col-lg-6 col-sm-5"
					style="height: 170px; overflow: scroll; overflow-x: hidden">
					<table class="table table-sm table-hover"
						style="text-align: center;">
						<colgroup>
							<col width="15%" />
							<col width="" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr>
								<th>제목</th>
								<th>내용</th>
								<th>시작일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty projectList}">

									<tr>
										<td colspan="3">관심있는 게시글이 없습니다.</td>
									</tr>
								</c:when>

								<c:otherwise>
									<c:forEach items="${postProList}" var="list">
										<tr onclick="location.href='${pageContext.request.contextPath}/matching?command=matchingView&projectM_seq=${list.projectM_seq }'">
											<c:choose>
												<c:when test="${fn:length(list.title) gt 12}">
													<td><c:out
															value="${fn:substring(list.title, 0, 11)}..."></c:out>
												</c:when>
												<c:otherwise>
													<td><c:out value="${list.title}"></c:out></td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${fn:length(list.content) gt 29}">
													<td><c:out
															value="${fn:substring(list.content, 0, 28)}..."></c:out></td>
												</c:when>
												<c:otherwise>
													<td><c:out value="${list.content}"></c:out></td>
												</c:otherwise>
											</c:choose>
											<td><c:out value="${list.startdate}"></c:out></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<!-- 관심 퍼스널 게시글 -->

				<!-- <h5>관심 personal 게시글 목록</h5> -->
				<div class="col-lg-6 col-sm-5"
					style="height: 170px; overflow: scroll; overflow-x: hidden">
					<table class="table table-sm table-hover"
						style="text-align: center;">
						<colgroup>
							<col width="30%" />
							<col width="30%" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>희망분야</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${empty postPerList}">
									<tr>
										<td colspan="3">관심있는 게시글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
										<c:forEach items="${postPerList}" var="list">
										<tr onclick="location.href='${pageContext.request.contextPath}/personMatching?command=selectOnePer&personal_seq=${list.personal_seq }'">
											<c:choose>
												<c:when test="${fn:length(list.title) gt 12}">
													<td><c:out
															value="${fn:substring(list.title, 0, 11)}..."></c:out></td>
												</c:when>
												<c:otherwise>
													<td><c:out value="${list.title}"></c:out></td>
												</c:otherwise>
											</c:choose>
											<td><c:out value="${list.user_id}"></c:out></td>
											<td><c:out value="${list.emp_category}"></c:out></td>
										</tr>
										</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>


		<!-- 관심 사람 목록 start -->
		<div class="container">
			<hr style="margin: 3em 0;">
			<h5>관심 유저목록</h5>
			<div class="row">
				<div class="col-lg-6 col-sm-5"
					style="height: 170px; overflow: scroll; overflow-x: hidden">
					<table class="table table-sm table-hover"
						style="text-align: center;">
						<colgroup>
							<col width="15%" />
							<col width="" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr>
								<th colspan="2">following</th>
								<th>쪽지</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty followingList}">
									<tr>
										<td colspan="3">팔로우한 사람이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
										<c:forEach items="${followingList}" var="following" varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td style="text-align: left;">
												<a href="${pageContext.request.contextPath}/matching?command=profile&userId=${following}">${following }</a>
											</td>
											<td><a href="javascript:void(0);" onclick="sendMsgFunction('${following}');"><img style="width: 30px; height: 30px" alt="쪽지보내기"
												src="${pageContext.request.contextPath}/matching/img/direct.png"></a>
											</td>
										</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

				<!-- 팔로잉 보류 -->
				<!-- 				 <div class="col-lg-6 col-sm-5">
				 	<table class="table table-sm table-hover">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">following</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
								<th scope="row">3</th>
								<td style="text-align: left;"><a
									href="matching?command=profile&userId=<%-- ${} --%>">yans</a></td>
								<td><a onclick="sendMsgFunction('${profile.u_name}');"><img style="width: 30px; height: 30px"
										alt="쪽지보내기"
										src="${pageContext.request.contextPath}/matching/img/direct.png"></a></td>
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
				 </div> -->
			</div>
			<hr style="margin: 3em 0 0 0;">
		</div>
		<!-- 관심 사람 목록 end -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">

					<br>
					<button class="btn btn-primary" data-toggle="modal"
						data-target="#withdrawal"
						style="margin-top: 40px; background: #ff4040;">회원 탈퇴</button>

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
	<form action="${pageContext.request.contextPath}/user?command=updatePwd" method="post">
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
        	  <form method ="post" action="${pageContext.request.contextPath}/user?command=userprofile" enctype="multipart/form-data">
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
	<form action="${pageContext.request.contextPath}/user?command=withdrawal" method="post">
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
<!-- 지역/기술 선택관련  -->
<script type="text/javascript">
$("#area").val("${area}").prop("selected", true);


<c:forEach var="skill" items="${skillList}">
	$("input[name=skill][value=${skill}]").prop("checked",true);
</c:forEach>

  /* 지역 변경 */
  $("#area").change(function(){
  	var area = $("select[name=areaSelect]").val();

  	$.ajax({
  		url:'${pageContext.request.contextPath}/user?command=updateArea',
  		type:'POST',
  		data: {
  			'area':area,		
  		},
  		error:function(request, status, error){
  			alert("지역 변경에 실패했습니다");
  			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  		},
  		success:function(data, textStatus, jqXHR){ 			
  			alert(area+"지역으로 변경되었습니다");
  			
  		}
  	});
  });
</script>
<!-- 지역/기술 선택관련  end-->

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/matching/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- 쪽지 보내기 모달 -->
	<div class="modal" id="sendMsgModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-info">
					<h4 class="modal-title">
						<span class="glyphicon glyphicon-envelope"></span> 쪽지보내기
					</h4>
					<button type="button" class="close" id="close" data-dismiss="modal"
						aria-hidden="true">×</button>

				</div>
				<div class="modal-body">


  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/matching/js/agency.js"></script>

					<form role="form" id="sendForm" class="form-horizontal"
						action="${pageContext.request.contextPath}/msg">
						<input type="hidden" name="command" value="sendMsg" /> 
						<input type="hidden" name="send_id" value="${u_id }" />
						<input type="hidden" name="backMsgBox" value="no" />	<!-- 어디 모달에서 보내는지 구별하기 위해 -->
						<div class="form-group">
							<label class="col-sm-12" for="inputTo"><span
								class="glyphicon glyphicon-user"></span>받는사람</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTo"
									placeholder="comma separated list of recipients"
									readonly="readonly" name="get_id" style="width: 430px">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody"><span
								class="glyphicon glyphicon-list"></span>쪽지 내용</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="inputBody" rows="8"
									name="content" style="resize: none;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="reset" id="reset" class="btn btn-default pull-left"
								data-dismiss="modal" style="border: 1px solid lightgray;"
								value="취소" />
							<input type="button" class="btn btn-primary"
								style="background-color: #fec503; border-color: #fec503;"
								value="보내기" onclick="CheckForm();" />
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal compose message -->
	


	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/matching/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/matching/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/matching/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${pageContext.request.contextPath}/matching/js/agency.js"></script>
	<script type="text/javascript">
		
	</script>

</body>

</html>