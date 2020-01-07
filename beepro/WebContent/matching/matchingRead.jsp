<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/matching/js/plugins/tagEditor/jquery.caret.min.js"></script>
<script src="${pageContext.request.contextPath}/matching/js/plugins/tagEditor/jquery.tag-editor.js"></script>
<script type="text/javascript">
   (function($) {
      function floatLabel(inputType) {
         $(inputType).each(function() {
            var $this = $(this);
            // on focus add cladd active to label
            $this.focus(function() {
               $this.next().addClass("active");
            });
            //on blur check field and remove class if needed
            $this.blur(function() {
               if ($this.val() === '' || $this.val() === 'blank') {
                  $this.next().removeClass();
               }
            });
         });
      }
      $(document).ready(function(){
    	  var skill = new Array();
    	  <c:if test="${!empty matchingVo}" >
	    	  <c:forEach var="skill" items="${matchingVo.skillArr}">
	  				skill.push('${skill}');
	  		  </c:forEach>
	  	  </c:if>
         $('#skill').tagEditor({
        	 placeholder : '언어 및 프로그램 능력을 작성하세요'
        	,initialTags: skill
        	,autocomplete: {
    	        delay: 0 // show suggestions immediately
    	        ,position: { collision: 'flip' } // automatic menu position up/down
                ,source: ['java', 'phython', 'C/C++', 'php', 'Python', 'Go']
    	    }
        	 });
         $("#modifyBtn").on("click",function(){
        	 $("form[name=modifyForm]").submit();
         });
         
         $("#deleteBtn").on("click",function(){
             $("input[name=command]").val("matchingDelete");
             $("form[name=modifyForm]").submit();
          });
      });
      // just add a class of "floatLabel to the input field!"
      floatLabel(".floatLabel");
   })(jQuery);
   
      

		
