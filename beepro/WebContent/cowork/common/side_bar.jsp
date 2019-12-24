<!-- LEFT 메뉴-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">    
<style>
#group_member { width:50px; 
                height:50px;
                margin-top:280px;
                margin-left:10px;
                }

button { background-color:#4b61cf; 
         border:0;
        }
</style>

<ul style="background:rgba(75,97,207);" class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <!-- LEFT 메뉴 끝-->
          <!-- Sidebar - Brand -->
          <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
            <div class="sidebar-brand-icon rotate-n-15">
              <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SEMI PROJECT</div>
          </a>
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="fas fa-fw fa-tachometer-alt"></i>
              <span>Dashboard</span></a>
          </li>
    
          <!-- Divider -->
          <hr class="sidebar-divider">
          <li class="nav-item">
            <a class="nav-link" href="working.jsp">
              <i class="fas fa-fw fa-cog"></i>
              <span>업무진행상황</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="issueList.jsp">
              <i class="fas fa-fw fa-wrench"></i>
              <span>이슈관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="fas fa-fw fa-folder"></i>
              <span>구글드라이브</span>
            </a>
          </li>
    
          <!-- Nav Item - Charts -->
          <li class="nav-item">
            <a class="nav-link" href="../todo?command=todo-list">
              <i class="fas fa-fw fa-chart-area"></i>
              <span>내업무</span></a>
          </li>
          
           <li>
           <!-- 구성원 Modal -->
           <button type="button" data-toggle="modal" data-target="#exampleModalCenter" id="group_member">
               <img src="/beepro/cowork/images/person_icon.png" width="38" height="40">
           </button>

         <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header" style="background-color:#4b61cf;">
             <h5 class="modal-title" id="exampleModalCenterTitle" style="color:white;"><b>프로젝트 구성원</b></h5>
             
             
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true" style="color:white;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
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