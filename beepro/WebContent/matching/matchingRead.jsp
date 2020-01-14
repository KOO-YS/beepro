<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEEPRO - 프로젝트 매칭 상세보기</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
<link href="${pageContext.request.contextPath}/matching/css/msg.css" rel="stylesheet">
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
        	,noSelect:false
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
   
   
   // 다중 체크박스 선택 값 가져와서 모달창에 뿌려주는 것
/*    function createProject(){
		  var str = "";
		  $("input[name=vol]:checked").each(function(){
			 var a = $(this).val();
			 str += a+" ";
		  });
			 $(".modal-body .form-group #group").val(str);
		} */

		function CheckForm(){
			if($('#inputBody').val() ==""){ 
				alert("보내실 쪽지 내용을 입력하세요.");
				$('#inputBody').focus(); //id가 id인 태그에 커서깜빠거리는 포커스 주기
				return false; //현재 submit이벤트를 중지하는 개념(즉, 전송을 막는다->페이지안넘김)
			} else{ 

				$('#sendForm').submit(); //form안에 있는 데이터를 action속성의 주소로 전송
			}
		}

		function sendMsgFunction(get_id){
			$('#sendMsgModal').css("display","block");
			$('#inputTo').val(get_id);
			$('#reset').click(function(){
				$('#sendMsgModal').css("display","none");
			});
			$('#close').click(function(){
				$('#sendMsgModal').css("display","none");
			});
		}	
		
		
</script>

<body id="page-top">
	<c:import url="common/nav_bar.jsp">
  		<c:param name="pageName" value="matching"></c:param>
  	</c:import>
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
         
        <form action="matching" method="post" name="modifyForm">
		<input type="hidden" name="command"  value="matchingModifyProc"/>	
		<input type="hidden" name="projectM_seq" value="${matchingVo.projectM_seq}"/>
		
         <div class="form-group">
            <div class="controls" style="color:gray">프로젝트 제목
               <input type="text" id="title" class="floatLabel" name="title" placeholder="프로젝트 제목을 입력하세요" value="${matchingVo.title }" <c:if test="${!matchingVo.modifyYn }">readonly</c:if>>
            </div>
            <div class="controls" style="color:gray">작성자
               <input type="text" class="floatLabel" value="${matchingVo.pm_id}" readonly >
            </div>
            <!-- c태그:choose / when에 지금 있는 부분 넣고, otherwise에서만 작업 -->
            <div class="controls2" style="color:gray">언어 및 프로그램 능력
               <input type="text" id="skill" class="floatLabel" name="skill" data-role="tagsinput">
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
            <div class="controls"  style="color:gray">지역
               <%-- <c:if test="${matchingVo.modifyYn }"><i class="fa fa-sort"></i></c:if> --%>
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
                  <option value="온라인" <c:if test="${matchingVo.location eq '온라인' }">selected</c:if>>온라인</option>
               </select>
            </div>
         </div>
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
               <div class="controls" style="color:gray">인원
               	<c:choose>
               		<c:when test="${matchingVo.modifyYn }">
               			<i class="fa fa-sort"></i>
               			<select class="floatLabel" name="need_person">
               			 <option value="" >인원을 선택하세요</option>
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

               	<div class="controls" style="color:gray">상세 내용
                  <textarea name="content" class="floatLabel" id="content" placeholder="상세 내용을 입력하세요." <c:if test="${!matchingVo.modifyYn }">readonly</c:if>>${matchingVo.content}</textarea>
               	</div>
               	
               	<a href="${pageContext.request.contextPath}/matching?command=matchingAll" class="col-2 btn btn-primary" style="float:left;">목록</a>
               	
               	<c:choose>
               	<c:when test="${matchingVo.pm_id eq u_id}">
               	  <c:if test="${matchingVo.modifyYn }">
	               	<button type="button" class="col-2 btn btn-primary" style="float: right;" id="deleteBtn">삭제</button>
               		<button type="button" class="col-2 btn btn-primary" style="float: right; margin-right:30px;" id="modifyBtn">수정</button>
               	 </c:if>
               	</c:when>
               	<c:when test="${empty u_id }">
               		<!-- 로그인 후 지원가능합니다. -->
               	</c:when>
               	<c:otherwise>
               	    <a id="volunteerBtn" href="${pageContext.request.contextPath}/matching?command=insertVolunteer&projectM_seq=${matchingVo.projectM_seq}" class="col-3 btn btn-primary" style="float: right;">지원하기</a>
				</c:otherwise> 
               </c:choose>
            </div>

	      </form>
         <!-- /.form-group -->
         </div>
      <div class="container" style="padding:50px 30px;">
      <hr>
      	<div class="row">
      	<c:choose>
      		<c:when test="${matchingVo.pm_id eq u_id}">
			 <div class="col-lg-7 col-sm-7">
			 <p class="info-text margin-b-10">현재 지원자 총 ${volunteerNum} 명</p>
			 	<table class="table table-sm table-hover">
				  <thead>
				    <tr>
				      <th width="5%"><input type="checkbox" id="chkall"></th>
				      <th width="35%">지원자</th>
				      <th width="15%"></th>
				      <th width="10%"></th>
				    </tr>
				  </thead>
				  <tbody>

					 <c:forEach var="list" items="${volunteer}" varStatus="status">
		                 <tr>
					      <td>
					      	<input type="checkbox" value="${list.userId}" name="volunteerId">
					      </td>
					      <td>${list.userId}</td>
					      <td>
					      	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/matching?command=profile&userId=${list.userId}'">프로필</button>
					      </td>
					      <td>
					      	<button class="btn btn-primary" onclick="sendMsgFunction('${list.userId}');">쪽지</button>
					      </td>
					    </tr>
					 </c:forEach>
					 
				  </tbody>
				</table>
			 </div>
			 <div class="col-lg-5 col-sm-5">
			 <c:choose>
			 	<c:when test="${created eq false}">
				 	<button class="btn btn-primary" style="margin-top:11em;" onclick="createProject();">프로젝트 생성하기</button>
			 	</c:when>
			 	<c:otherwise>
					<button class="btn btn-secondary" style="margin-top:11em;" onclick="return false;">이미 생성된 프로젝트입니다</button>		 	
			 	</c:otherwise>
			 </c:choose>
			 </div>
			</c:when>
			
		</c:choose>
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
	<form action="${pageContext.request.contextPath}/matching" method="post">
		<input type="hidden" name="command" value="projectCreate">
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
			    <input type="text" class="form-control" name="member" id="member" readOnly required>
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
<!-- 모달 end--> 


