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
<form action="update" method="post">
<input type="hidden" name="num" value="${dto.num }">
<table class="table table-bordered" style="width: 500px;">
	<caption>차정보수정</caption>
<tr>
<th bgcolor="#grey">자동차명</th>
<td>
	<input type="text" name="carname" class="form-control" style="width: 200px;" required="required" value="${dto.carname }">
</td>
</tr>
<tr>
<th bgcolor="#grey">단가</th>
<td>
	<input type="text" name="carprice" class="form-control" style="width: 200px;" required="required" value="${dto.carprice }">
</td>
</tr>
<tr>
<th bgcolor="#grey">색상</th>
<td>
	<input type="color" name="carcolor" class="form-control" style="width: 200px;" required="required" value="${dto.carcolor }">
</td>
</tr>
<tr>
<tr>
<th bgcolor="#grey">구입일</th>
<td>
	<input type="date" name="carguip" class="form-control" style="width: 200px;" required="required" value="${dto.carguip }">
</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<button type="submit" class="btn btn-info">입력</button>
		<button type="button" onclick="location.href='list'" class="btn btn-danger">목록</button>
	</td>
</tr>
</table>
</form>
</body>
</html>