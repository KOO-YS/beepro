<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">

<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String)session.getAttribute("u_id");
	}

	String get_id = null;
	if (request.getAttribute("get_id") != null) {
		get_id = (String) request.getParameter("get_id");
	}
%>
<script type="text/javascript" src ="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url : "../chat?command=submit",
			data : {
				send_id : encodeURIComponent(send_id),
				get_id : encodeURIComponent(get_id),
				chatContent : encodeURIComponent(chatContent),
			},
			success : function(result) {
				if (result == 1) {

					autoClosingAlert('#successMessage', 2000);
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
</script>
</head>
<body>


	<div class="container">
		<div class="col-md-12 col-lg-6">
			<div class="panel">
				<!--Heading-->
				<div class="panel-heading">
					<div class="panel-control">
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								data-toggle="collapse" data-target="#demo-chat-body">
								<i class="fa fa-chevron-down"></i>
							</button>
							<button type="button" class="btn btn-default"
								data-toggle="dropdown">
								<i class="fa fa-gear"></i>
							</button>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#">Available</a></li>
								<li><a href="#">Busy</a></li>
								<li><a href="#">Away</a></li>
								<li class="divider"></li>
								<li><a id="demo-connect-chat" href="#"
									class="disabled-link" data-target="#demo-chat-body">Connect</a></li>
								<li><a id="demo-disconnect-chat" href="#"
									data-target="#demo-chat-body">Disconect</a></li>
							</ul>
						</div>
					</div>
					<h3 class="panel-title">실시간 채팅창</h3>
				</div>

				<!--Widget body-->
				<div id="demo-chat-body" class="collapse in">
					<div class="nano has-scrollbar" style="height: 380px">
						<div class="nano-content pad-all" tabindex="0"
							style="right: -17px;">
							<ul class="list-unstyled media-block">
								<li class="mar-btm">
									<div class="media-left">
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor">
										<div class="speech">
											<a href="#" class="media-heading">John Doe</a>
											<p>Hello Lucy, how can I help you today ?</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i>09:23AM
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-right">
										<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor speech-right">
										<div class="speech">
											<a href="#" class="media-heading">Lucy Doe</a>
											<p>Hi, I want to buy a new shoes.</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:23AM
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-left">
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor">
										<div class="speech">
											<a href="#" class="media-heading">John Doe</a>
											<p>Shipment is free. You\'ll get your shoes tomorrow!</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:25
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-right">
										<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor speech-right">
										<div class="speech">
											<a href="#" class="media-heading">Lucy Doe</a>
											<p>Wow, that\'s great!</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:27
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-right">
										<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor speech-right">
										<div class="speech">
											<a href="#" class="media-heading">Lucy Doe</a>
											<p>Ok. Thanks for the answer. Appreciated.</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:28
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-left">
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor">
										<div class="speech">
											<a href="#" class="media-heading">John Doe</a>
											<p>
												You are welcome! <br> Is there anything else I can do
												for you today?
											</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:30
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-right">
										<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor speech-right">
										<div class="speech">
											<a href="#" class="media-heading">Lucy Doe</a>
											<p>Nope, That\'s it.</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:31
											</p>
										</div>
									</div>
								</li>
								<li class="mar-btm">
									<div class="media-left">
										<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
											class="img-circle img-sm" alt="Profile Picture">
									</div>
									<div class="media-body pad-hor">
										<div class="speech">
											<a href="#" class="media-heading">John Doe</a>
											<p>Thank you for contacting us today</p>
											<p class="speech-time">
												<i class="fa fa-clock-o fa-fw"></i> 09:32
											</p>
										</div>
									</div>
								</li>
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
								<button class="btn btn-primary btn-block" type="submit"
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

</body>
</html>