<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/cowork/css/issueWriteTable.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/cowork/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/cowork/js/sb-admin-2.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.label_box:contains("버그")').css('background-color', '#f85b94');
		$('.label_box:contains("개선")').css('background-color', '#3598fe');
		$('.label_box:contains("요구사항")').css('background-color', '#3bcde2');
		$('.label_box:contains("테스트케이스")').css('background-color', '#0088a2');

		$('.label_box:contains("심각")').css('background-color', '#ed5565');
		$('.label_box:contains("높음")').css('background-color', '#f8ac59');
		$('.label_box:contains("보통")').css('background-color', '#1c84c6');
		$('.label_box:contains("낮음")').css('background-color', '#23c6c8');
	});

	jQuery(function($) {
		$(".container-fluid").css("display", "none");
		$(".container-fluid").fadeIn(500);
		$("a.transition").click(function(event) {
			event.preventDefault();
			linkLocation = this.href;
			$(".container-fluid").fadeOut(500, redirectPage);
		});
		function redirectPage() {
			window.location = linkLocation;
		}
	});

/* 	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	}); */

	// input 검색 기능
	$(document).ready(function() {
            $("#keyword").keyup(function() {
                var k = $(this).val();
                $("#issue-table > tbody > tr").hide();
                var temp = $("#issue-table > tbody > tr > td:contains('" + k + "')");

                $(temp).parent().show();
            });
        });

	// 중요도 검색기능
	function displaySelect1() {
		var langSelect = document.getElementById("select1");
		
		var selectValue = langSelect.options[langSelect.selectedIndex].value;

		$("#issue-table > tbody > tr").hide();
		var temp = $("#issue-table > tbody > tr > td:contains('" + selectValue+ "')");

		$(temp).parent().show();

	}

	// 이슈 분류 검색 기능
	function displaySelect2() {
		var langSelect = document.getElementById("select2");

		var selectValue = langSelect.options[langSelect.selectedIndex].value; // option value 값

		$("#issue-table > tbody > tr").hide();
		var temp = $("#issue-table > tbody > tr > td:contains('" + selectValue+ "')");

		$(temp).parent().show();
	}
	
	// 게시글 보이는 갯수 조절하는 기능
	function displaySelect3() {
		var langSelect = document.getElementById("select3");

		var selectValue = langSelect.options[langSelect.selectedIndex].value;

		$("#issue-table > tbody > tr").hide();
		var temp = $("#issue-table > tbody > tr > td:contains('" + selectValue+ "')");

		$(temp).parent().show();
	}
</script>
<style type="text/css">
.container-fluid {
	animation: fadein 500ms ease-out;
	-moz-animation: fadein 2000ms ease-out; /* Firefox */
	-webkit-animation: fadein 2000ms ease-out; /* Safari and  Chrome */
	-o-animation: fadein 2000ms ease-out; /* Opera */
}

