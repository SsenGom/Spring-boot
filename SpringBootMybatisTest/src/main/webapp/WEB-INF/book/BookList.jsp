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
<button style="margin-left: 310px; margin-top: 120px;" type="button" onclick="location.href='addform'" class="btn btn-danger">도서등록</button>
<c:if test="${count ==0}">
<div style="margin-left: 900px;"><b>책이 없어요</b></div>
</c:if>
<c:if test="${count >0}">
<div style="margin-left:950px;"><b>총 ${count }권의 책이 있습니다</b></div>
</c:if>
<table	style="width: 800px; margin-left: 300px; " class="table table-info">
	<tr>
	<c:forEach items="${list }" var="l" varStatus="i">
	<td style="width: 200px;">
		<img  style="cursor: pointer; max-width: 200px; max-height: 280px;" onclick="location.href='detail?num=${l.num}'" alt="" src="../photo/${l.bookphoto }"><br>
		<span><b style="font-size: 1.2em;" onclick="location.href='detail?num=${l.num}'">${l.bookname }</b></span><br>
		<span style="font-size: 0.9em;">저자: ${l.writer }</span><br>
		<span style="font-size: 0.9em;">출판사: ${l.bookcompany }</span><br>
		<span><b><fmt:formatNumber value="${l.bookprice }" type="currency"/></b></span>
	</td>
	<c:if test="${i.count%4==0 }">
	</tr><tr>
	</c:if>
	</c:forEach>
	</tr>
</table>
</body>
</html>