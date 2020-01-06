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
   
      
   $(document).ready(function() {
		// 최상단의 전체선택 클릭 시 
		$("#chkall").click(function() {
			// 클릭 되었다면
			if ($("#chkall").prop("checked")) {
				$("input[name=vol]").prop("checked", true);
			} else {
				// 클릭이 안되었다면
				$("input[name=vol]").prop("checked", false);
			}
		});
	});
   
   // 다중 체크박스 선택 값 가져와서 모달창에 뿌려주는 것
/*    function createProject(){
		  var str = "";
		  $("input[name=vol]:checked").each(function(){
			 var a = $(this).val();
			 str += a+" ";
		  });
			 $(".modal-body .form-group #group").val(str);
		} */
		
</script>
<%-- <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
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
</head>
	  </nav> --%>
<body id="page-top">
	  <jsp:include page="common/sub_nav.jsp"></jsp:include>
   <div class="container" style="padding-top: 5em;">
	<%-- <form action="${pageContext.request.contextPath}/matching" method="post" name="modifyForm">
		<c:choose>
			<c:when test="${empty matchingVo }">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="command"  value="matchingWrite"/>	
				<input type="hidden" name="project_seq" value="${matchingVo.project_seq }">
			</c:otherwise>
		</c:choose> --%>
         <!--  General -->
        <form action="/matching" method="post" name="modifyForm">
		<input type="hidden" name="command"  value="matchingModifyProc"/>	
         <div class="form-group">
            <div class="controls">
               <input type="text" id="title" class="floatLabel" name="title" placeholder="프로젝트 제목을 입력하세요" value="${matchingVo.title }" <c:if test="${!matchingVo.modifyYn }">readonly</c:if>>
            </div>
            <div class="controls">
               <input type="text" class="floatLabel" value="${matchingVo.pm_id}" readonly >
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
               <%-- <c:if test="${matchingVo.modifyYn }"><i class="fa fa-sort"></i></c:if> --%>
               <select class="floatLabel" name="location" <c:if test="${!matchingVo.modifyYn }">disabled="disabled"</c:if>>
                  <option value="" >지역을 선택하세요</option>
                  <option value="seoul" <c:if test="${matchingVo.location eq 'seoul' }">selected</c:if>>서울</option>
                  <option value="gangwon" <c:if test="${matchingVo.location eq 'gangwon' }">selected</c:if>>강원</option>
                  <option value="gyeonggi" <c:if test="${matchingVo.location eq 'gyeonggi' }">selected</c:if>>경기</option>
                  <option value="gwangju" <c:if test="${matchingVo.location eq 'gwangju' }">selected</c:if>>광주</option>
                  <option value="gyeongnam" <c:if test="${matchingVo.location eq 'gyeongnam' }">selected</c:if>>경남</option>
                  <option value="gyeongbuk" <c:if test="${matchingVo.location eq 'gyeongbuk' }">selected</c:if> >경북</option>
                  <option value="daegu" <c:if test="${matchingVo.location eq 'daegu' }">selected</c:if>>대구</option>
                  <option value="daejeon" <c:if test="${matchingVo.location eq 'daejeon' }">selected</c:if>>대전</option>
                  <option value="busan" <c:if test="${matchingVo.location eq 'busan' }">selected</c:if>>부산</option>
                  <option value="sejong" <c:if test="${matchingVo.location eq 'sejong' }">selected</c:if>>세종</option>
                  <option value="ulsan" <c:if test="${matchingVo.location eq 'ulsan' }">selected</c:if>>울산</option>
                  <option value="incheon" <c:if test="${matchingVo.location eq 'incheon' }">selected</c:if>>인천</option>
                  <option value="jeonbuk" <c:if test="${matchingVo.location eq 'jeonbuk' }">selected</c:if>>전북</option>
                  <option value="jeonnam" <c:if test="${matchingVo.location eq 'jeonnam' }">selected</c:if>>전남</option>
                  <option value="chungbuk" <c:if test="${matchingVo.location eq 'chungbuk' }">selected</c:if>>충북</option>
                  <option value="chungnam" <c:if test="${matchingVo.location eq 'chungnam' }">selected</c:if>>충남</option>
                  <option value="jeju" <c:if test="${matchingVo.location eq 'jeju' }">selected</c:if>>제주</option>
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
               			<input type="text" class="floatLabel" name="need_person" value="${matchingVo.need_person}" <c:if test="${!matchingVo.modifyYn 	}">readonly</c:if>/>
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
               	<a href="${pageContext.request.contextPath}/matching?command=matchingAll" class="col-2 btn btn-primary" style="float:left;">목록</a>
               	<c:choose>
               	<c:when test="${matchingVo.pm_id eq u_id}">
	               	<button type="button" class="col-2 btn btn-primary" style="float: right;" id="deleteBtn">삭제</button>
               		<button type="button" class="col-2 btn btn-primary" style="float: right; margin-right:30px;" id="modifyBtn">수정</button>
               	</c:when>
               	<c:otherwise>
               	    	<a href="${pageContext.request.contextPath}/matching?command=insertVolunteer&projectM_seq=${matchingVo.projectM_seq}" class="col-3 btn btn-primary" style="float: right;">
				 		<c:choose>
					 		<c:when test="${matchingVo.projectM_seq eq list.projectM_seq}">이미 지원하셨습니다</c:when>
					 		<c:otherwise>지원하기</c:otherwise> 
					 	</c:choose>
			 		   </a>
				</c:otherwise> 
               </c:choose>
            </div>

	      </form>
         <!-- /.form-group -->
         </div>
      <div class="container" style="padding:50px 30px;">
      <hr>
      	<div class="row">
      		<c:if test="${matchingVo.pm_id eq u_id}">
			 <div class="col-lg-7 col-sm-7">
			 <p class="info-text margin-b-10">현재 지원자 총 N 명</p>
			 	<table class="table table-sm table-hover">
				  <thead>
				    <tr>
				      <th width="5%"><input type="checkbox" id="chkall"></th>
				      <th width="40%">지원자</th>
				      <th width="10%"></th>
				      <th width="10%"></th>
				    </tr>
				  </thead>
				   <c:forEach var="list" items="${list}" varStatus="status">
				     <tbody>
	                 <tr>
				      <td>
				      	<input type="checkbox" value="${list.userId}" name="vol">
				      </td>
				      <td>${list.userId}</td>
				      <td>
				      	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/matching/profile.jsp'">프로필</button>
				      </td>
				      <td>
				      	<button class="btn btn-primary">쪽지</button>
				      </td>
				    </tr>
				  </tbody>
				   </c:forEach>
				</table>
			 </div>
			 <div class="col-lg-5 col-sm-5">
			 	<button class="btn btn-primary" style="margin-top:11em;" onclick="createProject();">프로젝트 생성하기</button>
			 </div>
			</c:if>
		 </div> <!-- 관심목록 end -->
      </div>
      <jsp:include page="common/footer.jsp"></jsp:include>
      
