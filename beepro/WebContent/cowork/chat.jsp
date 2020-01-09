<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.dao.UserDaoImpl"  %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>

<script type="text/javascript" src ="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="${pageContext.request.contextPath}/cowork/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/css/custom.css" rel="stylesheet">

<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String)session.getAttribute("u_id");
	}

	String get_id = null;
  	if (request.getAttribute("get_id") != null) {
		get_id = (String) request.getParameter("get_id");
	}  
	
  	String getProfile = new UserDaoImpl().getProfilePath(get_id);
%>


<script type="text/javascript">
function autoClosingAlert(selector,delay){
	var alert = $(selector);
	alert.show();
	window.setTimeout(function(){ alert.hide() }, delay);
}
//메세지를 보내는 함수
function sumbitFunction(){
	var send_id = "<%=u_id%>";	
	var get_id = "<%=get_id%>";   
		var content = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/chat?command=chatSubmit",
			data : {
				send_id : encodeURIComponent(send_id),
				get_id : encodeURIComponent(get_id),
				content : encodeURIComponent(content)
			}, 
			success : function(result) {
				if (result == 1) {
					//autoClosingAlert('#successMessage', 2000);
					//alert("메시지 전송에 성공했습니다.");
				} else if (result == 0) {
					autoClosingAlert('#dangerMessage', 2000);
					//alert("이름과 내용을 모두 입력해주세요.");
				} else {
					autoClosingAlert('#warningMessage', 2000);
					//alert("데이터베이스 오류가 발생했습니다.");
				}
			}
		});
		$('#chatContent').val(''); /* 성공적으로 보내지면 값을 비워준다 */

	}
	var lastID = 0;
	function chatListFunction(type){
		var send_id = '<%= u_id%>';
		var get_id = '<%= get_id%>';
		
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/chat?command=chatList",
			data:{
				send_id: encodeURIComponent(send_id),
				get_id: encodeURIComponent(get_id),
				listType: type
			},
			success: function(data){
				if(data == ""){
					return;
				}
				var parsed = JSON.parse(data);  //json형태로 파싱
				var result = parsed.result;
				for(var i = 0 ; i < result.length ; i++){
					if(result[i][0].value == send_id){
						result[i][0].value = '나';
					}
					//addChat 함수로 이름, 내용, 시간을 보내준다.
					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
				}
				lastID = Number(parsed.last);
			}
		});
	}
	
	function addChat(chatName,chatContent, chatTime){
		
		if(chatName == "나" ){
			$('#chatList').append(
					'<li class="mar-btm">' +
					'<div class="media-right">'+
						'<img src="<%= request.getContextPath() %>/upload/${u_photo}"'+
							'class="img-circle img-sm" alt="${pageContext.request.contextPath}/cowork/images/icon.png">'+
					'</div>'+
					'<div class="media-body pad-hor speech-right">'+
						'<div class="speech">'+
							'<a href="#" class="media-heading">'+
							chatName +
							'</a>'+
							'<p>'+
							chatContent +
							'</p>'+
							'<p class="speech-time">'+
								'<i class="fa fa-clock-o fa-fw"></i>'+
							chatTime +
						'</p> </div> </div></li>');
			$('#scroll').scrollTop($('#scroll')[0].scrollHeight); //메세지가 올 때마다 스크롤 올려줌
			
		}else{
			$('#chatList').append(
					'<li class="mar-btm">'+
					'<div class="media-left">'+
						'<img src="<%= request.getContextPath() %><%=getProfile%>"'+
							'class="img-circle img-sm" alt="사진">'+ 
					'</div>'+
					'<div class="media-body pad-hor">'+
						'<div class="speech">'+
							'<a href="#" class="media-heading">'+
							chatName +
							'</a>'+
							'<p>'+
							chatContent +
							'</p>'+
							'<p class="speech-time">'+
								'<i class="fa fa-clock-o fa-fw"></i>'+
							chatTime +
							'</p> </div> </div> </li>');
			
			$('#scroll').scrollTop($('#scroll')[0].scrollHeight); //메세지가 올 때마다 스크롤 올려줌
		}
	}
	
	
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		},3000);
	}
</script>
</head>
<body>
	<div class="container" style="padding-right: 0; padding-left: 0;">
		<div class="col-md-12 col-lg-6">
			<div class="panel">
				<!--Heading-->
				<div class="panel-heading">
					<h3 class="panel-title"><%=get_id %>님과의 채팅창</h3>
				</div>

				<!--Widget body-->
				<div id="demo-chat-body" class="collapse in">
					<div  class="nano has-scrollbar" style="height: 380px">
						<div id="scroll" class="nano-content pad-all" tabindex="0"
							style="right: -17px;">
							<ul id="chatList" class="list-unstyled media-block" >
									<!-- 채팅창부분 ajax-->					
								
							</ul>
							
						</div>
						<div class="nano-pane">
							<div class="nano-slider"
								style="height: 141px; transform: translate(0px, 0px);"></div>
						</div>
					</div>

					<!--Widget footer-->
					<div class="panel-footer">
						<div class="row">
							<div class="col-xs-9">
								<!-- <input type="text" placeholder="Enter your text" class="form-control chat-input" > -->
								<textarea id="chatContent" style="height: 80px; resize: none;"
									class="form-control chat-input" placeholder="메세지를 입력하세요."
									maxlength="100"></textarea>
							</div>
							<div class="col-xs-3">
								<button class="btn btn-primary btn-block" type="submit" style="margin-top:20px; height:40px; border-radius: .50rem;"
									onclick="sumbitFunction()">전송</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="alert alert-success" id="successMessage"
		style="display: none;">
		<strong>메세지 전송에 성공했습니다.</strong>
	</div>
	<div id="dangerMessage" style="display: none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div class="alert alert-success" id="warningMessage"
		style="display: none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			chatListFunction('0');
			getInfiniteChat();  /* 3초 간격으로 메세지를 가져올 수 있음 */

		});	
	</script>

</body>
</html>