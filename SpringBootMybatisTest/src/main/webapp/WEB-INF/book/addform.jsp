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
<form action="insert" method="post" enctype="multipart/form-data">
<table style="width: 600px; background-color: #f5f5dc; margin-left: 400px; margin-top: 100px;"  class="table table-info">
<caption>책등록</caption>
<tr>
	<th bgcolor="white" style="width: 100px;">책이름</th>
	<td>
		<input type="text" required="required" class="form-control" name="bookname">
	</td>
</tr>
<tr>
	<th bgcolor="white" style="width: 100px;">저자</th>
	<td>
		<input type="text" required="required" class="form-control" name="writer">
	</td>
</tr>
<tr>
	<th bgcolor="white" style="width: 100px;">책가격</th>
	<td>
		<input type="text" required="required" class="form-control" name="bookprice">
	</td>
</tr>
<tr>
	<th bgcolor="white" style="width: 100px;">이미지</th>
	<td>
		<input type="file" required="required" class="form-control" name="photo">
	</td>
</tr>
<tr>
	<th bgcolor="white" style="width: 100px;">출판사</th>
	<td>
		<input type="text" required="required" class="form-control" name="bookcompany">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="submit" class="btn btn-success">저장</button>
		<button type="submit" class="btn btn-success" onclick="location.href='list'">목록</button>
	</td>
</tr>
</table>
</form>
</body>
</html>