<!-- 유저의 지원 여부 -->
<c:forEach var="test" items="${volunteer}" varStatus="status">
	<c:if test="${test.userId eq u_id }">
		 <script>
			 $("#volunteerBtn").html('이미 지원한 프로젝트입니다'); 
			 $("#volunteerBtn").attr('class','btn btn-secondary');
		 </script>
	 </c:if>
</c:forEach>

<!-- 쪽지 보내기 모달 -->
	<div class="modal" id="sendMsgModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header modal-header-info">
					<h4 class="modal-title">
						<span class="glyphicon glyphicon-envelope"></span> 쪽지보내기
					</h4>
					<button type="button" class="close" id="close" data-dismiss="modal"
						aria-hidden="true">×</button>

				</div>
				<div class="modal-body">

					<form role="form" id="sendForm" class="form-horizontal"
						action="${pageContext.request.contextPath}/msg">
						<input type="hidden" name="command" value="sendMsg" /> 
						<input type="hidden" name="send_id" value="${u_id }" />
						<input type="hidden" name="backMsgBox" value="no" />	<!-- 어디 모달에서 보내는지 구별하기 위해 -->
						<div class="form-group">
							<label class="col-sm-12" for="inputTo"><span
								class="glyphicon glyphicon-user"></span>받는사람</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTo"
									placeholder="comma separated list of recipients"
									readonly="readonly" name="get_id" style="width: 430px">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-12" for="inputBody"><span
								class="glyphicon glyphicon-list"></span>쪽지 내용</label>
							<div class="col-sm-12">
								<textarea class="form-control" id="inputBody" rows="8"
									name="content" style="resize: none;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="reset" id="reset" class="btn btn-default pull-left"
								data-dismiss="modal" style="border: 1px solid lightgray;"
								value="취소" />
							<input type="button" class="btn btn-primary"
								style="background-color: #fec503; border-color: #fec503;"
								value="보내기" onclick="CheckForm();" />
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal compose message -->
	<!-- 쪽지 모달 end -->
      

<script type="text/javascript">
$(document).ready(function(){
	/* 전체 선택 */
	$("#chkall").click(function(){
        if($("#chkall").prop("checked")){
            $("input[name=volunteerId]").prop("checked",true);	// 전체 선택
        }else{
            $("input[name=volunteerId]").prop("checked",false);	// 전체 선택 해제
        }
    })
})

/* 프로젝트 모달 오픈 */
function createProject(){
	if(confirm("프로젝트를 생성하시겠습니까?")){
		if(validation()){		// 유효성 검사
			var member = "";
			$('input:checkbox[name="volunteerId"]:checked').each(function(){
				member += $(this).val()+",";
			});
			$("#member").val("${u_id},"+member);
			$("#projectModal").modal();
		}
	}
}
/* 유효성 검사 */
function validation() {
	var success = true;
	var memberChk = $('input:checkbox[name="volunteerId"]:checked').length;
	if(memberChk<2){
		alert("최소 두 명이상의 멤버를 선택해주세요");
		success = false;
	}
	return success;
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