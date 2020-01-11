<!-- LEFT 메뉴-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.semi.dao.UserDaoImpl" %>
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
        
#member { width:auto;
          height:80px;
          padding:12px 25px;
          margin-bottom:10px;
          border-left: .25rem solid #4e73df;
          box-shadow: 0 .15rem 0.85rem 0 rgba(58, 59, 69, .15) !important;
          border-radius:5px;
        }
        
#message { float:right;
           margin-top:25px;
         }

#message img { cursor:pointer; }
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
         <div class="modal fade bd-example-modal-lg" id="MemberViewModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
         <div class="modal-dialog bd-example-modal-lg" role="document">
         <div class="modal-content">
             <div class="modal-header">
             <h5 class="modal-title" id="exampleModalLabel" style="color:black;">프로젝트 구성원</h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <p style="font-size:14px; color:#858796;">현재 프로젝트에 참여중인 구성원 목록입니다.</p>
      <c:forTokens items="${pMember}" delims="," var="member">
	     <div id="member">
	       <span style="font-size:20px;">${member}</span>
	       
	       <!-- 구성원 쪽지보내기  -->
	       <div id="message">
	         <img src="${pageContext.request.contextPath}/cowork/images/message.png" width=25>
	       </div>
	     </div>
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