</script>
</head>
<body>
	  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	    <div class="container">
	      <a class="navbar-brand js-scroll-trigger" href="matching/index.jsp">BeePro	</a>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu
	        <i class="fas fa-bars"></i>
	      </button>
	      <div class="collapse navbar-collapse" id="">
	        <ul class="navbar-nav text-uppercase ml-auto">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger" href="#matching" id="match-sub" >매칭 matching</a>
	            <ul class="sub-nav">
	              <li><a class="nav-link" href="${pageContext.request.contextPath}/matching?command=matchingAll">by project</a></li>
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
	<form action="${pageContext.request.contextPath}/matching" method="post" name="modifyForm">
		<c:choose>
			<c:when test="${empty matchingVo }">
				<input type="hidden" name="command"  value="matchingWrite"/>	
			</c:when>
			<c:otherwise>
				<input type="hidden" name="command"  value="matchingModifyProc"/>	
				<input type="hidden" name="project_seq" value="${matchingVo.project_seq }">
			</c:otherwise>
		</c:choose>
   <div class="container margin-t-100">
         <!--  General -->
         <div class="form-group">
            <h2 class="heading">새 글 작성</h2>
            <div class="controls">
               <input type="text" id="title" class="floatLabel" name="title" placeholder="프로젝트 제목을 입력하세요" value="${matchingVo.title }" <c:if test="${!matchingVo.modifyYn }">readonly</c:if>>
            </div>
            <div class="controls">
               <input type="text" class="floatLabel" value="김지민" readonly >
            </div>
            <div class="controls2">
               <input type="text" id="skill" class="floatLabel" name="skill" data-role="tagsinput" readonly="readonly"<c:if test="${!matchingVo.modifyYn }"></c:if>>
            </div>
         </div>
         <div class="grid">
            <div class="col-1-4 col-1-4-sm">
               <div class="controls">
                  <i class="fa fa-calendar"></i>
                  <span class="gray">&nbsp;&nbsp;프로젝트 시작일</span>
                  <input type="date" id="startdate" name="startdate" class="floatLabel" value="${matchingVo.startdate }" <c:if test="${!matchingVo.modifyYn }">readonly</c:if> />
               </div>
            </div>
            <div class="col-1-4 col-1-4-sm">
               <div class="controls">
                  <i class="fa fa-calendar"></i>
                  <span class="gray">&nbsp;&nbsp;프로젝트 종료일 </span>
                  <input type="date" id="enddate" class="floatLabel" name="enddate" placeholder="프로젝트 종료" value="${matchingVo.enddate }" <c:if test="${!matchingVo.modifyYn }">readonly</c:if>/>
               </div>
            </div>
         </div>
         <div class="col-1-3 col-1-3-sm">
            <div class="controls">
               <c:if test="${matchingVo.modifyYn }"><i class="fa fa-sort"></i></c:if>
               <select class="floatLabel" name="location" <c:if test="${!matchingVo.modifyYn }">disabled="disabled"</c:if>>
                  <option value="" >지역을 선택하세요</option>
                  <option value="서울" <c:if test="${matchingVo.location eq '서울' }">selected</c:if>>서울</option>
                  <option value="강원" <c:if test="${matchingVo.location eq '강원' }">selected</c:if>>강원</option>
                  <option value="경기" <c:if test="${matchingVo.location eq '경기' }">selected</c:if>>경기</option>
                  <option value="광주" <c:if test="${matchingVo.location eq '광주' }">selected</c:if>>광주</option>
                  <option value="경남" <c:if test="${matchingVo.location eq '경남' }">selected</c:if>>경남</option>
                  <option value="경북" <c:if test="${matchingVo.location eq '경북' }">selected</c:if> >경북</option>
                  <option value="대구" <c:if test="${matchingVo.location eq '대구' }">selected</c:if>>대구</option>
                  <option value="대전" <c:if test="${matchingVo.location eq '대전' }">selected</c:if>>대전</option>
                  <option value="부산" <c:if test="${matchingVo.location eq '부산' }">selected</c:if>>부산</option>
                  <option value="세종" <c:if test="${matchingVo.location eq '세종' }">selected</c:if>>세종</option>
                  <option value="울산" <c:if test="${matchingVo.location eq '울산' }">selected</c:if>>울산</option>
                  <option value="인천" <c:if test="${matchingVo.location eq '인천' }">selected</c:if>>인천</option>
                  <option value="전북" <c:if test="${matchingVo.location eq '전북' }">selected</c:if>>전북</option>
                  <option value="전남" <c:if test="${matchingVo.location eq '전남' }">selected</c:if>>전남</option>
                  <option value="충북" <c:if test="${matchingVo.location eq '충북' }">selected</c:if>>충북</option>
                  <option value="충남" <c:if test="${matchingVo.location eq '충남' }">selected</c:if>>충남</option>
                  <option value="제주" <c:if test="${matchingVo.location eq '제주' }">selected</c:if>>제주</option>
               </select>
            </div>
         </div>
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
               <div class="controls">
               	<c:choose>
               		<c:when test="${matchingVo.modifyYn }">
               			<i class="fa fa-sort"></i>
               			<select class="floatLabel" name="need_person">
	                     <option value="1" <c:if test="${matchingVo.need_person eq '1' }">selected</c:if>>1</option>
	                     <option value="2" <c:if test="${matchingVo.need_person eq '2' }">selected</c:if>>2</option>
	                     <option value="3" <c:if test="${matchingVo.need_person eq '3' }">selected</c:if>>3</option>
	                     <option value="4" <c:if test="${matchingVo.need_person eq '4' }">selected</c:if>>4</option>
	                     <option value="5" <c:if test="${matchingVo.need_person eq '5' }">selected</c:if>>5</option>
	                     <option value="6" <c:if test="${matchingVo.need_person eq '6' }">selected</c:if>>6</option>
	                     <option value="7" <c:if test="${matchingVo.need_person eq '7' }">selected</c:if>>7</option>
	                     <option value="8" <c:if test="${matchingVo.need_person eq '8' }">selected</c:if>>8</option>
	                     <option value="9" <c:if test="${matchingVo.need_person eq '9' }">selected</c:if>>9</option>
	                     <option value="10" <c:if test="${matchingVo.need_person eq '10' }">selected</c:if>>10인 이상</option>
                    	</select>
               		</c:when>
               		<c:otherwise>
               			<input type="text" class="floatLabel" name="need_person" value="${matchingVo.need_person}" <c:if test="${!matchingVo.modifyYn }">readonly</c:if>/>
               		</c:otherwise>
               	</c:choose>
                </div>
               </div>
            </div>
            <br />
            <div class="grid">

               <div class="controls">
                  <p class="info-text margin-b-10">상세 내용</p>
                  <textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요." <c:if test="${!matchingVo.modifyYn }">readonly</c:if>>${matchingVo.content}</textarea>
               </div>
               <a href="${pageContext.request.contextPath}/matching?command=matchingAll" class="col-1-8 btn btn-primary" style="float: left;">목록</a>
               <c:if test="${matchingVo.modifyYn }">
               	<button type="button" class="col-1-8 btn btn-primary" style="float: right;" id="deleteBtn">삭제</button>
               	<button type="button" class="col-1-8 btn btn-primary" style="float: right;" id="modifyBtn">수정</button>
               </c:if>
            </div>

         </div>
         <!-- /.form-group -->
      </form>
</body>
</html>