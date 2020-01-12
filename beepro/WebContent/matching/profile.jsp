<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.semi.dao.UserDaoImpl"  %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>NAME</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">
  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

  <!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.profile-bd{
    background: linear-gradient(to bottom, rgba(75,97,207) 50%, white 0%); 
}
input {
   background-color: #eee;
    border: none;
    padding: 12px 15px;
    margin: 8px 0;
    width: 100%;
}
#pf-status li {
	width:30%;
	text-align: center;
	display: inline-block;
	border-right: 2px dotted rgba(75,97,207);
}
#pf-status li:last-child {
	border: none;
}
a:hover {
	 text-decoration:none;
}
hr {
	margin: 3em 0;
}
#follo:hover{
	background-color : white;
	color: red;
	border : 1px solid red;
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


function followFunction(post_no){
	var u_id = "${u_id}";
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/heart?command=follow",
		data : {
			get_id : "${profile.u_name}"
		}, 
		success : function(result) {
			if (result > 0) {
				alert("팔로우 했습니다.");
				location.reload();
			} else {
				alert("팔로우 취소 했습니다.")
				location.reload();
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
  
  <!-- Header -->
  <header class="masthead" style="background-color: rgba(75,97,207);">
    <div class="container">
      <div class="intro-text" style="padding-top: 150px; padding-bottom: 100px;">
        <div class="intro-lead-in">${profile.u_name}'s</div>
        <div class="intro-heading text-uppercase">profile</div>
      </div>
    </div>
  </header>
  <!-- profile -->
  <div class="profile-bd">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <img src="<%= request.getContextPath() %>/upload/${userPhoto}" style="width: 22vw; height: 22vw;border-radius: 50%; border:10px solid rgba(75,97,207);"
          			onerror="this.src='<%= request.getContextPath() %>/matching/img/bee.png'">
        </div>
      </div>
    </div>    
  </div>
  <div class="container" style="padding: 40px 0;">
  	<div id="pf-status">
  		<ul>
  			<li>
  				<span>참여 프로젝트</span>
  				<h3>123</h3>
  			</li>
  			<li>
  				<span> followers</span>
				<h3>
					<a href="#">
					<i class="fa-heart" style="font-family: fontawesome;content:'\f004';font-style: normal;"></i>
					</a> ${followers }						
				</h3>
  			</li>
  			<li>
				<span> following</span>
				<h3>
					<a href="#">
					<i class="fa-heart" style="font-family: fontawesome;content:'\f004';font-style: normal;"></i>
					</a> ${followings }	 
				</h3>
  			</li>
  		</ul>
  	</div>
  	<hr>
  	<div class="row">
  		<div class="col-2">
  		</div>
  		<div class="col-8">
  		<c:if test="${u_id ne profile.u_name }">
  		
  		<c:choose>
  			<c:when test="${chk eq 'follow' }">
	  		  	<button class="btn btn-primary" style="width:350px;margin: 40px 0 20px 20px;" onclick="followFunction();"> 팔로우 하기 </button>
  			</c:when>
  			<c:otherwise>
	  		  	<button id="follo" class="btn btn-primary" style="width:350px;margin: 40px 0 20px 20px;background-color:red;" onclick="followFunction();"> 팔로우 취소 </button>
  			</c:otherwise>
  		</c:choose>
  		
  	        <button class="btn btn-primary" style="width:350px; margin: 40px 0 20px 20px;" onclick="sendMsgFunction('${profile.u_name}');"> 쪽지 보내기 </button>
  		</c:if>
		  	<p class="bg-light" style="text-align:center;">
				skills
			</p>
  		</div>
  	</div>
  </div>
  <section>
    	<div class="container">
    		<h5>참여 프로젝트 </h5>
    		<div class="row">
    			<div class="col-lg-12">
		    		<table class="table">
					  <thead class="thead-light">
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">프로젝트명</th>
					      <th scope="col">개발 기간</th>
					      <th scope="col">등급? or 역할</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>Larry</td>
					      <td>the Bird</td>
					      <td>@twitter</td>
					    </tr>
					  </tbody>
					</table>
    			</div>
    		</div>
    		
    		<hr>
    		
			<h5>프로젝트 참여율 (67/123)</h5>
    		<div class="progress">
			  <div class="progress-bar bg-success" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="123"></div>
			</div>
    	</div>
    	
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
    
    