<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEEPRO - 개인 매칭 상세보기</title>
  <link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
	
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
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
<link
	href="${pageContext.request.contextPath}/matching/css/jquery.tag-editor.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/agency.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/common.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/notice.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/matching/js/plugins/tagEditor/jquery.caret.min.js"></script>
<script
	src="${pageContext.request.contextPath}/matching/js/plugins/tagEditor/jquery.tag-editor.js"></script>
<script type="text/javascript">
(function($) {
	function floatLabel(inputType) {
		$(inputType).each(function() {
			var $this = $(this);
			$this.focus(function() {
				$this.next().addClass("active");
			});
			$this.blur(function() {
			if ($this.val() === '' || $this.val() === 'blank') {
				$this.next().removeClass();
			}
		});
	});
}
	
// <skill> 플러그인 관련 함수
		$(document).ready(function(){
			var skill = new Array();
				<c:if test="${!empty perVo}" >
					<c:forEach var="skill" items="${perVo.skillArr}">
						skill.push('${skill}');
					</c:forEach>
				</c:if>

				$('#skill').tagEditor({placeholder : '언어 및 프로그램 능력을 작성하세요'});
			});
			floatLabel(".floatLabel");
		})(jQuery);


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
<body>
	<c:import url="common/nav_bar.jsp">
  		<c:param name="pageName" value="matching"></c:param>
  	</c:import>

	<form action="personMatching" method="get">

		<input type="hidden" name="command" value="personalUpdate" /> <input
			type="hidden" name="personal_seq" value="${detail.personal_seq}">
		<div class="container margin-t-100">

			<!-- ---------------- 글 상세보기 페이지 내부 ---------------- -->
			<div class="row">
				<div class="col-6">

					<!-- <div class="col-1-2 col-1-2-sm" style="padding-right:20px;"> -->
					<h2 class="heading">info</h2>
					<div class="controls" style="color: gray">
						제목
						<c:choose>
							<c:when test="${detail.user_id eq u_id}">
								<input type="text" id="title" class="floatLabel" name="title"
									placeholder="${detail.title}" value="${detail.title}">
							</c:when>
							<c:otherwise>
								<input type="text" id="title" class="floatLabel" name="title"
									placeholder="${detail.title}" value="${detail.title}"
									readOnly="readOnly">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="controls" style="margin-bottom: 12px; color: gray;">
						언어 및 프로그래밍 능력
						<c:if test="${detail.user_id eq u_id}">
							<input type="text" id="skill" class="floatLabel" name="skill"
								data-role="tagsinput" value="${detail.skill}">
						</c:if>
					</div>
					<div class="controls" style="color: gray;">
						희망 분야 <select class="floatLabel" name="emp_category">
							<option value="${detail.emp_category}">"${detail.emp_category}"</option>
							<c:if test="${detail.user_id eq u_id}">
								<i class="fa fa-sort"></i>
								<option value="백엔드"
									<c:if test="${detail.emp_category eq '백엔드' }">selected</c:if>>백엔드</option>
								<option value="프론트엔드"
									<c:if test="${detail.emp_category eq '프론트엔드' }">selected</c:if>>프론트엔드</option>
							</c:if>
						</select>
					</div>
					<!-- </div> -->

				</div>
				<div class="col-6">
					<!-- <div class="col-1-2 col-1-2-sm" style="padding-left:20px;"> -->
					<h2 class="heading">profile</h2>
					<div class="row">
						<div class="col-5">
							<img src="<%=request.getContextPath()%>/upload/${userPhoto}"
								onerror="this.src='<%=request.getContextPath()%>/matching/img/bee.png'"
								id="profile-img" style="margin: 17px;">
						</div>
						<div class="col-7" style="text-align: left; padding-top: 30px;">
							<h4 style="margin-bottom: 10px; font-weight:bold;">ID : ${detail.user_id }</h4>
							<h4 style="margin-bottom: 10px; font-weight:bold;">location : ${area}</h4>
							<a class="btn btn-primary" style="margin: 10px; width: 100px; color:white;"
								onclick="sendMsgFunction('${detail.user_id }');">쪽 지</a> <a
								onclick="location.href='matching?command=profile&userId=${detail.user_id }'"
								class="btn btn-primary" style="margin: 10px; width: 100px; color:white;">프로필</a>
						</div>
					</div>
				</div>
			</div>
			<div class="controls" style="color: gray">
				상세 내용
				<c:choose>
					<c:when test="${detail.user_id eq u_id}">
						<textarea name="content" class="floatLabel" id="content"
							placeholder="상세 내용을 입력하세요.">${detail.content}</textarea>
					</c:when>
					<c:otherwise>
						<textarea name="content" class="floatLabel" id="content"
							placeholder="상세 내용을 입력하세요." readOnly>${detail.content}</textarea>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- ---------------- 글 상세보기 페이지 내부 여기까지 ---------------- -->

			<a
				href="${pageContext.request.contextPath}/personMatching?command=selectAllPer"
				class="col-1-4 btn btn-primary" style="float: left;">목록</a>

			<!-- ---------------- 글 수정/삭제 버튼의 경우 글쓴이 = 로그인 유저와 동일할 경우에만 노출 ---------------- -->
			<c:if test="${detail.user_id eq u_id}">
				<a
					href="${pageContext.request.contextPath}/personMatching?command=personalDelete&personal_seq=${detail.personal_seq}"
					class="col-1-8 btn btn-primary"
					style="float: right; margin: 0 0 0 15px">삭제</a>
				<!-- <button type="submit" class="col-1-8 btn btn-primary"
						style="float: right;">수정</button> -->
				<input type="submit" value="수정" class="col-1-8 btn btn-primary"
					style="float: right;">
			</c:if>
		</div>
		<br />
	</form>


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
						<input type="hidden" name="command" value="sendMsg" /> <input
							type="hidden" name="send_id" value="${u_id }" /> <input
							type="hidden" name="backMsgBox" value="no" />
						<!-- 어디 모달에서 보내는지 구별하기 위해 -->
						<div class="form-group">
							<label class="col-sm-12" for="inputTo" style="margin:10px"><span
								class="glyphicon glyphicon-user"></span>받는사람</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTo"
									placeholder="comma separated list of recipients"
									readonly="readonly" name="get_id" style="width: 350px">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody" style="margin:10px">쪽지 내용</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="inputBody" rows="8"
									name="content" style="resize: none;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="reset" id="reset" class="btn btn-default pull-left"
								data-dismiss="modal" style="border: 1px solid lightgray;"
								value="취소" /> <input type="button" class="btn btn-primary"
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
	
		<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>