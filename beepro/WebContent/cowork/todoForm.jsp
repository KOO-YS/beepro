<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#headers").load("common/side_bar.jsp");
		$("#top_bar").load("common/top_bar.jsp");
		$("#footer").load("common/footer.html")
	});

</script>
<script>
$( function() {
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd' //Input Display Format 변경
	});
    /* var dateFormat = "yy-mm-dd", */
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
	
</script>   
<title>업무 추가</title>
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
</head>
<body>
	<div id="wrapper">
		<!-- 상단 메뉴 바 -->
		<div id="headers"></div>

		<!-- 내용이 들어갈 구역을 정의하는 div -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 내용이 들어갈 구역을 정의하는 div -->
			<div id="content">

				<!-- 왼쪽 메뉴 바 -->
				<div id="top_bar"></div>

				<!-- 본격적으로 내용이 담기는 div -->
				<div class="container-fluid">
					<div class="container">
						<h5><b>새 업무</b></h5>
						<hr>
						<form action="../todo" method="post">
							<input type="hidden" name="command" value="todoForm">
							<input type="hidden" name="projectSeq" value="1">
							<div class="row">
							  <div class="form-group col-lg-6">
							    <label for="title">업무 명</label>
							    <input type="text" class="form-control" id="title" name="title">
							  </div>
							  <div class="form-group col-lg-3">
							    <label for="manager">담당자</label>
							    <input type="text" class="form-control" id="manager" name="manager" value="매니저 or 아이디" readonly>
							  </div>
							  <div class="form-group col-lg-3">
							    <label for="category">분류</label>
							    <select name="category" class="form-control" id="category">
							    	<option value="planning">기획</option>
							    	<option value="design">디자인</option>
							    	<option value="front-end">프론트앤드</option>
							    	<option value="back-end">백앤드</option>
							    </select>
							  </div>
							</div>
							  <div class="form-group">
							    <label for="content">업무내용</label>
							    <textarea class="form-control" id="content" name="content" rows="3"></textarea>
							  </div>
							<div class="row">
							  <div class="form-group col-lg-4 ">
							    <label for="star-rate">중요도</label><br>
							    <!-- https://codepen.io/just_bonnie_n/pen/gObadwZ -->
							    <div class="rate" id="star-rate">
								    <input type="radio" id="star5" name="priority" value="5" />
								    <label for="star5" title="text">5 stars</label>
								    <input type="radio" id="star4" name="priority" value="4" />
								    <label for="star4" title="text">4 stars</label>
								    <input type="radio" id="star3" name="priority" value="3" />
								    <label for="star3" title="text">3 stars</label>
								    <input type="radio" id="star2" name="priority" value="2" />
								    <label for="star2" title="text">2 stars</label>
								    <input type="radio" id="star1" name="priority" value="1" />
								    <label for="star1" title="text">1 star</label>
								 </div>
							  </div>
							  <div class="form-group col-lg-8">
							  	<div class="row">
							  	<!-- https://jqueryui.com/datepicker/#date-range -->
								  	<div class="col-6">
		                  				<label for="from">시작날짜</label>
										<input type="text" class="form-control" id="from" name="from">
								  	</div>
								  	<div class="col-6">
										<label for="to">마감날짜</label>
										<input type="text" class="form-control" id="to" name="to">
								  	</div>
							  	</div>
							  	
                  			  </div>
							</div>
							
						    <button class="btn btn-primary" style="float:right;">작성</button>
						</form>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<div id="footer"></div>
		</div>
	</div>
<script type="text/javascript">

</script>

</body>
</html>