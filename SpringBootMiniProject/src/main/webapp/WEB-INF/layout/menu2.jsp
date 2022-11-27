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

ul.menu{list-style: none;}

ul.menu li{
	cursor: pointer;
	width: 120px;
	float: left;
	border: 1px solid gray;
	border-radius:20px;
	height: 60px;
	line-height: 60px;
	margin-right: 10px;
	text-align: center;
	font-size: 24px;
	font-family: 'Nanum Pen Script';
	background-color: #fff0f5;
}

ul.menu li a{
  color: black;
  text-decoration: none;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<ul class="menu">
  <li>
     <a href="/">Home</a>
  </li>
  <li>
     <a href="${root}/smart/list">스마트상점</a>
  </li>
    <li>
     <a href="${root}/reboard/list">답변형게시판</a>
  </li>
  <li>
     <a href="${root}/bootshop/list">상품목록</a>
  </li>
  <li>
     <a href="${root}/board/list">게시판</a>
  </li>
  <li>
     <a href="${root}/member/form">회원가입</a>
  </li>
  <li>
     <a href="${root}/member/list">회원목록</a>
  </li>
  <li>
     <a href="${root}/load/map">오시는길</a>
  </li>
</ul>
</body>
</html>