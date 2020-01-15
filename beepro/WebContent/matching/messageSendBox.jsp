<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">

<title>BEEPRO - 보낸 쪽지함</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/matching/css/msg.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<%-- <link href="${pageContext.request.contextPath}/matching/css/bootstrap.css" rel="stylesheet">
 --%>
<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
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
<link href="${pageContext.request.contextPath}/matching/css/agency.css"
	rel="stylesheet">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- heart button https://codepen.io/kieranfivestars/pen/PwzjgN-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
.chk-block:hover {
	cursor:pointer;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, .1);
    background-color: rgba(78,115,223);
    color:white;
  padding: 20px;
  border-radius: 10px;
}
</style>
<script type="text/javascript">
	function allsel(check){
		var chks = document.getElementsByName("chk");
		for(var i=0; i<chks.length;i++){
			chks[i].checked = check;
		}
	}
	function showMsgFunction(no){
 		var modal = document.getElementById('detailMsg'+no);
 	  	var cancle = document.getElementById("cancle"+no);
 	  	var close = document.getElementById("close"+no);
     	modal.style.display = "block";
    	window.onclick = function(event) {
     	   if (event.target == $('#detailMsg'+no)) {
    	        modal.style.display = "none";
   	     }
    	}
     	cancle.onclick = function() {
        	modal.style.display = "none";
        }	   
     	close.onclick = function() {
        	modal.style.display = "none";
        } 
     	
	}
	function reSendFunction(get_id){
		$('#sendMsgModal').css("display","block");
		$('#inputTo').val(get_id);
		$('#reset').click(function(){
			$('#sendMsgModal').css("display","none");
		});
		$('#close').click(function(){
			$('#sendMsgModal').css("display","none");
		});
	}
	
	function deleteMsgFunction(){
		if($("input[name='chk']:checked").length == 0){
			alert("삭제할 쪽지를 선택해 주세요.");
		}else{
			var delConfirm = confirm('선택한 쪽지를 삭제하시겠습니까?');
			if (delConfirm) {
				var list = [];
				var data;
				$("input[name='chk']:checked").each(function(i){  
					list.push($(this).val());
				});
			
				  $.ajaxSettings.traditional = true; 
				  $.ajax({
			            type : "POST",
			            url : "${pageContext.request.contextPath}/msg?command=deleteSendMsg",
			            data : {
			            	list :list
			            },
			            success : function(res){
			            	if(res>0){
			            		location.reload();
			            	}else{
			            		alert("삭제 실패");
			            	}
			            }
			         }); 
			}
		}
	}
	
</script>

</head>

