<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/msg.css" rel="stylesheet">

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
						<span class="glyphicon glyphicon-envelope"></span> 쪽지보내기
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2" for="inputTo"><span
								class="glyphicon glyphicon-user"></span>받는사람</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputTo"
									placeholder="comma separated list of recipients">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2" for="inputSubject"><span
								class="glyphicon glyphicon-list-alt"></span>제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputSubject"
									placeholder="subject">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody"><span
								class="glyphicon glyphicon-list"></span>쪽지 내용</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="inputBody" rows="8"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default pull-left"
								data-dismiss="modal" value="취소"/>
							<!-- <button type="button" class="btn btn-warning pull-left">Save
								Draft</button> -->
							<input type="submit" class="btn btn-primary" style="background-color:#fec503;border-color: #fec503;"
								value="보내기" />
						
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
