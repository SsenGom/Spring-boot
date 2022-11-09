<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.login{
	position: absolute;
	left: 700px;
	top: 30px;
	width: 350px;
}

h4.title{
  font-family: 'Hi Melody';
  margin-left: 150px;
  color: green;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<a href="/"><img alt="" src="${root }/image/title2.PNG" style="width: 200px; height: 60px;">
   <h4 class="title">쌍용교육 스프링 프로젝트</h4>
</a>
<div class="login">
<c:if test="${sessionScope.loginok==null }">
  <button type="button" class="btn btn-success" style="width: 100px;"
  onclick="location.href='${root}/login/main'">Login</button>
</c:if>

<c:if test="${sessionScope.loginok!=null }">
  <b>${sessionScope.myid }님이 로그인 중입니다</b>
  <button type="button" class="btn btn-danger" style="width: 100px;"
  onclick="location.href='${root}/login/logoutprocess'">Logout</button>
</c:if>
</div>
</body>
</html>