<div class="modal fade" id="projectModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updatePwdLabel">프로젝트 생성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	<form action="${pageContext.request.contextPath}/project?command=projectCreate" method="post">
	  <input type="hidden" name="projectM_seq" value="${matchingVo.projectM_seq}">
	  <input type="hidden" name="u_id" value="${u_id}">
      <div class="modal-body">
        	  <div class="form-group">
			    <label for="oriPwd">프로젝트 명</label>
			    <input type="text" class="form-control" name="projectName" id="projectName" required>
			  </div>
			  <hr>
              <div class="form-group">
			    <label for="oriPwd">기간</label>
			    <input type="text" class="form-control" name="startDate" value="${matchingVo.startdate}" required><br>
			    <input type="text" class="form-control" name="endDate" value="${matchingVo.enddate}" required>
			  </div>
			  <div class="form-group">
			    <label for="oriPwd">개요</label>
			    <input type="text" class="form-control" name="content" id="content" required>
			  </div>
			  <div class="oriPwd">
			    <label for="member">프로젝트 팀원</label>
			    <input type="text" class="form-control" name="member" id="member" required>
			  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
        <button type="submit" class="btn btn-primary">생 성</button>
      </div>
	</form>
    </div>
  </div>
</div>
<!-- 비밀번호 변경 모달 end--> 
      
<script type="text/javascript">
function createProject(){
	if(confirm("프로젝트를 생성하시겠습니까?")){
		$("#projectModal").modal();
	}
}
</script>
      <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/matching/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/matching/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/matching/js/agency.js"></script>  
</body>
</html>