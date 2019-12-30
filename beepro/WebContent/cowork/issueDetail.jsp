<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/cowork/css/issueWriteTable.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cowork/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/cowork/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/cowork/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/cowork/js/sb-admin-2.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  
	  $(".badge1").text("버그").css("background-color","#ed5565");
	  $(".badge1").text("개선").css("background-color","#ed5565");
	  $(".badge1").text("요구사항").css("background-color","#ed5565");
	  $(".badge1").text("테스트 케이스").css("background-color","#ed5565");
	  
	  $(".badge2").text("심각").css("background-color","#ed5565");
	  $(".badge2").text("높음").css("background-color","#f8a274");
	  $(".badge2").text("보통").css("background-color","#1983c6");
	  $(".badge2").text("낮음").css("background-color","#23cad8");
  });
  

</script>
<style type="text/css">
.support {
	background-color: #fff;
	padding: 20px;
	-webkit-box-shadow: 0px 2px 4px rgba(126, 142, 177, 0.12);
	box-shadow: 0px 2px 4px rgba(126, 142, 177, 0.12);
	border-radius: 6px;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	position: relative;
}

.support-content { 
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    padding: 10px 30px;
    position: relative;
}

.support-header { display: flex;
                  padding: 10px 0px;
                }

.content-header { font-size: 1.75rem; 
                  color: #334152;
                }

.tag { line-height: 1.3;
       display: inline-block;
       border: 0px solid #047bf8;
       color: #888;
       margin-right: 2px;
       font-size: 0.72rem;
       border-radius: 4px;
       margin-bottom: 30px;
      }

.issue_div { display: block;
                 -webkit-box-direction: normal;
            }

.issue_content { background-color: #fff;
                -webkit-box-flex: 1;
               -ms-flex: 1;
               flex: 1;
               margin: 3rem 0;
               }

.issue-subheader { margin-bottom: 0px;
    border-bottom: 1px solid #ddd;
    color: #000;
    font-size: 1rem;
    line-height: 1.5;
    font-weight: 600;
    margin-top:30px;
    }

.mt-20 {margin-top: 20px !important;}

.row { display: flex;
      -ms-flex-wrap: wrap;
       flex-wrap: wrap;
       margin-right: -15px;
       margin-left: -15px; }

.col-md-4 { -webkit-box-flex: 0;
            -ms-flex: 0 0 33.3333333333%;
             flex: 0 0 33.3333333333%;
            }

.form-group { margin-bottom: 1rem;}

.issue-label {  font-size: 95%;
                color: #777;
                margin-left:140px;
                display: inline-block;}

.badge1 { display: inline-block;
    padding: 0.20em 0.65em;
    font-size: 20px;
    font-weight: 300;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    color:white;
    font-weight:bold;
    margin-left:120px;
    border-radius: 4px;}
    
.badge2 { display: inline-block;
    padding: 0.20em 0.65em;
    font-size: 20px;
    font-weight: 300;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    background-color:skyblue;
    color:white;
    font-weight:bold;
    margin-left:120px;
    border-radius: 4px;}
    
.badge3 { display: inline-block;
    padding: 0.20em 0.65em;
    font-size: 20px;
    font-weight: 300;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    font-weight:bold;
    margin-left:120px;
    border-radius: 4px;}
    
.issue-label2 { font-size: 12px;
                color: #777;
                display: inline-block;}
                
.subheader2 { font-size:13px;
              border-radius:5px;
              border:1px solid rgb(75,97,207);
              color:rgb(75,97,207);
              font-weight:bold;
              padding:15px 15px;}

.box { background: #f1f1f1;
       padding: 15px;
       margin-top: 20px !important;}

#comment-label-wrap { margin-top:35px;
                    border-top:1px solid #ddd;
                    border-bottom:1px solid #ddd;
                    height:50px;
                    line-height:50px;
                    font-size:16px;
                    }
                    
#comment-label { color:rgb(75,97,207); 
                 font-weight:bold;
                 width:90px;
                 text-align:center;
                 height:50px;
                 border-bottom:4px solid rgb(75,97,207);
                 }  

#none { width:100%;
        hegiht:60px;
        line-height:60px;
        text-align:center;
        padding:30px;
      } 
      
