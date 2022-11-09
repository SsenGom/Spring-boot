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
<form action="update" method="post" enctype="multipart/form-data">
<input type="text" name="num" value="${dto.num }">
<table style="600px;" class="talbe table-bordered">
<caption>market 정보수정</caption>
<tr>
	<th bgcolor="#ddd" align="center" width="70">상품명</th>
	<td>
	<input type="text" name="sang" class="form-control" value="${dto.sang }">
	</td>
</tr>
<tr>
	<th bgcolor="#ddd" align="center">단가</th>
	<td>
	<input type="text" name="dan" class="form-control" value="${dto.dan }">
	</td>
</tr>
<tr>
	<th bgcolor="#ddd" align="center">사진</th>
	<td>
	<input type="file" name="photo" class="form-control">
	</td>
</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="submit" class="btn btn-info">저장</button>
		<button type="button" class="btn btn-danger"
		onclick="location.href='list'">목록</button>		
		</td>
	</tr>
</table>
</form>
</body>
</html>