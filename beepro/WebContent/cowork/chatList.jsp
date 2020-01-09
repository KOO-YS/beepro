<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.semi.vo.MessageVo"%>
<%@ page import="com.semi.dao.UserDaoImpl"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/cowork/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script
	src="${pageContext.request.contextPath}/cowork/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/cowork/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script
	src="${pageContext.request.contextPath}/cowork/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script
	src="${pageContext.request.contextPath}/cowork/js/sb-admin-2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
</style>
<title>채팅목록</title>
<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String) session.getAttribute("u_id");
	}
%>


<script type="text/javascript">
   function chatBoxFunction(){
	  var u_id = '<%=u_id%>';
      $.ajax({
         type : "POST",
         url : "${pageContext.request.contextPath}/chat?command=chatBox",
         data : {
            u_id : encodeURIComponent(u_id)
         },
         success : function(data){
        	 
            if(data == ""){return; }
            
            $('#boxTable').html('');
            var parsed = JSON.parse(data);
            var result = parsed.result;
		    for(var i=0; i<result.length; i++){
            	if(result[i][0].value == u_id){
            		result[i][0].value = result[i][1].value;
            	}else{
            		result[i][1].value = result[i][0].value;
            	}
	            addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value);
            }
         }
         
      });
   }
   function addBox(lastId, toId, chatContent, chatTime, unread){

	   $("#boxTable").append(
	'<tr onclick=chatFunction("'+toId+'")>'+
	'<td>'+lastId+'님과 채팅</td>'+
		'<td>'+chatContent+
			'<div class="pull-right"><small>'+chatTime+'</small></div>'+
		'</td><td><span class="badge badge-danger badge-counter">'+unread+'</span></td></tr>');
	   
	   
   }
   function getInfiniteBox(){
	   setInterval(function(){
		   chatBoxFunction();
	   },3000);
   }
   function chatFunction(get_id){
		window.open('${pageContext.request.contextPath}/chat?command=chatting&get_id='+get_id, '실시간 채팅', 'top=100, left=500, width=500px, height=550px, status=no, menubar=no, toolbar=no, resizable=no');

   }
   
</script>

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
									<h5>
										&nbsp;<b>채팅 목록</b>
									</h5>
								</div>
							</div>
							<hr>
						</div>

						<div class="table-wrapper">

							<table class="table table-striped table-hover" id="boxTable">
								<!-- 채팅목록 추가 부분 -->
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<jsp:include page="common/footer.html"></jsp:include>
		</div>
	</div>

<!-- 	<script type="text/javascript">
	$(document).ready(function(){
		getUnread();
		getInfiniteUnread();
		chatBoxFunction();
		getInfiniteBox();
	});
</script> -->




</body>
</html>

