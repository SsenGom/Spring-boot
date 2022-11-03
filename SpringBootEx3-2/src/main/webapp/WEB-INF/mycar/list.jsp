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
.box{
	width: 40px;
	height: 40px;
	border: 1px solid gray;
	border-radius: 100px;
}
</style>
</head>
<body>
<img alt="" src="01.png">
<button type="button" class="btn btn-danger" style="margin-left: 200px;" onclick="location.href='carform'">차정보추가</button>
<h4 class="alert alert-success" style="width: 800px;">총 ${count }개 자동차 정보가 있습니다.</h4>

<table class="table table-bordered" style="width: 800px;">
	<caption>자동차 정보</caption>
	<tr>
		<th width="60">번호</th>
		<th width="130">자동차명</th>
		<th width="80">색상</th>
		<th width="150">가격</th>
		<th width="180">구입일</th>
		<th width="180">등록일</th>
		<th width="120">편집</th>

	</tr>
	
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${dto.carname }</td>
			<td>
			<div style="background-color: ${dto.carcolor}" class="box"></div>
			</td>
			<td><fmt:formatNumber value="${dto.carprice }" type="currency"/></td>
			<td>
			${dto.carguip }
			</td>
			<td>
			<fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd HH:mm시"/>
			</td>
			<td>
				<button type="button" class="btn btn-default" onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-default" onclick="location.href='deleteform?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>