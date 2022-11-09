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

</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data">
<table class="table table-info" style="width: 400px;">
<caption>상품 입력폼</caption>
<tr>
		<th style="width: 100px; background-color: lime;" >상품명</th>
	<td>
		<input type="text" class="form-control" name="sangpum" required="required" style="width: 200px;">
	</td>
</tr>
<tr>
		<th style="width: 100px; background-color: lime;" >상품가격</th>
	<td>
		<input type="text" class="form-control" name="price" required="required" style="width: 200px;">
	</td>
</tr>
<tr>
		<th style="width: 100px; background-color: lime;" >삼품사진</th>
	<td>
		<select onchange="readURL(this)" name="photo">
			<option value="1.jpg">코트</option>
			<option value="2.jpg">코트2</option>
			<option value="3.jpg">모자</option>
			<option value="4.jpg">바지</option>
			<option value="5.jpg">티셔츠</option>
			<option value="6.jpg">베스트</option>
			<option value="7.jpg">원피스</option>
			<option value="8.jpg">후리스</option>
			<option value="9.jpg">목도리</option>
			<option value="10.jpg">브라우스</option>
		</select>
	</td>
</tr>
<tr>
		<th style="width: 100px; background-color: lime;" >입고일</th>
	<td>
		<input type="date" class="form-control" name="ipgoday" required="required" style="width: 200px;">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="submit" class="btn btn-success">저장</button>
		<button type="button" class="btn btn-danger" onclick="location.href='list'">목록</button>
	</td>
</tr>
</table>
</form>
</body>
</html>