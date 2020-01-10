<!-- LEFT 메뉴-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="UTF-8"> 
<script>
$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);
</script>   
<style>
#group_member { width:50px; 
                height:50px;
                margin-top:280px;
                margin-left:10px;
                }

button { background-color:#4b61cf; 
         border:0;
         cursor:pointer;
        }
        
@import url(https://fonts.googleapis.com/css?family=Open+sans);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Playfair+Display);
.snip1515 {
  font-family: 'Open Sans', Arial, sans-serif;
  position: relative;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #000000;
  text-align: center;
  line-height: 1.4em;
  font-size: 14px;
  box-shadow: none !important;
}

.snip1515 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.snip1515 .profile-image {
  display: inline-block;
  width: 80%;
  z-index: 1;
  position: relative;
  padding: 10px;
  border: 2px solid rgb(254,209,54);
}

.snip1515 .profile-image img {
  max-width: 100%;
  vertical-align: top;
}

.snip1515 figcaption {
  width: 100%;
  background-color:rgb(75,97,207);
  color: #555;
  padding: 125px 25px 25px;
  margin-top: -100px;
  display: inline-block;
}

.snip1515 h3,
.snip1515 h4,
.snip1515 p {
  margin: 0 0 5px;
  color:white;
}

.snip1515 h3 {
  font-weight: 600;
  font-size: 1.3em;
  font-family: 'Playfair Display', Arial, sans-serif;
}

.snip1515 h4 {
  color: #8c8c8c;
  font-weight: 400;
  letter-spacing: 2px;
}

.snip1515 p {
  font-size: 0.9em;
  letter-spacing: 1px;
  opacity: 0.9;
}

.snip1515 .icons {
  text-align: center;
  width: 100%;
}

.snip1515 i {
  padding: 10px 2px;
  display: inline-block;
  font-size: 18px;
  font-weight: normal;
  color: #e8b563;
  opacity: 0.75;
}

.snip1515 i:hover {
  opacity: 1;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}

</style>
<ul style="background:rgba(75,97,207);" class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <!-- LEFT 메뉴 끝-->
          <!-- Sidebar - Brand -->
          <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/matching/index.jsp">
            <div class="sidebar-brand-text mx-3" style="line-height:130px;">
              <img src="/beepro/cowork/images/logo.png" width=55 height=auto> 
              BEEPRO
            </div>
          </a>
          <!-- Divider -->
          <hr class="sidebar-divider">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/project?command=dashboard&projectSeq=${projectSeq}">
              <i class="fas fa-fw fa-cog"></i>
              <span>업무진행상황</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/issue?command=issueAll&projectSeq=${projectSeq}">
              <i class="fas fa-fw fa-wrench"></i>
              <span>이슈관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/project?command=FileUpload&projectSeq=${projectSeq}">
              <i class="fas fa-fw fa-folder"></i>
              <span>파일드라이브</span>
            </a>
          </li>
    
          <!-- Nav Item - Charts -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/todo?command=todo-list&projectSeq=${projectSeq}">
              <i class="fas fa-fw fa-chart-area"></i>
              <span>내업무</span></a>
          </li>
          
           <li>
           <!-- 구성원 버튼 -->
            <button type="button" data-toggle="modal" data-target="#MemberViewModal" id="group_member">
               <img src="/beepro/cowork/images/person_icon.png" width="38" height="40" >
           </button>         
      <!-- 구성원 모달내용 -->
         <div class="modal fade" id="MemberViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header">
             <h5 class="modal-title" id="exampleModalLabel" style="color:black;">프로젝트 구성원</h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <c:forTokens items="${pMember}" delims="," var="member">
        <figure class="snip1515">
           <div class="profile-image">
              <img src="/beepro/cowork/images/bee.png" width=60 height=60/>
           </div>
        <figcaption>
	      <h3>${member}</h3>
	      <div class="icons"><a href="#"><i class="ion-social-reddit"></i></a>
	      <a href="#"> <i class="ion-social-twitter"></i></a>
	      <a href="#"> <i class="ion-social-vimeo"></i></a>
	    </div>
	  </figcaption>
	</figure>
      </c:forTokens>
      </div>
      <div class="modal-footer" style="background-color:#f2f2f2;">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확  인</button>
      </div>
    </div>
  </div>
</div>

           </li>
        </ul>
        
        <div class="modal">
           <p class="modal_content">
              <a href="javascript:void(0)" class="btn_close">클릭하면 창이 닫힙니다</a>           
           </p>
        </div>