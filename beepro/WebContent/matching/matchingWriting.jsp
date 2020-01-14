<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEEPRO - 프로젝트 매칭 생성하기</title>
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
   
   //빈 칸 alert창
   $(document).ready(function(){
   	$("#submit").click(function(){
 	 if($("#title").val().length==0){alert("프로젝트 제목을 입력하세요."); $("title").focus(); return false;}
  	 if($("#skill").val().length==0){alert("프로그램 능력을 입력하세요."); $("skill").focus(); return false;}
  	 if($("#startdate").val().length==0){alert("프로젝트 시작일을 입력하세요."); $("startdate").focus(); return false;}
  	 if($("#enddate").val().length==0){alert("프로젝트 마감일을 입력하세요."); $("enddate").focus(); return false;}
  	 if($("#location").val().length==0){alert("지역을 입력하세요."); $("location").focus(); return false;}
  	 if($("#need_person").val().length==0){alert("인원을 입력하세요."); $("need_person").focus(); return false;}
  	 if($("#content").val().length==0){alert("상세 내용을 입력하세요."); $("content").focus(); return false;}

   });
   });
   
</script>
</head>
<body>
	<c:import url="common/nav_bar.jsp">
  		<c:param name="pageName" value="matching"></c:param>
  	</c:import>	
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
               <input type="text" id="skill" class="floatLabel" name="skill" data-role="tagsinput">
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
               <select class="floatLabel" id="location" name="location">
                  <option value="" >지역을 선택하세요</option>
                  <option value="서울">서울</option>
                  <option value="강원">강원</option>
                  <option value="경기">경기</option>
                  <option value="광주">광주</option>
                  <option value="경남">경남</option>
                  <option value="경북">경북</option>
                  <option value="대구">대구</option>
                  <option value="대전">대전</option>
                  <option value="부산">부산</option>
                  <option value="세종">세종</option>
                  <option value="울산">울산</option>
                  <option value="인천">인천</option>
                  <option value="전북">전북</option>
                  <option value="전남">전남</option>
                  <option value="충북">충북</option>
                  <option value="충남">충남</option>
                  <option value="제주">제주</option>
                  <option value="온라인">온라인</option>
               </select>
            </div>
         </div>
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
                <div class="controls">
                  <i class="fa fa-sort"></i> <select class="floatLabel" id="need_person" name="need_person">
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
                </div> 
               </div>
            </div>
            <br />
            <div class="grid">

               <div class="controls">
                  <p class="info-text margin-b-10">상세 내용</p>
                  <textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요."></textarea>
               </div>
               <input type="submit" id="submit" class="col-1-4 btn btn-primary" style="float: right;"/>
            </div>

         </div>
         <!-- /.form-group -->
      </form>
</body>
</html>