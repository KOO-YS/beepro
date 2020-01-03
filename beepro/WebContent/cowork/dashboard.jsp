<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/cowork/vendor/chart.js/Chart.min.js"></script>
<style>
#board-status li {
	width:10rem;
	text-align: center;
	display: inline-block;
	border-right: 1px solid rgba(0, 0, 0, .1);
}
#board-status li:last-child {
	border: none;
}

.rate {
  position: relative;
  height: 1.5rem;
  width: 7.5rem;
  background: url(${pageContext.request.contextPath}/cowork/images/off.svg);
  background-size: 1.5rem 1.5rem;
}

.rate_label {
  position: absolute;
  height: 100%;
  background-size: 1.5rem 1.5rem;
}

.rate_input {
  margin: 0;
  position: absolute;
  height: 1px; width: 1px;
  overflow: hidden;
  clip: rect(1px, 1px, 1px, 1px);
}

.rate .rate_label:nth-of-type(1) {
  z-index: 5;
  width: 20%;
}

.rate .rate_label:nth-of-type(2) {
  z-index: 4;
  width: 40%;
}

.rate .rate_label:nth-of-type(3) {
  z-index: 3;
  width: 60%;
}

.rate .rate_label:nth-of-type(4) {
  z-index: 2;
  width: 80%;
}

.rate .rate_label:nth-of-type(5) {
  z-index: 1;
  width: 100%;
}

.rate_input:checked + .rate_label,
.rate_input:focus + .rate_label{
  background-image: url(${pageContext.request.contextPath}/cowork/images/on.svg);
}

