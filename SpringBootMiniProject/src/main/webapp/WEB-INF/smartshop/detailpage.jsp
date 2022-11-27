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
<table class="table table-bordered" style="width: 700px;">
	<tr>
		<td>
		<div><b style="font-size: 2.0em">${dto.goods }</b> &nbsp;&nbsp;&nbsp; <fmt:formatNumber value="${dto.price }" type="currency"/> </div>	
		<div style="width: 50px; height: 50px; border-radius: 50%; float: right; background-color: ${dto.color};" ></div>		
		<br><div style="font-size: 0.8em; color: gray">${dto.ipgoday }</div>
		<hr>
		<br>
		<div>${dto.content }</div>
		</td>
	</tr>
	<tr>
		<td align="right">
			<button class="btn btn-success" onclick="location.href='list?currentPage=${currentPage }'">목록</button>
			<button class="btn btn-success" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
		</td>
	</tr>
</table>
</body>
</html>