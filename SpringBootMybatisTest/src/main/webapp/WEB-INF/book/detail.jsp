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
<body style="background-color: #f5f5dc;">
<table	style="width: 700px; margin-left: 300px; margin-top: 20px; " class="table table-info">
<caption>책 상세정보</caption>
	<tr>
	<td>
		<img  style="width: 350px;" alt="" src="../photo/${dto.bookphoto }">
	</td>
	<td align="left">
	<br>
		<span><b style="font-size: 3.0em; top: 100px;">${dto.bookname }</b></span><br><br><br><br>
		<span style="font-size: 1.5em;">저자: ${dto.writer }</span><br>
		<span style="font-size: 1.5em;">출판사: ${dto.bookcompany }</span><br><br>
		<span style="font-size: 1.5em;">(입고일)<br> <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/></span><br><br><br><br><br><br>
		<span style="font-size: 3.5em;"><b><fmt:formatNumber value="${dto.bookprice }" type="currency"/></b></span>
	</td>
	</tr>
	<tr>
	<td align="right" colspan="2">
	<button type="button" onclick="location.href='addform'" class="btn btn-danger">글쓰기</button>
	<button type="button" onclick="location.href='list'" class="btn btn-success">목록</button>
	<button type="button" onclick="location.href='updateform?num=${dto.num}'" class="btn btn-info">수정</button>
	<button type="button" onclick="location.href='delete?num=${dto.num}'" class="btn btn-default">삭제</button>
	</td>
	</tr>
</table>
</body>
</html>