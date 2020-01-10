<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEEPRO - 글 작성</title>

<link href="${pageContext.request.contextPath}/matching/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/matching/css/jquery.tag-editor.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/agency.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/matching/css/notice.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
<script src="${pageContext.request.contextPath}/matching/js/plugins/tagEditor/jquery.caret.min.js"></script>
<script src="${pageContext.request.contextPath}/matching/js/plugins/tagEditor/jquery.tag-editor.js"></script>
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
		
</script>
</head>
<body>
	  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	    <div class="container">
	      <a class="navbar-brand js-scroll-trigger" href="index.jsp">BeePro	</a>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu
	        <i class="fas fa-bars"></i>
	      </button>
	      <div class="collapse navbar-collapse" id="">
	        <ul class="navbar-nav text-uppercase ml-auto">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#matching" id="match-sub" >매칭 matching</a>
	            <ul class="sub-nav">
	              <li><a class="nav-link" href="project.jsp">by project</a></li>
	              <li><a class="nav-link" href="personal.jsp">by personal</a></li>
	            </ul>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#about">협업 cowork</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="mypage.jsp">마이페이지</a>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	<form action="personMatching" method="get">
	<input type="hidden" name="command"  value="personalUpdate"/>
	<input type="hidden" name="personal_seq" value="${detail.personal_seq}">
    <div class="container margin-t-100">
    
         <!-- ---------------- 글 상세보기 페이지 내부 ---------------- -->
         <div class="form-group">
            <h2 class="heading">새 글 작성</h2>
            <div class="controls">
            <c:choose>
               <c:when test="${detail.user_id eq u_id}"><input type="text" id="title" class="floatLabel" name="title" placeholder="${detail.title}" value="${detail.title}"> </c:when>   
               <c:otherwise><input type="text" id="title" class="floatLabel" name="title" placeholder="${detail.title}" value="${detail.title}" readOnly="readOnly"> </c:otherwise>
            </c:choose>
            </div>
            <div class="controls2">
            <c:if test="${detail.user_id eq u_id}"><input type="text" id="skill" class="floatLabel" name="skill" data-role="tagsinput" value="${detail.skill}"></c:if>
            </div>
         </div>
         
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
               <div class="controls">
               <select class="floatLabel" name="emp_category">
               <option value="${detail.emp_category}">"${detail.emp_category}"</option>
               		<c:if test="${detail.user_id eq u_id}"><i class="fa fa-sort"></i>
                    	 <option value="백엔드" <c:if test="${detail.emp_category eq '백엔드' }">selected</c:if>>백엔드</option>
                   		 <option value="프론트엔드" <c:if test="${detail.emp_category eq '프론트엔드' }">selected</c:if>>프론트엔드</option>
                    </c:if>
                  </select>
                </div>
               </div>
            </div>
            
            <br />
            
            <div class="grid">
               <div class="controls">
               <p class="info-text margin-b-10">상세 내용</p>
               <c:choose>
               <c:when test="${detail.user_id eq u_id}"><textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요.">${detail.content}</textarea> </c:when>   
               <c:otherwise><textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요." readOnly>${detail.content}</textarea> </c:otherwise>
            </c:choose>
                  
		</div>
		<!-- ---------------- 글 상세보기 페이지 내부 여기까지 ---------------- -->
		
		
               
				<a href="${pageContext.request.contextPath}/personMatching?command=selectAllPer" class="col-1-4 btn btn-primary" style="float: left;">목록</a>
               
		<!-- ---------------- 글 수정/삭제 버튼의 경우 글쓴이 = 로그인 유저와 동일할 경우에만 노출 ---------------- -->
				<c:if test="${detail.user_id eq u_id}">
					<a href="${pageContext.request.contextPath}/personMatching?command=personalDelete&personal_seq=${detail.personal_seq}" class="col-1-8 btn btn-primary" style="float: right;">삭제</a>
					<button type="submit" class="col-1-8 btn btn-primary" style="float: right;">수정</button>
				</c:if>
				    
			</div>
		</div>
	</form>
</body>
</html>