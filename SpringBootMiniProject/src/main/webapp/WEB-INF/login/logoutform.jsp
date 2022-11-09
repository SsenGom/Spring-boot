<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script></head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div style="margin-left: 100px; margin-top: 50px;">
	<img src="${root }/image/toy01.png" width="200" align="left">
	<br><br>
	<b>${name }님 로그인중...</b><br><br>
	<button type="button" class="btn btn-danger" style="width: 100px"
	onclick="location.href='logoutprocess'">로그아웃</button>
</div>
</body>
</html>