@
-webkit-keyframes fadein { /* Safari and Chrome */
	from {opacity: 0;
}

to {
	opacity: 1;
}

}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 20px auto;
	border-radius: 5px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-wrapper .btn {
	float: right;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-wrapper .btn:hover {
	color: #333;
	background: #f2f2f2;
}

.table-wrapper .btn.btn-primary {
	color: #fff;
	background: #03A9F4;
}

.table-wrapper .btn.btn-primary:hover {
	background: #03a3e7;
}

.table-title .btn {
	font-size: 13px;
	border: none;
}

.table-title .btn i {
	float: left;
	font-size: 16px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

.table-title {
	color: #4b5366;
	padding: 16px 25px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.show-entries select.form-control {
	width: 80px;
	margin: 0 5px;
}

.table-filter .filter-group {
	float: right;
	margin-left: 15px;
}

.table-filter input, .table-filter select {
	height: 34px;
	border-radius: 3px;
	border-color: #ddd;
	box-shadow: none;
}

.table-filter {
	padding: 5px 0 15px;
	border-bottom: 1px solid #e9e9e9;
	margin-bottom: 5px;
}

.table-filter .btn {
	height: 34px;
}

.table-filter label {
	font-weight: normal;
	margin-left: 10px;
}

.table-filter select, .table-filter input {
	display: inline-block;
	margin-left: 5px;
}

.table-filter input {
	width: 100px;
	display: inline-block;
}

.filter-group select.form-control {
	width: 80px;
}

.filter-icon {
	float: right;
	margin-top: 7px;
}

.filter-icon i {
	font-size: 16px;
	opacity: 0.7;
	margin-right: -20px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 80px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.view {
	width: 30px;
	height: 30px;
	color: #2196F3;
	border: 2px solid;
	border-radius: 30px;
	text-align: center;
}

table.table td a.view i {
	font-size: 22px;
	margin: 2px 0 0 1px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

.label_box {
	width: 50px;
	background-color: pink;
	text-align: center;
	padding: 3px 3px;
	color: white;
	border-radius: 6px;
	font-size: 13px;
}

#project_name { padding:30px;
                width:100%;
                height:auto;
                margin-top:15px;
                border-radius:5px;
                border:1px solid rgb(75,97,207);
                font-size:18px;
                cursor:pointer;
               }
</style>
<title>이슈 관리</title>
</head>
<body>
	<div id="wrapper">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="common/side_bar.jsp"></jsp:include>

		<!-- 내용이 들어갈 구역을 정의하는 div -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 내용이 들어갈 구역을 정의하는 div -->
			<div id="content">
				<!-- 왼쪽 메뉴 바 -->
				<jsp:include page="common/top_bar.jsp"></jsp:include>
				<!-- 본격적으로 내용이 담기는 div -->
				<div class="container-fluid">
					<div class="container">
						<div class="table-title">
							<div class="row">
								<div class="col-sm-4">
									<h2>
										<b>이슈 목록</b>
									</h2>
								</div>
							</div>
						</div>
						<div class="filter-group col-sm-4">
							<input id="keyword" type="text" class="form-control" size="50" style="border:0;" placeholder="검색하실 항목을 입력하세요">
						</div>

						<div class="table-wrapper">
							<div class="table-filter">
								<div class="row">
									<div class="col-sm-3">
										<div class="show-entries">
											<select class="form-control" onchange="displaySelect3()" id="select3">
												<option value="5">5</option>
												<option value="10">10</option>
												<option value="15">15</option>
												<option value="20">20</option>
											</select>
										</div>
									</div>
									<div class="col-sm-9">
										<div class="filter-group">
											<label>중요도</label> <select class="form-control"
												onchange="displaySelect1()" id="select1">
												<option value="">선택</option>
												<option value="심각">심각</option>
												<option value="높음">높음</option>
												<option value="보통">보통</option>
												<option value="낮음">낮음</option>
											</select>
										</div>
										<div class="filter-group">

											<label>이슈타입</label> <select class="form-control"
												onchange="displaySelect2()" id="select2">
												<option value="">선택</option>
												<option value="버그">버그</option>
												<option value="개선">개선</option>
												<option value="요구사항">요구사항</option>
												<option value="테스트케이스">테스트케이스</option>
											</select>
										</div>
										<span class="filter-icon"><i class="fa fa-filter"></i></span>
									</div>
								</div>
							</div>
							<table class="table table-striped table-hover" id="issue-table">
								<thead>
									<tr>
										<th>NO</th>
										<th>이슈제목</th>
										<th>작성자</th>
										<th>중요도</th>
										<th>이슈타입</th>
										<th>작성 날짜</th>
										<th>자세히</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="issue" items="${issueList}">
										<tr>
											<td>${issue.issueSeq}</td>
											<td>${issue.title}</td>
											<td>${issue.writer}</td>
											<td><div class="label_box">${issue.level}</div></td>
											<td><div class="label_box">${issue.category}</div></td>
											<td>${issue.regdate}</td>
											<td><a
												href="${pageContext.request.contextPath}/issue?command=issueDetail&projectSeq=${projectSeq}&issue_seq=${issue.issueSeq}"
												class="view" title="View Details" data-toggle="tooltip"><i
													class="material-icons">&#xE5C8;</i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="clearfix">
								<ul class="pagination">
									<li class="page-item disabled"><a href="#">Previous</a></li>
									<li class="page-item active"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">4</a></li>
									<li class="page-item"><a href="#" class="page-link">5</a></li>
									<li class="page-item"><a href="#" class="page-link">6</a></li>
									<li class="page-item"><a href="#" class="page-link">7</a></li>
									<li class="page-item"><a href="#" class="page-link">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<jsp:include page="common/footer.html"></jsp:include>
		</div>
	</div>
	
	 <!-- 워크스페이스 모달  -->
      <div class="modal fade" id="workspaceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
          <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel" style="color:black;">워크 스페이스 이동</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body" style="font-size:14px;">
          <div id="test100"></div>
              <c:choose>
	             <c:when test="${empty projectVo}">
	                <div id="none">
	                                        이동할 워크스페이스가 존재하지 않습니다.<br>
	                                        매칭을 통해 생성하십시오.<br>
	                  <a class="btn btn-primary" href="../matching?command=matchingAll">매칭하러가기</a>  
	                </div>
	             </c:when>
	      
	             <c:otherwise>
	                              이동하실 워크 스페이스를 선택하세요.
	               <c:forEach var="vo" items="${projectVo}">
	                <div id="project_name" onclick="location.href='${pageContext.request.contextPath}/matching?command=selectOneProject&projectSeq=${vo.projectSeq}'">
	                  <div id="title">
	                     ${vo.projectName}
	                 </div>
	                  
	                 <div id="content">
	                  ${vo.member}
	                 </div>
	                 
	                 <div id="period">
	                  ${vo.startDate} - ${vo.endDate}
	                 </div>
	               </div>
	               </c:forEach>
	             </c:otherwise>
	         </c:choose>       
          </div>
        </div>
      </div>
</body>
</html>