<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
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
.rate {
    float: left;
    height: 46px;
    /* padding: 0 10px; */
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}
</style>
<title>업무 상세보기</title>
</head>
<body>
	<div id="wrapper">
		<!-- 상단 메뉴 바 -->
		<div id="headers"></div>
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
							<h5><b>업무 진행 상황</b></h5>
							<hr>
							<!-- Content Row -->
					        <div class="row">
					
								<!-- Earnings (Monthly) Card Example -->
								<div class="col-xl-6 col-md-6 mb-4">
									<div class="card border-left-info shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xs font-weight-bold text-info text-uppercase mb-1">업무</div>
													<div class="row no-gutters align-items-center">
														<div class="col-auto">
															<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
														</div>
														<div class="col">
															<div class="progress progress-sm mr-2">
																<div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
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
								                        <div class="col-4 text-xs font-weight-bold text-warning text-uppercase mb-1">발생 이슈</div>
								                        <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
								                    </div>
								                    <div class="row">
								                        <div class="col-4 text-xs font-weight-bold text-warning text-uppercase mb-1">해결된 이슈</div>
								                        <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
								                    </div>
							                    </div>
							                    <div class="col-auto">
							                      <i class="fas fa-comments fa-2x text-gray-300"></i>
							                    </div>
						                  	</div>
						                </div>
					              	</div>
					            </div>
				            </div>
					
					          <!-- Content Row -->
					            <div class="row">
					                <!-- Content Column -->
					                <div class="col-lg-5 mb-4">
					
					                    <!-- Project Card Example -->
					                    <div class="card shadow mb-4">
					                    <div class="card-header py-3">
					                        <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
					                    </div>
					                    <div class="card-body">
					                        <h4 class="small font-weight-bold">Server Migration <span class="float-right">20%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <h4 class="small font-weight-bold">Sales Tracking <span class="float-right">40%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <h4 class="small font-weight-bold">Customer Database <span class="float-right">60%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <h4 class="small font-weight-bold">Payout Details <span class="float-right">80%</span></h4>
					                        <div class="progress mb-4">
					                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                    </div>
					                    </div>
					                </div>
					            
					                <!-- Pie Chart -->
					                <div class="col-xl-6 col-lg-12">
					                    <div class="card shadow mb-6">
						                    <!-- Card Header - Dropdown -->
						                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						                        <h6 class="m-0 font-weight-bold text-primary">분야별 할 일 개수</h6>
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
								</div>
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
      data: [${categoryMap["planning"]}, ${categoryMap["design"]}, ${categoryMap["front-end"]}, ${categoryMap["back-end"]}],
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