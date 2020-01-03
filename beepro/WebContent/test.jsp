<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/cowork/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function() {
		// 최상단의 전체선택 클릭 시 
		$("#all").click(function() {
			// 클릭 되었다면
			if ($("#all").prop("checked")) {
				$("input[name=test]").prop("checked", true);
			} else {
				// 클릭이 안되었다면
				$("input[name=test]").prop("checked", false);
			}
		});
	});
</script>
<title>테스트</title>
</head>
<body>
	<input type="checkbox" id="all">전체선택
	<br><br>
	<input type="checkbox" name="test" value="사람1">사람1
	<br>
	<input type="checkbox" name="test" value="사람2">사람2
	<br>
	<input type="checkbox" name="test" value="사람3">사람3
	<br>
	<input type="checkbox" name="test" value="사람4">사람4
	<br>
	<input type="checkbox" name="test" value="사람5">사람5
	<br>
	<input type="checkbox" name="test" value="사람6">사람6
	<br>
	<input type="checkbox" name="test" value="사람7">사람7
	<br>
	<br>

    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal2">
    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
               워크스페이스 이동
    </a>
    
	<div class="modal fade" id="logoutModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	   <div class="modal-content">
	     <div class="modal-header">
	       <h5 class="modal-title" id="exampleModalCenterTitle" style="color:black; font-weight:bold;">프로젝트 만들기</h5>
	       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         <span aria-hidden="true">&times;</span>
	       </button>
	     </div>
	     <div class="modal-body">
	       <form>
	        <p style="color:#334152;">프로젝트 명<span style="color:red;"> *</span></p>
	        <input type="text" name="pro_title" size="60"><br><br>
	        
	        <p style="color:#334152;">기간<span style="color:red;"> *</span></p>
	        <input type="text" class="form-control" id="from" name="from" style="width:200px;"> ~
	        <input type="text" class="form-control" id="to" name="to" style="width:200px;">
	        <br><br>
	        
	        <p style="color:#334152;">개요</p>
	        <textarea cols="62"></textarea>
	        
	        <p style="color:#334152;">프로젝트 관리자<span style="color:red;"> *</span></p>
	        <input type="text" name="pro_title" size="60"><br><br>
	        
	        <p style="color:#334152;">프로젝트 팀원<span style="color:red;"> *</span></p>
	        <input type="text" name="pro_title" size="60"><br><br>
	       </form>
	     </div>
	     <div class="modal-footer">
	       <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
	       <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/cowork/dashboard.jsp'">생 성</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>