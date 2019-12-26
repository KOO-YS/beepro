<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NAME</title>

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
          <img src="data:image/jpeg;base64,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" style="width: 30%; border-radius: 50%; border:10px solid rgba(75,97,207);">
        </div>
      </div>
    </div>    
  </div>
	<div class="container" style="padding: 40px 0;">
		<div class="row">
			<div class="col-12">
				<span> name </span>
				<input type="email" value="이름" class="pf_input" readonly/>
			</div>
			<div class="col-12">
				<span> email </span>
				<input type="email" value="email@google.com" class="pf_input" readonly/>
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
		<div class="container">
			<h5>게시글</h5>
			<div class="row">
				<div class="col-lg-3">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">개발자 구합니다</h5>
					    <h6 class="card-subtitle mb-2 text-muted">username</h6>
					    <p class="card-text">기획, 디자이너, 프론트앤드, 백앤드 개발자 구합니다</p>
					    <a href="#" class="card-link">자세히보기</a>
					    
					  </div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">개발자 구합니다 2222</h5>
					    <h6 class="card-subtitle mb-2 text-muted">username</h6>
					    <p class="card-text">기획, 디자이너, 프론트앤드, 백앤드 개발자 구합니다 222</p>
					    <a href="#" class="card-link">자세히보기</a>
					    
					  </div>
					</div>
				</div>
			</div>		<!-- 게시글 end -->
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
					      <td>yans</td>
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
	<form action="updatePwdForm">
      <div class="modal-body">
      
        	  <div class="form-group">
			    <label for="oriPwd">기존 패스워드</label>
			    <input type="password" class="form-control" id="oriPwd" required>
			  </div>
			  <hr>
			  <div class="form-group">
			    <label for="newPwd">새 패스워드</label>
			    <input type="password" class="form-control" id="newPwd" required>
			  </div>
			  <div class="form-group">
			    <label for="newPwd_chk">새 패스워드 확인</label>
			    <input type="password" class="form-control" id="newPwd_chk" required aria-describedby="pwdinfo">
			    <small id="pwdinfo" class="form-text text-muted">위와 같게 입력해주시기 바랍니다</small>
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
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/agency.js"></script>

</body>

</html>
    