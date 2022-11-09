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
<button type="button" class="btn btn-success" onclick="location.href='writeform'">폼추가</button>
<br>
<c:if test="${totalCount==0 }">
	<div class="alert alert-info">
		<b>저장된 정보가 없습니다</b>
	</div>
</c:if>
<c:if test="${totalCount>0 }">
	<div class="alert alert-danger">
<b>총${totalCount }개의 글이 있습니다</b>
	</div>
</c:if>
<c:forEach items="${list }" var="l">
<table class="table table bordered" style="width: 400px;">
<tr>
	<td>
		<c:if test="${l.photoname == null }">
		<img alt="" src="../image/noimg.jpg" style="max-width: 150px;" align="left">
		</c:if>
		<img alt="" src="../photo/${l.photoname }" style="max-width: 150px;" align="left">
		<h4>상품명: ${l.sang }</h4>
		<h4>가격: <fmt:formatNumber value="${l.dan}" type="currency"/></h4>
		<h4>입고일: <fmt:formatDate value="${l.ipgo }" pattern="yyyy-MM-dd HH:mm"/></h4>
	
		<h4><button type="button" class="btn btn-success btn-xs" style="width: 60px;"
		onclick="location.href='updateform?num=${l.num}'">수정</button></h4>
		
		<h4><button type="button" class="btn btn-success btn-xs" style="width: 60px;"
		onclick="location.href='delete?num=${l.num}'">삭제</button></h4>
	</td>
</tr>
</table>
</c:forEach>
	
</body>
</html>