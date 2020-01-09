<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeePro - 파일드라이브</title>
</head>
<body>
<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
작성자 : <input type="text" name="u_id" value="${u_id }">
</form>
</body>
</html>