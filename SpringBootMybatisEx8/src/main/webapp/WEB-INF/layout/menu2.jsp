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
ul.menu{
list-style: none;
}
ul.menu li{
	cursor: pointer;
	width: 120px;
	float: left;
	border: 1px solid gray;
	height: 60px;
	line-height: 60px;
	margin-right: 10px;
	text-align: center;
	font-size: 24px;
	font-family: 'Nanum Pen Script';
	background-color: green;
}

ul.menu li a{
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<ul class="menu">
	<li>
		<a href="${root }/">Home</a>
	</li>
	<li>
		<a href="${root }/market/addform">상품등록</a>
	</li>
	<li>
		<a href="${root }/market/marketlist">상품목록</a>
	</li>
	<li>
		<a href="${root }/board/list">게시판</a>
	</li>
	<li>
		<a href="${root }/member/form">회원가입</a>
	</li>
	<li>
		<a href="${root }/member/list">회원목록</a>
	</li>
	<li>
		<a href="${root }/load/map">오시는길</a>
	</li>
</ul>
</body>
</html>