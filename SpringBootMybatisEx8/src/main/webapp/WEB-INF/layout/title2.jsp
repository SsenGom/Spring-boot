<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.login{
	position: absolute;
	left: 700px;
	top: 30px;
	width: 350px;
	
}

h4.title{
	font-family: "dongle";
	margin-left:  150px;
	color: green;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<a href="/"><img src="${root }/image/title2.png" style="width: 200px; height: 60px;">
<b>쌍용교육 스프링 프로젝트</b></a>

<div class="login">
	<button type="button" class="btn btn-success"
	onclick="location.href='${root}/login/form'">login</button>
</div>
</body>
</html>