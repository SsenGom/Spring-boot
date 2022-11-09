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
</head>
<body>
<div style="font-size: 12pt; line-height: 25px;">
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!-- //로그아웃 상태에는 기본 사진이, 로그인 상태에는 로그인 포토가 나옴 -->
<c:if test="${sessionScope.loginok==null }">
	<img src="${root }/image/toy01.png" style="width: 130px; height: 130px;" class="img-circle">
</c:if>

<c:if test="${sessionScope.loginok!=null }">
	<img src="${root }/photo/${sessionScope.loginphoto}" style="width: 130px; height: 130px;" class="img-circle">
</c:if>
  <span class="glyphicon glyphicon-user"></span>쌍용교육센터<br>
  <span class="glyphicon glyphicon-phone-alt"></span>02-111-2222<br>
  <span class="glyphicon glyphicon-map-marker"></span>서울시 강남구<br>
  <span class="glyphicon glyphicon-envelope">sist@naver.com</span><br>
  <span class="glyphicon glyphicon-barcode"></span><br>
</div>
</body>
</html>