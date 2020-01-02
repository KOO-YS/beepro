<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>협업페이지</title>

</head>

<body>
	<c:redirect url="/project?command=dashboard">
		<%-- <c:param name="NUM1" value="5"/> --%>
		<!-- index와 업무 진행상황 페이지에 차이점이 필요할때 사용 -->
	</c:redirect>
</body>
</html>
