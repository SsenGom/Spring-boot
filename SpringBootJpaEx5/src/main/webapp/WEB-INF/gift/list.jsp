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
<body>
<button type="button" onclick="location.href='addform'" class="btn btn-danger">글쓰기</button><br><br>
<span><b>총 ${count }개의 자료가 있습니다</b></span>
<table style="width: 800px;" class="table table-bordered">
	<tr style="background-color: pink;" align="center">
		<th>번호</th>
		<th>상품명</th>
		<th>사격</th>
		<th>사진</th>
		<th>입고일</th>
		<th>작성일</th>
		<th>수정</th>
	</tr>
	<c:forEach items="${list }" varStatus="i" var="l">
	<tr>
		<td>${i.count }</td>
		<td><a href="detail?num=${l.num }">${l.sangpum }</a></td>
		<td><fmt:formatNumber value="${l.price }" type="currency"/></td>
		<td><img src="../save/${l.photo }" style="width: 100px; height: 100px;"></td>
		<td>${l.ipgoday }</td>
		<td><fmt:formatDate value="${l.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
		<td>
			<button type="button" class="btn btn-info" onclick="location.href='updateform?num=${l.num}'">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='delete?num=${l.num}'">삭제</button>
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>