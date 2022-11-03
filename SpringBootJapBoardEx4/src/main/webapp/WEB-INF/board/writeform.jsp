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
<div style="margin: 50px;">
	<form action="insert" method="post" enctype="multipart/form-data"><!-- 이미지 들어갈 때는 무조건 encdata -->
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th width="120" bgcolor="pink">작성자</th>
				<td>
					<input type="text" name="writer" required="required" class="form-control"
					style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th width="120" bgcolor="pink">제목</th>
				<td>
					<input type="text" name="subject" required="required" class="form-control"
					style="width: 350px;">
				</td>
			</tr>
			<tr>
				<th width="120" bgcolor="pink">사진</th>
				<td>
					<input type="file" name="upload"  class="form-control"
					style="width: 350px;"> <!-- 일부러 photo (db와 같게) 안함. 중간과정에서 무엇이 잘못됐는지 확인하기 위해 -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<textarea style="width: 500px; height: 150px;" name="content" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;" >저장</button>
					<button type="button" class="btn btn-success" style="width: 100px;"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>