<body id="page-top">

	<c:import url="common/nav_bar.jsp">
  		<c:param name="pageName" value="matching"></c:param>
  	</c:import>

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
			<div class="row">
				<div class="col-2">
					<div class="chk-block"
						style="margin-top: 50px; text-align: center; color: gray"
						onclick="location.href='${pageContext.request.contextPath}/msg?command=getAllMsg&u_id=${u_id }'">
						<h5>받은 쪽지함</h5>
					</div>
					<div class="chk-block"
						style="margin-top: 20px; text-align: center; background-color: #4e73df; color: white"
						onclick="location.href='${pageContext.request.contextPath}/msg?command=sendAllMsg&u_id=${u_id }'">
						<h5>보낸 쪽지함</h5>
					</div>
				</div>

				<!-- 본격적으로 내용이 담기는 div -->
				<div class="col-10">
					<div class="table-wrapper" id="getBox">
						<input class="btn btn-primary" style="margin-bottom: 10px; margin-top:40px;"
							type="button" value="삭제" onclick="deleteMsgFunction();" />
						<form action="">
							<table class="table table-hover" id="boxTable"
								style="text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
								<!-- 쪽지목록 추가 부분 -->
								<col width="3">
								<col width="40">
								<col width="200">
								<col width="70">
								<col width="5">
								<thead>
									<tr>
										<th><input type="checkbox" name="all"
											onclick="allsel(this.checked);" /></th>
										<th>받는사람</th>
										<th>내용</th>
										<th>날짜</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody style="background-color: white">

									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="5">보낸 쪽지가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${list }" begin="${page.startRow}" end="${page.startRow + 9}" varStatus="status">
												<c:forEach var="readList" items="${readList}">
													<c:if test="${ readList eq list.msg_seq}">
														<script type="text/javascript">
												$( document ).ready(function() {
													$('#read${list.msg_seq}').text('읽음');
												});
										</script>
													</c:if>
												</c:forEach>
												<tr id="msg${list.msg_seq}">
													<td><input type="checkbox" name="chk"
														value="${list.msg_seq }"></td>
													<td>${list.get_id }</td>
													<td style="text-align: left;"
														onclick="showMsgFunction(${list.msg_seq});">${list.content }</td>
													<td><small>${list.regdate }</small></td>
													<td id="read${list.msg_seq}"></td>
												</tr>


												<!-- 쪽지 디테일 모달 -->
												<div class="modal show" id="detailMsg${list.msg_seq}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header modal-header-info">
																<h4 class="modal-title">
																	<span class="glyphicon glyphicon-envelope"></span> 보낸
																	쪽지
																</h4>
																<button type="button" class="close"
																	id="close${list.msg_seq}" data-dismiss="modal"
																	aria-hidden="true">×</button>
															</div>
															<div class="modal-body">
																<div class="form-group">
																	<label class="col-sm-12" for="inputTo"><span
																		class="glyphicon glyphicon-user"></span>받은 사람</label>
																	<div class="col-sm-10">
																		<input type="text" class="form-control"
																			id="inputTo${list.msg_seq}"
																			placeholder="comma separated list of recipients"
																			readonly="readonly" name="get_id" style="width: 430px"
																			value="${list.get_id }">
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-sm-12" for="inputBody"><span
																		class="glyphicon glyphicon-list"></span>쪽지 내용</label>
																	<div class="col-sm-12">
																		<textarea class="form-control"
																			id="inputBody${list.msg_seq}" rows="8" name="content"
																			readonly="readonly" style="resize: none;">${list.content }</textarea>
																	</div>
																</div>
																<div class="modal-footer">
																	<input type="reset" class="btn btn-default pull-left"
																		id="cancle${list.msg_seq}" data-dismiss="modal"
																		style="border: 1px solid lightgray;" value="확인" />
																</div>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>
												<!-- /.modal compose message -->

											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</form>
					</div>
					
					<!-- 페이징 : 여기에서부터 -->	
               
                 
<script type="text/javascript">
   function PageMove(page){
          location.href = "msg?command=sendAllMsg&u_id=${u_id}&curpagenum="+page;
   }
</script> 

<c:if test="${listsize>=0 }">
   <c:choose> 
      <c:when test="${listsize == 0}">
         <script>
            $("#tableheader").hide();
         </script>
      </c:when>
      
      <c:otherwise>
         <c:forEach var="vo" items="${list}" begin="${page.startRow}" end="${page.startRow+9}" ></c:forEach>
   
      </c:otherwise>
   </c:choose>
</c:if>

<c:choose> 
   <c:when test="${page.listCount >0 }">
      <c:if test="${page.listCount ne '0'}">

         <div class="row" style="display: block;">
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
               <li class="active">
                  <a class="page-link" href="javascript:PageMove(${page.startPage})">Pre</a>
               </li>

                  <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }" >
                     <c:choose>
                        <c:when test="${i eq page.currentPage }">
                           <li class="active"><a class="page-link" href="javascript:PageMove(${i})">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                           <li><a class="page-link" href="javascript:PageMove(${i})">${i}</a></li>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>

                  <c:if test="${page.next eq true }">
                     <a class="page-link" href="javascript:PageMove(${page.endPage })">Last</a></li>
                  </c:if>
               </ul>
            </nav>
         </div> 

      </c:if>
   </c:when>
</c:choose>

<!-- 여기까지 복붙 : 페이징 완료 -->
					
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

</body>
</html>