#writer{ color:black;
         font-size:16px;
         font-weight:bold;
       }  

#regdate { font-size:11px;}

#content { margin-top:20px;
           color:#334152;
         }

#content_wrap { padding:30px;
                width:100%;
                height:auto;
                margin-top:20px;
                border-radius:5px;
                border:1px solid rgb(75,97,207);
              }
                  
</style>
<title>beepro - 이슈 상세정보</title>
</head>
<body>
	<div id="wrapper">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="common/side_bar.jsp"></jsp:include>

		<!-- 내용이 들어갈 구역을 정의하는 div -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 내용이 들어갈 구역을 정의하는 div -->
			<div id="content">
				<!-- 왼쪽 메뉴 바 -->
				<jsp:include page="common/top_bar.jsp"></jsp:include>
				<!-- 본격적으로 내용이 담기는 div -->
				<div class="container-fluid">
					<div class="support">
					  <div class="support-content">
					    <div class="support-header">
					      <h4 class="content-header">
					       <div>
					        <p class="tag">
					          ${vo.issueSeq} &nbsp; / &nbsp; 프로젝트 명
					        </p>
					        </div>
					          ${vo.title }
					      </h4>
					    </div>
					    
					    <div class="issue_div">
					       <div class="issue_content">
					         <div class="col-md-4">
					            <div class="form-group">
					               <label class="issue-label-2">
					                 <span>작성자</span>
					               </label>
					               <div class="subheader2">
					                ${u_name}&nbsp;&nbsp;${u_email} 
					               </div>
					            </div>
					         </div>
					         <h6 class="issue-subheader mt-20"></h6>
					         
					         <div class="row mt-20">
					           <div class="col-md-4">
					             <div class="form-group">
					              <label class="issue-label">
					                <span>이슈 타입</span>
					              </label>
					              <div>
					                <span class="badge1">
                     				  ${vo.category }
					                </span>
					              </div>
					             </div>
					           </div>
					           
					           <div class="col-md-4">
					             <div class="form-group">
					              <label class="issue-label">
					                <span>중요도</span>
					              </label>
					              <div>
					                <span class="badge2">
					                   ${vo.level }
					                </span>
					              </div>
					             </div>
					           </div>
					           
					           <div class="col-md-4">
					             <div class="form-group">
					              <label class="issue-label">
					                <span>등록일</span>
					              </label>
					              <div>
					                <span class="badge3">
					                  ${vo.regdate }
					                </span>
					              </div>
					             </div>
					           </div>
					         </div>
					         
					         <div class="box">
					            ${vo.content }
					         </div>
					        
					        <div> 
							  <div id="comment-label-wrap">
					           <div id="comment-label">
					                           댓글
					           </div>
					         </div>
					         
					           <c:choose>
					              <c:when test="${empty list}">
					                 <div id="none">작성된 댓글이 없습니다</div>
					              </c:when>
					       
					              <c:otherwise>
					                <c:forEach var="list" items="${list}">
					                <div id="content_wrap">
					                  <div id="writer">
					                    ${list.writer}
					                  </div>
					                   
					                   <div id="regdate">
					                   <fmt:formatDate value="${list.regdate}" pattern="yyyy/mm/dd HH:mm:ss" />
					                   </div>
					                   
					                   <div id="content">
					                   ${list.content}
					                   </div>
					                 </div>
					                </c:forEach>
					              </c:otherwise>
					           </c:choose>
					       </div>
					             <form action="comment" method="post">
					             <input type="hidden" name="command" value="commentWrite">
					             <input type="hidden" name="u_id" value="${u_id}"> <!-- 댓글 쓰는사람 아이디 갖고오는거  -->
					             <input type="hidden" name="issueSeq" value="${vo.issueSeq}">
					             <input type="text" name="content" placeholder="댓글을 입력하세요" style="width:1056px; margin-top:20px;">
    							 <button type="submit" class="btn btn-primary" style="float:right; margin-top:15px; z-index:999;">
							      <b>댓글작성</b>
							  </button>	 
							 </form>
					       </div>
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<jsp:include page="common/footer.html"></jsp:include>
		</div>
	</div>
</body>
</html>