</style>
<title>협업 페이지</title>
</head>
<body>

	<div id="wrapper">
		<jsp:include page="common/side_bar.jsp"></jsp:include>
		<!-- 내용이 들어갈 구역을 정의하는 div -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 내용이 들어갈 구역을 정의하는 div -->
			<div id="content">

				<!-- 왼쪽 메뉴 바 -->
				<jsp:include page="common/top_bar.jsp"></jsp:include>
				<!-- 본격적으로 내용이 담기는 div -->
				<div class="container-fluid">
					<div class="container">
							<div class="row">
					            <div class="col-md-11">
					              <div class="card border-left-primary shadow h-100 py-2">
					                <div class="card-body">
					                  <div class="row no-gutters align-items-center">
					                    <div class="col mr-2">
					                      	<span class="badge badge-primary">today</span>
											<b>
												<jsp:useBean id="now" class="java.util.Date"/>				                      	
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
											</b>
					                      <hr>
						                      <div id="board-status">
						                      <ul>
						                      	<li>
							                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                      	할당된 이슈
							                      </div>
							                      <div class="h5 mb-0 font-weight-bold text-gray-800">1</div>
						                      	</li>
						                      	<li>
							                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                      	생성된 이슈XXX
							                      </div>
							                      <div class="h5 mb-0 font-weight-bold text-gray-800">${count["weekIssueCnt"]}</div>
						                      	</li>
						                      	<li>
							                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                      	등록 이슈XXX
							                      </div>
							                      <div class="h5 mb-0 font-weight-bold text-gray-800">${count["userIssueCnt"]}</div>
						                      	</li>
						                      	<li>
							                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                      	잔여 업무XXX
							                      </div>
							                      <div class="h5 mb-0 font-weight-bold text-gray-800">${count["userTodoLeft"]}</div>
						                      	</li>
						                      	<li>
							                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							                      	총 업무XXX
							                      </div>
							                      <div class="h5 mb-0 font-weight-bold text-gray-800">${count["totalTodoCnt"]}</div>
						                      	</li>
						                      </ul>
						                      </div>
					                    </div>
					                  </div>
					                </div>
					              </div>
					            </div>
							</div>
							<hr>
							<!-- Content Row -->
					            <div class="row">
					                <!-- Content Column -->
					                <div class="col-lg-5 mb-4">
					
					                    <!-- Project Card Example -->
					                    <div class="card shadow mb-4">
					                    <div class="card-header py-3">
					                        <h6 class="m-0 font-weight-bold text-primary">업무 분류별 진행률XXX</h6>
					                    </div>
					                    <div class="card-body">
					                        <h4 class="small font-weight-bold">기획<span class="float-right">${todoType['planningRate']}%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${todoType['planningRate']}%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <h4 class="small font-weight-bold">디자인<span class="float-right">${todoType['designRate']}%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar bg-warning" role="progressbar" style="width: ${todoType['designRate']}%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <h4 class="small font-weight-bold">프론트앤드<span class="float-right">${todoType['front-endRate']}%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar" role="progressbar" style="width:${todoType['front-endRate']}%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <h4 class="small font-weight-bold">백앤드<span class="float-right">${todoType['back-endRate']}%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar bg-info" role="progressbar" style="width: ${todoType['back-endRate']}%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                    </div>
					                    </div>
					                </div>
					            
					                <!-- Pie Chart -->
					                <div class="col-xl-6 col-lg-12">
					                    <div class="card shadow mb-6">
						                    <!-- Card Header - Dropdown -->
						                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						                        <h6 class="m-0 font-weight-bold text-primary">분야별 업무XXX</h6>
						                    </div>
						                    <!-- Card Body -->
						                    <div class="card-body row">
						                        <div class="col-6 chart-pie pt-4 pb-2">
						                        	<canvas id="myPieChart"></canvas>
						                        </div>
						                        <div class="col-6 mt-5 text-center small">
							                        <span class="mr-2">
							                            <i class="fas fa-circle" style="color:#e74a3b"></i> 기획
							                        </span>
							                        <span class="mr-2">
							                            <i class="fas fa-circle" style="color:#f6c23e"></i> 디자인
							                        </span>
							                        <span class="mr-2">
							                            <i class="fas fa-circle" style="color:#4b61cf"></i> 프론트앤드
							                        </span>
							                        <span class="mr-2">
							                            <i class="fas fa-circle" style="color:#36b9cc"></i> 백앤드
							                        </span>
						                        </div>
						                    </div>
					                    </div>
					                </div>
								</div>		<!-- Content Row end-->
							<div class="row">
					            <div class="col-lg-11 col-md-11">
					              <div class="card border-left-danger shadow h-100 py-2">
					                <div class="card-body">
					                  <div class="row no-gutters align-items-center">
					                    <div class="col mr-2">
					                    	<div class="font-weight-bold text-danger text-uppercase mb-1">마감기한 임박 업무 XXX</div>
					                      <hr>
						                   <div class="row">
						                   <c:forEach var="urgent" items="${urgent}">
						                   <div class="col-lg-3 mb-3">
							                  <a style="width:100%;" href="${pageContext.request.contextPath}/todo?command=todo-detail&seq=${urgent.todoSeq}" class="btn btn-danger btn-icon-split">
							                    <span class="text">${urgent.title}</span>
							                  </a>
							                </div>
							                   <%-- <div class="col-lg-6 mb-3">
								                  <div class="card shadow">
								                    <div class="card-body">
									                      <a class="text-danger" href="${pageContext.request.contextPath}/todo?command=todo-detail&seq=${urgent.todoSeq}">${urgent.title}</a>
								                    	<div class="row">
								                    	<div class="col-lg-8 col-sm-6">
									                      <div class="small">${urgent.category}</div>
									                      
									                    </div>
									                    <div class="col-lg-4 col-sm-6">
										                   	<div class="rate">
										                   	<!-- onclick="return(false);" -->
																<input class="rate_input" type="radio" name="priority${urgent.todoSeq}" value="1" id="rate${urgent.todoSeq}-1" <c:choose> <c:when test="${urgent.priority eq '1'}">checked</c:when> <c:otherwise>onclick="return(false);"</c:otherwise></c:choose>/>
																<label class="rate_label" for="rate${urgent.todoSeq}-1"></label>
																<input class="rate_input" type="radio" name="priority${urgent.todoSeq}" value="2" id="rate${urgent.todoSeq}-2" <c:choose> <c:when test="${urgent.priority eq '2'}">checked</c:when> <c:otherwise>onclick="return(false);"</c:otherwise></c:choose>/>
																<label class="rate_label" for="rate${urgent.todoSeq}-2"></label>
																<input class="rate_input" type="radio" name="priority${urgent.todoSeq}" value="3" id="rate${urgent.todoSeq}-3" <c:choose> <c:when test="${urgent.priority eq '3'}">checked</c:when> <c:otherwise>onclick="return(false);"</c:otherwise></c:choose>/>
																<label class="rate_label" for="rate${urgent.todoSeq}-3"></label>
																<input class="rate_input" type="radio" name="priority${urgent.todoSeq}" value="4" id="rate${urgent.todoSeq}-4" <c:choose> <c:when test="${urgent.priority eq '4'}">checked</c:when> <c:otherwise>onclick="return(false);"</c:otherwise></c:choose>/>
																<label class="rate_label" for="rate${urgent.todoSeq}-4"></label>
																<input class="rate_input" type="radio" name="priority${urgent.todoSeq}" value="5" id="rate${urgent.todoSeq}-5" <c:choose> <c:when test="${urgent.priority eq '5'}">checked</c:when> <c:otherwise>onclick="return(false);"</c:otherwise></c:choose>/>
																<label class="rate_label" for="rate${urgent.todoSeq}-5"></label>
															</div>
								                    	</div>
								                    	</div>
								                    </div>
								                  </div>
								                </div> --%>
						                   </c:forEach>
						                   	</div>
					                    </div>
					                  </div>
					                </div>
					              </div>
					            </div>
							</div>
							<hr>
							<!-- Content Row -->
					        <div class="row">
					
								<!-- Earnings (Monthly) Card Example -->
								<div class="col-xl-6 col-md-6 mb-4">
									<div class="card border-left-info shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xs font-weight-bold text-info text-uppercase mb-1">업무 진행률XXX</div>
													<div class="row no-gutters align-items-center">
														<div class="col-auto">
															<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${count["totalTodoRate"]}%</div>
														</div>
														<div class="col">
															<div class="progress progress-sm mr-2">
																<div class="progress-bar bg-info" role="progressbar" style='width: ${count["totalTodoRate"]}%' aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-auto">
													<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
					
					            <!-- Pending Requests Card Example -->
					            <div class="col-xl-5 col-md-6 mb-4">
					              	<div class="card border-left-warning shadow h-100 py-2">
						                <div class="card-body">
						                  	<div class="row no-gutters align-items-center">
							                    <div class="col mr-2">
								                    <div class="row">
								                        <div class="col-4 text-xs font-weight-bold text-warning text-uppercase mb-1">발생 이슈XXX</div>
								                        <div class="h5 mb-0 font-weight-bold text-gray-800">${count["totalIssueCnt"]}</div>
								                    </div>
								                    <!-- <div class="row">
								                        <div class="col-4 text-xs font-weight-bold text-warning text-uppercase mb-1">해결된 이슈</div>
								                        <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
								                    </div> -->
							                    </div>
							                    <div class="col-auto">
							                      <i class="fas fa-comments fa-2x text-gray-300"></i>
							                    </div>
						                  	</div>
						                </div>
					              	</div>
					            </div>
				            </div>
							
									
					          
							<div class="card shadow mb-4 col-11">
						            <div class="card-header py-3">
						              <h6 class="m-0 font-weight-bold text-primary">이번주에 발생한 이슈XXX</h6>
						            </div>
						            <div class="card-body">
						              <div class="table-responsive">
						                <table class="table" width="100%" cellspacing="0">
						                  <thead>
						                    <tr>
						                      <th>이슈명</th>
						                      <th>작성자</th>
						                      <th>중요도</th>
						                      <th>이슈타입</th>
						                      <th>작성날짜</th>
						                    </tr>
						                  </thead>
						                  <tbody>
						                  <c:forEach var="week" items="${weekIssue}">
						                    <tr>
						                      <td>${week.title}</td>
						                      <td>${week.writer}</td>
						                      <td>${week.level }</td>
						                      <td>${week.category }</td>
						                      <td>${week.regdate}</td>
						                    </tr>
						                  </c:forEach>
						                  </tbody>
						                </table>
						              </div>
						            </div>
						          </div> <!-- card shadow mb-4 -->
					
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<jsp:include page="common/footer.html"></jsp:include>
		</div>
	</div>
<script>
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["기획", "디자인", "프론트앤드","백앤드"],
    datasets: [{
      data: [${todoType["planningCnt"]}, ${todoType["designCnt"]}, ${todoType["front-endCnt"]}, ${todoType["back-endCnt"]}],
      backgroundColor: ['#e74a3b', '#f6c23e', '#4b61cf', '#36b9cc'],
      hoverBackgroundColor: ['#bd4237', '#e3b43d', '#4759b5','#329ead'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
 </script>
</body>
</html>