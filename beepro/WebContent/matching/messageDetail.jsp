<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<link href="${pageContext.request.contextPath}/matching/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- /.modal compose message -->

	<div class="modal show" id="modalCompose">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-info">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">
						<span class="glyphicon glyphicon-envelope"></span> 받은 쪽지
					</h4>
				</div>
				<div class="modal-body">
				
					<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/msg?command=sendMsg">
						<input type="hidden" name="send_id"  value="u_id(세션값)"/>
						<div class="form-group">
							<label class="col-sm-2" for="inputTo"><span class="glyphicon glyphicon-user"></span>보낸사람</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTo"
									placeholder="comma separated list of recipients" readonly="readonly" name="get_id" value="id" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody"><span
								class="glyphicon glyphicon-list"></span>쪽지 내용</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="inputBody" rows="8" name="content" readonly="readonly" style="resize: none;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default pull-left"
								data-dismiss="modal" value="취소"/>
							<!-- <button type="button" class="btn btn-warning pull-left">Save
								Draft</button> -->
							<input type="submit" class="btn btn-primary" style="background-color:#fec503;border-color: #fec503;"
								value="답장하기" />
						
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
