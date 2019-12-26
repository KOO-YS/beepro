<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BEEPRO</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			div{position:absolute; width:300px; height: 280px; font: rgba(75,97,207);
				text-align: center; border: 1.5px solid #A4A4A4;}
			
			h3{position: absolute; left: 100px; top: 0px;}
			
			#id_s{position: absolute; left: 15px; top: 65px;}
			#u_id{position: absolute; left: 80px; top: 65px;}
			
			#name_s{position: absolute; left: 15px; top: 100px;}
			#u_name{position: absolute; left: 80px; top: 100px;}
			
			#email_s{position: absolute; left: 15px; top: 135px;}
			#u_email{position: absolute; left: 80px; top: 135px;}
			
			#btn{position: absolute; left: 190px; top: 175px;}
			
			#result{position: absolute; left: 15px; top: 175px; font-size: 13px;}
		</style>
	</head>
	<body>	
		<div><!--  <form action="findPwd?command=findPwd" method="post"></form>-->
			<h3>비밀번호 찾기</h3>
			<span id="id_s">아이디</span>
			<input type="text" id="u_id"/>
			
			<span id="name_s">이름</span>
			<input type="text" id="u_name"/>
			
			<span id="email_s">이메일</span>
			<input type="email" id="u_email"/>
			<!--<input type="submit" id="btn" value="pw찾기" />-->
			<button id="btn" onclick="clickEvt()">pw 찾기</button>
		    </form>
		</div> 
	</body>
	<script>
		function clickEvt() {
			var u_id = $("#u_id").val()
			var u_name = $("#u_name").val();
			var u_email = $("#u_email").val();
			
			$.ajax({
				type : "post",
				url : "../findPwd?command=findPwd",
				data : {
					u_id : u_id,
					u_name : u_name,
					u_email : u_email
				},
				dataType : "json",
				success : function (data) {
					if(data.result !=null){
						$("#result").html("이메일 전송 성공");	
					}else{
						$("#result").html("이메일 전송 실패");
					}
				},
				error : function (error) {
					console.log(error);
				}
			});
		}
	</script>
 
</html>


