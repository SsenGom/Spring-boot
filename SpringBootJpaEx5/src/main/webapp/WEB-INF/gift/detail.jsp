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
<table class="table table-info" style="width: 500px;">
<caption>상품 상세</caption>
<tr>
	<td style="font-size: 2.5em; "><b>${dto.sangpum }</b> <span style="float: right; font-size: 0.4em; color: gray; margin-top: 30px;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></span></td> 
</tr>
<tr>
	<td >&nbsp;&nbsp;<fmt:formatNumber type="currency" value="${dto.price }"/><span style="float: right; color: blue; ">입고일&nbsp;&nbsp; <fmt:formatDate value="${dto.writeday }" pattern="yy년 MM월 dd일"/></span></td>
</tr>
<tr>
	<td><img src="../save/${dto.photo }" style="width: 500px;"></td>
</tr>
<tr>
	<td colspan="2" align="right">
		<button class="btn btn-info" type="button" onclick="location.href='addform'">글쓰기</button>
		<button class="btn btn-info" type="button" onclick="location.href='list'">목록</button>
		<button class="btn btn-info" type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
		<button class="btn btn-info" type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
	</td>
</tr>
</table>
</body>
</html>