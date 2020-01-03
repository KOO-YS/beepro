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
      });
      // just add a class of "floatLabel to the input field!"
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
	<form action="${pageContext.request.contextPath}/matching" method="post">
		<input type="hidden" name="command"  value="matchingWrite"/>	
   <div class="container margin-t-100">
         <!--  General -->
         <div class="form-group">
            <h2 class="heading">새 글 작성</h2>
            <div class="controls">
               <input type="text" id="title" class="floatLabel" name="title" placeholder="프로젝트 제목을 입력하세요">

            </div>
            <div class="controls">
               <input type="text" class="floatLabel" value="${u_name}" readonly >
            </div>
            <div class="controls2">
               <input type="text" id="skill" class="floatLabel" name="skill" data-role="tagsinput" >
            </div>
         </div>
         <div class="grid">
            <div class="col-1-4 col-1-4-sm">
               <div class="controls">
                  <i class="fa fa-calendar"></i>
                  <span class="gray">&nbsp;&nbsp;프로젝트 시작일</span>
                  <input type="date" id="startdate" name="startdate" class="floatLabel">
               </div>
            </div>
            <div class="col-1-4 col-1-4-sm">
               <div class="controls">
                  <i class="fa fa-calendar"></i>
                  <span class="gray">&nbsp;&nbsp;프로젝트 종료일 </span>
                  <input type="date" id="enddate" class="floatLabel" name="enddate" placeholder="프로젝트 종료"/>
               </div>
            </div>
         </div>
         <div class="col-1-3 col-1-3-sm">
            <div class="controls">
               <i class="fa fa-sort"></i> 
               <select class="floatLabel" name="location">
                  <option value="" >지역을 선택하세요</option>
                  <option value="seoul">서울</option>
                  <option value="gangwon">강원</option>
                  <option value="gyeonggi">경기</option>
                  <option value="gwangju">광주</option>
                  <option value="gyeongnam">경남</option>
                  <option value="gyeongbuk">경북</option>
                  <option value="daegu">대구</option>
                  <option value="daejeon">대전</option>
                  <option value="busan">부산</option>
                  <option value="sejong">세종</option>
                  <option value="ulsan">울산</option>
                  <option value="incheon">인천</option>
                  <option value="jeonbuk">전북</option>
                  <option value="jeonnam">전남</option>
                  <option value="chungbuk">충북</option>
                  <option value="chungnam">충남</option>
                  <option value="jeju">제주</option>
               </select>
            </div>
         </div>
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
            <div class="controls">
            	<input type="number" id="skill" class="floatLabel" name="need_person" placeholder="인원을 선택하세요">
            </div>
               <!-- <div class="controls">
                  <i class="fa fa-sort"></i> <select class="floatLabel" name="need_person">
                     <option value="">인원을 선택하세요</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                     <option value="8">8</option>
                     <option value="9">9</option>
                     <option value="10">10인 이상</option>
                  </select>
                </div> -->
               </div>
            </div>
            <br />
            <div class="grid">

               <div class="controls">
                  <p class="info-text margin-b-10">상세 내용</p>
                  <textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요."></textarea>
               </div>
               <input type="submit" class="col-1-4 btn btn-primary" style="float: right;"/>
            </div>

         </div>
         <!-- /.form-group -->
      </form>
</body>
</html>