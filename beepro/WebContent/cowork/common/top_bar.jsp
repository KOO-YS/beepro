<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.semi.vo.ProjectVo" %>
 <%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%
   String u_id = null;
   if (session.getAttribute("u_id") != null) {
      u_id = (String) session.getAttribute("u_id");
   }
%>   

<script type="text/javascript">
   function getUnread(){
      $.ajax({
         type : "POST",
         url : "${pageContext.request.contextPath}/chat?command=chatUnread",
         data : {
            u_id : encodeURIComponent('<%=u_id%>')
         },
         success : function(result){
            
            if(result >= 1){   //결과값이 1보다 크면 결과 출력
               showUnread(result);
            } else{
               showUnread('');
            }
         }
         
      });
   }
   function getInfiniteUnread(){
      setInterval(function(){
         getUnread();
      }, 4000);
   }
   function showUnread(result){
      $('#unread').html(result);
   }
   
</script>



<!-- Custom fonts for this template-->
<link
   href="${pageContext.request.contextPath}/cowork/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 


<style>

option {
   border-right: 1px solid #ccc;
}

textarea {
   outline: 3px solid rgb(221, 226, 236);
   border: 0;
}

textarea:focus {
   outline: 3px solid rgba(75, 97, 207);
   border: 0;
}

input {
   outline: 3px solid rgb(221, 226, 236);
   border: 0;
   height: 30px;
}

input:focus {
   outline: 3px solid rgba(75, 97, 207);
   border: 0;
   height: 30px;
}

select:focus {
   outline: 3px solid rgba(75, 97, 207);
   border: 0;
}

select {
   width: 300px;
   padding: .5em .5em;
   outline: 3px solid rgb(221, 226, 236);
   font-size: 14px;
   border: 0;
}

#box {
   float: left;
   width: 350px;
   height: 150px;
}

#box2 {
   float: left;
   width: 180px;
   height: 150px;
   margin-left: 52px;
}

#title {
   font-size: 14px;
   color: black;
   font-weight: bold;
}

button a {
   text-decoration: none;
   color: white;
}

a:hover {
   text-decoration: none;
   color: white;
}

#none { width:100%;
        hegiht:60px;
        line-height:60px;
        text-align:center;
      } 
</style>


<!-- 탑 메뉴 -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

   <!-- 이슈만들기 모달창 -->
   <button type="submit" class="btn btn-primary" data-toggle="modal"
      data-target="#exampleModal" style="margin-left: 840px;"
      onclick="location.href='${pageContext.request.contextPath}/issue?command=issueWrite'">
      <b>+&nbsp;&nbsp;이슈 생성하기</b>
   </button>

   <!-- 탑 메뉴 끝-->

   <!-- Sidebar Toggle (Topbar) -->

   <button id="sidebarToggleTop"
      class="btn btn-link d-md-none rounded-circle mr-3">
      <i class="fa fa-bars"></i>
   </button>
   <!-- Topbar Navbar -->
   <ul class="navbar-nav ml-auto">
      <!-- Nav Item - Alerts -->
      <li class="nav-item dropdown no-arrow mx-1"><a
         class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
         role="button" data-toggle="dropdown" aria-haspopup="true"
         aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
            <span class="badge badge-danger badge-counter">3+</span>
      </a> <!-- Dropdown - Alerts -->
         <div
            class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
            aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">Alerts Center</h6>
            <a class="dropdown-item d-flex align-items-center" href="#">
               <div class="mr-3">
                  <div class="icon-circle bg-primary">
                     <i class="fas fa-file-alt text-white"></i>
                  </div>
               </div>
               <div>
                  <div class="small text-gray-500">December 12, 2019</div>
                  <span class="font-weight-bold">A new monthly report is
                     ready to download!</span>
               </div>
            </a> <a class="dropdown-item d-flex align-items-center" href="#">
               <div class="mr-3">
                  <div class="icon-circle bg-success">
                     <i class="fas fa-donate text-white"></i>
                  </div>
               </div>
               <div>
                  <div class="small text-gray-500">December 7, 2019</div>
                  $290.29 has been deposited into your account!
               </div>
            </a> <a class="dropdown-item d-flex align-items-center" href="#">
               <div class="mr-3">
                  <div class="icon-circle bg-warning">
                     <i class="fas fa-exclamation-triangle text-white"></i>
                  </div>
               </div>
               <div>
                  <div class="small text-gray-500">December 2, 2019</div>
                  Spending Alert: We've noticed unusually high spending for your
                  account.
               </div>
            </a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
               All Alerts</a>
         </div></li>

      <!-- Nav Item - Messages -->
<%--       <li class="nav-item dropdown no-arrow mx-1" onclick="location.href='${pageContext.request.contextPath}/chat?command=chatBox&u_id=<%=u_id%>'">
 --%><li class="nav-item dropdown no-arrow mx-1" onclick="location.href='${pageContext.request.contextPath}/cowork/chatList.jsp'">
       <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
         role="button" > <i class="fas fa-envelope fa-fw"></i> 
         
         <!-- Counter - Messages -->
            <span class="badge badge-danger badge-counter" id="unread"></span>
     	 </a> 
         </li>
         
         <!-- 메세지 끝 -->
      

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${u_name}</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/matching/mypage.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                           내 정보
                </a>
                
                <a class="dropdown-item" href="../matching?command=selectAllProject" data-toggle="modal" data-target="#workspaceModal">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                             워크스페이스 이동
                </a>
                
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href=#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                               로그아웃
                </a>
              </div>
            </li>
          </ul>
        </nav>
        
          <!-- 로그아웃 모달  -->
          <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
          <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Notice</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">정말 로그아웃 하시겠습니까?</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">취  소</button>
            <a class="btn btn-primary" href="../matching/userLogout.jsp">로그아웃</a>
          </div>
        </div>
      </div>
    </div>
      <!-- 탑 메뉴 끝 -->
