<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
<link href="${pageContext.request.contextPath}/cowork/css/issueWriteTable.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/cowork/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/cowork/js/sb-admin-2.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
	    $("#issue_content").click(function(){
	        $("#member").attr("disabled",false).attr("readonly",false);    	
	    });
	    
	    $("#title").click(function(){
	        $("#p_name").attr("disabled",false).attr("readonly",false);    	
	    });
	});

  
</script>
<title>BEEPRO - 이슈 수정하기</title>
<style>
.rate {
    float: left;
    height: 46px;
    /* padding: 0 10px; */
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}

#project_name {
	padding: 30px;
	width: 100%;
	height: auto;
	margin-top: 15px;
	border-radius: 5px;
	border: 1px solid rgb(75, 97, 207);
	font-size: 18px;
	cursor: pointer;
}

#add:hover { color:rgb(46,89,217);
             text-decoration:underline;
           }
</style>
</head>
<body>
<%
	String u_id = null;
	if (session.getAttribute("u_id") != null) {
		u_id = (String)session.getAttribute("u_id");
	}
%>
   <div id="wrapper">
   <jsp:include page="common/side_bar.jsp"></jsp:include>
      <!-- 상단 메뉴 바 -->
      <div id="headers"></div>

      <!-- 내용이 들어갈 구역을 정의하는 div -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- 메인 내용이 들어갈 구역을 정의하는 div -->
         <div id="content">
              <jsp:include page="common/top_bar.jsp"></jsp:include>
            <!-- 왼쪽 메뉴 바 -->
            <div id="top_bar"></div>

            <!-- 본격적으로 내용이 담기는 div -->
            <div class="container-fluid">
               <div class="container">
                  <h5><b>이슈 수정</b></h5>
                  <hr>
                  <form action="${pageContext.request.contextPath}/issue?command=issueUpdateform&projectSeq=${projectSeq}&issue_seq=${vo.issueSeq}" method="post">
                     <div class="row">
                       <div class="form-group col-lg-8">
                         <label for="title">이슈 제목<span style="color:red;"> *</span></label>
                         <input type="text" class="form-control" id="title" name="title" value="${vo.title}">
                       </div>
                       <div class="form-group col-lg-4">
                         <label for="category">프로젝트 명<span style="color:red;"> *</span></label>
                         <input type="text" class="form-control" name="projectName" value="${pName}" readonly>
                       </div> 
                     </div>
                       <div class="form-group">
                         <label for="content">이슈 내용</label>
                         <textarea class="form-control" id="issue_content" name="content" rows="10">${vo.content}</textarea>
                       </div>
                     <div class="row">
                       <div class="form-group col-lg-6 form-checkbox form-checkbox-inline">
                         <label for="content">이슈타입<span style="color:red;"> *</span></label><br>
                        <label class="form-checkbox-label">
                        <input name="category" class="form-radio-field" type="radio" value="버그" <c:if test="${ vo.category eq '버그'}">checked="checked"</c:if>/>
                        <i class="form-radio-button"></i>
                        <span>버그</span>
                   </label>
               <label class="form-checkbox-label">
                <input name="category" class="form-radio-field" type="radio" value="개선" <c:if test="${ vo.category eq '개선'}">checked="checked"</c:if>/>
                <i class="form-radio-button"></i>
                <span>개선</span>
            </label>
            <label class="form-checkbox-label">
                <input name="category" class="form-radio-field" type="radio" value="요구사항" <c:if test="${ vo.category eq '요구사항'}">checked="checked"</c:if>/>
                <i class="form-radio-button"></i>
                <span>요구사항</span>
            </label>
            <label class="form-checkbox-label">
                <input name="category" class="form-radio-field" type="radio" value="테스트케이스" <c:if test="${ vo.category eq '테스트케이스'}">checked="checked"</c:if>/>
                <i class="form-radio-button"></i>
                <span>테스트 케이스</span>
            </label>
           </div>
             <div class="form-group col-lg-6" style="margin-top:35px;">
                <label for="content">담당자</label>
                <input type="text" class="form-control" name="responsibility" value="${vo.responsibility}" readonly>
             </div>
           </div>
                     <div class="form-group col-lg-12" style=" margin-top:12px; ">
                        <label for="content" style="margin-left:-265px;">중요도<span style="color:red;"> *</span></label>
                         <label class="form-radio-label" style="float:left; margin-right:15px; margin-left:-15px;">
                         <input name="level" class="form-radio-field" type="radio" id="level" required value="심각" <c:if test="${ vo.level eq '심각'}">checked="checked"</c:if>/>
                         <i class="form-radio-button"></i>
                        <span>심각</span>
                       </label>
            <label class="form-radio-label" style="float:left; margin-right:15px;">
                <input name="level" class="form-radio-field" type="radio" id="level" required value="높음" <c:if test="${ vo.level eq '높음'}">checked="checked"</c:if>/>
                <i class="form-radio-button"></i>
                <span>높음</span>
            </label>
            <label class="form-radio-label" style="float:left; margin-right:15px;">
                <input name="level" class="form-radio-field" type="radio" id="level" required value="보통" <c:if test="${ vo.level eq '보통'}">checked="checked"</c:if>/>
                <i class="form-radio-button"></i>
                <span>보통</span>
            </label>
            <label class="form-radio-label" style="float:left;">
                <input name="level" class="form-radio-field" type="radio" id="level" required value="낮음" <c:if test="${ vo.level eq '낮음'}">checked="checked"</c:if>/>
                <i class="form-radio-button"></i>
                <span>낮음</span>
            </label>
                     </div>
                      <button type="submit" class="btn btn-primary" style="float:right;">작  성</button>&nbsp;&nbsp;
                      <button class="btn btn-primary" style="float:right; background-color:white; color:rgb(75,97,207)"
                      onclick="location.href='../issue?command=issueAll'">취   소</button>
                  </form>
               </div>
            </div>
         </div>
         <!-- 푸터 -->
         <jsp:include page="common/footer.html"></jsp:include>
      </div>
   </div>
   
	<!-- 워크스페이스 모달  -->
	<div class="modal fade" id="workspaceModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="color: black;">워크 스페이스 이동</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" style="font-size: 14px;">
					<div id="test100"></div>
					<c:choose>
						<c:when test="${empty projectVo}">
							<div id="none">
								이동할 워크스페이스가 존재하지 않습니다.<br> 매칭을 통해 생성하십시오.<br> <a
									class="btn btn-primary" href="${pageContext.request.contextPath}/matching?command=matchingAll">매칭하러가기</a>
							</div>
						</c:when>

						<c:otherwise>
	                                          이동하실 워크 스페이스를 선택하세요.
	                   <span style="font-size:13px; float:right;">
	                      <a href="${pageContext.request.contextPath}/matching?command=matchingAll" id="add">+ 추가하기</a>
	                   </span>
	               <c:forEach var="vo" items="${projectVo}">
	                  <c:if test="${vo.projectSeq eq projectSeq}">
								<div id="project_name" style="background-color:rgb(75,97,207); border:0px; color:white;"
									onclick="location.href='${pageContext.request.contextPath}/matching?command=selectOneProject&projectSeq=${vo.projectSeq}'">
									<div id="title" style="color:white;">${vo.projectName}</div>

									<div id="content">${vo.member}</div>

									<div id="period">${vo.startDate} - ${vo.endDate}</div>
								</div>
					  </c:if>
					   <c:if test="${vo.projectSeq ne projectSeq}">
								<div id="project_name"
									onclick="location.href='${pageContext.request.contextPath}/matching?command=selectOneProject&projectSeq=${vo.projectSeq}'">
									<div id="title">${vo.projectName}</div>

									<div id="content">${vo.member}</div>

									<div id="period">${vo.startDate} - ${vo.endDate}</div>
								</div>
					  </c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
    </div>
</body>
</html>