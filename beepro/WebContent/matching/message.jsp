<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>NAME</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/matching/css/bootstrap.css" rel="stylesheet">
 --%>
<!-- Custom fonts for this template -->
<link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
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
<link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">


<script type="text/javascript">
	function allsel(check){
		var chks = document.getElementsByName("chk");
		for(var i=0; i<chks.length;i++){
			chks[i].checked = check;
		}
	}
	
	function getMsgFunction(){
		
	}
</script>

</head>

<body id="page-top">

	<jsp:include page="common/sub_nav.jsp"></jsp:include>

	<!-- Header -->
	<header class="masthead" style="background-color: rgba(75, 97, 207);">
		<div class="container">
			<div class="intro-text"
				style="padding-top: 150px; padding-bottom: 100px;">
				<div class="intro-lead-in">by user</div>
				<div class="intro-heading text-uppercase">message</div>
			</div>
		</div>
	</header>



	<!-- project -->
	<section class="bg-light page-section">
		<div class="container">

			<!-- <div class="row">
				<div class="col-3">
					<div class="chk-block" style="margin-top: 50px">
						search
						<hr>
						<input type="checkbox"> test<br> <input
							type="checkbox"> test<br> <input type="checkbox">
						test<br> <input type="checkbox"> test<br>
					</div>
				</div>
				<div class="col-9">
					            <div class="row" style="float:right; "><button onclick="location.href='projectWriting.jsp'" type="button" class="col-1-4 btn btn-primary" style="width:200px; height:35px;">글쓰기</button></div>

					게시물
					              <div class="row post-card" style="margin-top:50px">

					<div class="row post-card">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-11 col-sm-10">
									<h4>title 프로젝트 제목</h4>
								</div>
								<div class="col-lg-1 col-sm-2">
									heart <i class="heart" style="float: right;"></i>
								</div>
								<hr>
							</div>
							<div class="row">
								<div class="col-lg-5">
									구하는 인원 : 5명 <br>상세 정보 <br>위치?
								</div>
								<div class="col-lg-6">프로젝트 관련 상세 정보</div>
							</div>
						</div>
					</div>
					게시물 end

					게시물
					<div class="row post-card">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-11 col-sm-10">
									<h4>title 프로젝트 제목</h4>
								</div>
								<div class="col-lg-1 col-sm-2">
									heart
									<i class="heart" style="float: right;"></i>
								</div>
								<hr>
							</div>
							<div class="row">
								<div class="col-lg-5">
									구하는 인원 : 5명 <br>상세 정보 <br>위치?
								</div>
								<div class="col-lg-6">프로젝트 관련 상세 정보</div>
							</div>
						</div>
					</div>
					게시물 end
					<div class="row" style="display: block;">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div> -->
			<div class="row">
				<div class="col-3">
					<div class="chk-block" style="margin-top: 50px; text-align:center;" onclick="getMsgFunction();">
						<h5>받은 쪽지함</h5>
					</div>
					<div class="chk-block" style="margin-top: 20px; text-align:center;" onclick="sendMsgFunction();">
						<h5>보낸 쪽지함</h5>
					</div>
				</div>

				<!-- 메인 내용이 들어갈 구역을 정의하는 div -->

				<!-- 본격적으로 내용이 담기는 div -->
				<div class="col-9">
					<!-- <div class="container-fluid">
						<div class="container">
							<div class="table-title">
								<div class="row">
									<div class="col-sm-4">
										<h5>
											&nbsp;<b>쪽지 목록</b>
										</h5>
									</div>
								</div>
								<hr>
							</div> -->
							<div class="table-wrapper" id="getBox">
							<input  class="btn btn-primary"  style="bacground-color:red;margin-bottom:10px;"
								type="button" value="삭제"  data-toggle="modal" data-target="#modalCompose">
								<form action="">
									<table class="table table-hover" id="boxTable" style="text-align:center;">
										<!-- 쪽지목록 추가 부분 -->
										<col width="10">
										<col width="60">
										<col width="200">
										<col width="50">
										<thead>
											<tr>
												<th><input type="checkbox" name="all" onclick="allsel(this.checked);"/></th>
												<th>보낸사람</th>
												<th>내용</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody style="background-color:white">
											<tr onclick="location.href='../matching/messageDetail.jsp'">
												<td><input type="checkbox" name="chk"></td>
												<td>id</td>
												<td>내용sssssssssssssssssssssssssssssssssss</td>
												<td><small>2020-02-03</small></td>
											</tr>
												<tr>

												<td><input type="checkbox" name="chk"></td>
												<td>id</td>
												<td>내용sssssssssssssssssssssssssssssssssss</td>
												<td><small>2020-02-03</small></td>
											</tr>
												<tr>

												<td><input type="checkbox" name="chk"></td>
												<td>id</td>
												<td>내용sssssssssssssssssssssssssssssssssss</td>
												<td><small>2020-02-03</small></td>
											</tr>
												<tr>

												<td><input type="checkbox" name="chk"></td>
												<td>id</td>
												<td>내용sssssssssssssssssssssssssssssssssss</td>
												<td><small>2020-02-03</small></td>
											</tr>
												<tr>

												<td><input type="checkbox" name="chk"></td>
												<td>id</td>
												<td>내용sssssssssssssssssssssssssssssssssss</td>
												<td><small>2020-02-03</small></td>
											</tr>
										</tbody>
									</table>
								
								</form>
							</div>
						</div>
					</div>


					<div class="row" style="display: block;">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
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
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/agency.js"></script>
	
	
		<div class="modal show" id="modalCompose">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-info">
				<h4 class="modal-title">
						<span class="glyphicon glyphicon-envelope"></span> 쪽지보내기
					</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					
				</div>
				<div class="modal-body">
				
					<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/msg?command=sendMsg">
						<input type="hidden" name="send_id"  value="u_id(세션값)"/>
						<div class="form-group">
							<label class="col-sm-12" for="inputTo"><span class="glyphicon glyphicon-user"></span>받는사람</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTo"
									placeholder="comma separated list of recipients" readonly="readonly" name="get_id" value="id" style="width:430px" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody"><span
								class="glyphicon glyphicon-list"></span>쪽지 내용</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="inputBody" rows="8" name="content" style="resize: none;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default pull-left"
								data-dismiss="modal"  style="border: 1px solid lightgray;" value="취소"/>
							<!-- <button type="button" class="btn btn-warning pull-left">Save
								Draft</button> -->
							<input type="submit" class="btn btn-primary" style="background-color:#fec503;border-color: #fec503;"
								value="보내기" />
						
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal compose message -->
	
	

</body>
</html>
