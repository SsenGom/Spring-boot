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
	<input type="hidden" name="num" value="${dto.num }">
	<input type="hidden" name="currentPage" value="${currentPage }">
	
	<table class="table table-bordered" style="width: 500px;">
		<caption><b>회원전용게시판</b></caption>
		<tr>
			<th width="120" bgcolor="#e0ffff">제목</th>
				<td>
					<input type="text" name="subject" class="form-control"
					required="required" value="${dto.subject }">
				</td>
		</tr>
		<tr>
			<th width="120" bgcolor="#e0ffff">업로드</th>
				<td>
					<input type="file" name="upload" class="form-control" >
				</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<textarea style="width: 490px; height: 150px;" class="form-control" name="content" required="required">${dto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-default">전송</button>
				<button type="button" class="btn btn-success" onclick="location.href='list'">목록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>