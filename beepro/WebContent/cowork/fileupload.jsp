<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeePro - 파일드라이브</title>
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
<style type="text/css">
.btn { cursor:pointer;}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	margin: 20px auto;
	border-radius: 5px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
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
</style>
<script type="text/javascript">
// input 검색 기능
$(document).ready(function() {
        $("#keyword").keyup(function() {
            var k = $(this).val();
            $("#uploadList > tbody > tr").hide();
            var temp = $("#uploadList > tbody > tr > td:contains('" + k + "')");

            $(temp).parent().show();
        });
    });
</script>
</head>
<body>
	<div id="wrapper">
		<!-- 상단 메뉴 바 -->
		<!-- <div id="headers"></div> -->
		<jsp:include page="common/side_bar.jsp"></jsp:include>

		<!-- 내용이 들어갈 구역을 정의하는 div -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 내용이 들어갈 구역을 정의하는 div -->
			<div id="content">

				<!-- 왼쪽 메뉴 바 -->
				<!-- <div id="top_bar"></div> -->
				<jsp:include page="common/top_bar.jsp"></jsp:include>

				<!-- 본격적으로 내용이 담기는 div -->
				<div class="container-fluid">
					<div class="container">
						<div class="table-title">
							<div class="row">
								<div class="col-sm-4">
									<h2>
										<b>파일드라이브</b>
									</h2>
								</div>
							</div>
						</div>
							<div class="filter-group col-4">
							   <input type="text" class="form-control" size="50" style="border:0;" placeholder="검색하실 항목을 입력하세요" id="keyword">
							</div>
						<div class="table-wrapper">
  							<div class="table-filter">
								<div class="row">
									<div class="col-sm-2">
									<button class="btn btn-primary" data-toggle="modal" data-target="#upload"><b>파일 업로드</b></button>
									</div>
								</div>
							</div>
							<table class="table table-striped table-hover" id="uploadList">
								<colgroup>
									<col width="5%">
									<col width="25%">
									<col width="10%">
									<col width="10%">
									<col width="5%">
								</colgroup>
								<thead>
									<tr>
										<th>no</th>
										<th>파일명</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>다운로드</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty FileList}"> 
										<tr><td colspan="5">
											등록된 파일이 없습니다. 새로 추가해주세요.
										</td></tr>
									</c:if>
									
									
									<c:forEach var="file" items="${FileList}" >
									<tr>										
									<td>${file.fileSeq}</td>
									<td>${file.fileName}</td>
									<td>${file.userId}</td>
									<td>${file.regdate}</td>
									<td><a href="${pageContext.request.contextPath}/project?command=download&fileName=${file.fileName}"
												class="view" title="View Details" data-toggle="tooltip"><i
													class="material-icons">&#xE5C8;</i></a></td>
										</tr>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<jsp:include page="common/footer.html"></jsp:include>
		</div>
	</div>

<!-- 파일 업로드 모달 -->
<div class="modal fade" id="upload" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="FileUpload">파일 업로드</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
         </div>
        	  <form action="${pageContext.request.contextPath}/project?command=uploadbutton" method ="post" enctype="multipart/form-data">
			    <div class="modal-body">
			    <input type="hidden" name="u_id" value="${u_id}">
			    <input type="hidden" name="projectSeq" value="${projectSeq}">
				<input type="file" name="file">
		       </div>
	         <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
               <button type="submit" class="btn btn-primary">등 록</button>
               </div>
			</form>
            </div>
		  </div>
		</div>
<!-- 파일 업로드 모달 끝 -->
</body>
</html>