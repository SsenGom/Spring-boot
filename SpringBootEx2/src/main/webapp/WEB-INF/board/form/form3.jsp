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
<b>폼데이터 map으로 읽기</b>
<form action="read3" method="post">
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th width="100">이름</th>
			<td>
			<input type="text" name="name" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th width="100">혈액형</th>
			<td>
			<input type="text" name="blood" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th width="100">hp</th>
			<td>
			<input type="text" name="hp" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">서버에 전송</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>