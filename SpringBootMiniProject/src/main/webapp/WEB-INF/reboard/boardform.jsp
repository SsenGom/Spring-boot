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
<c:if test="${sessionScope.loginok==null }">
	<script type="text/javascript">
	alert("먼저 로그인 후 글을 써주세요")
	history.back()
	</script>
</c:if>

<form action="insert" method="post" enctype="multipart/form-data">
	<input type="text" name="num" value="${num }">
	<input type="text" name="currentPage" value="${currentPage }">
	<input type="text" name="restep" value="${restep }">
	<input type="text" name="regroup" value="${regroup }">
	<input type="text" name="relevel" value="${relevel }">
	<input type="text" name="name" value="${sessionScope.loginname }">
	<input type="text" name="id" value="${sessionScope.myid }">
	<table class="table table-bordered" style="width: 600px;">
<caption>게시글 입력</caption>
	<tr>
		<th style="width: 100px;">제목</th>
		<td>
		<input type="text" name="subject" placeholder="제목을 입력하세요" class="form-control" required="required">
		</td>
	</tr>
	<tr>
		<th style="width: 100px;">사진</th>
		<td>
		<input type="file" name="upload" multiple="multiple" class="form-control">
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea placeholder="내용을 입력하세요" style="width: 400px; height: 150px;" name="content"
		class="form-control" required="required"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit" class="btn btn-default" style="width: 100px;">게시글저장</button>
			<button type="button" class="btn btn-default" style="width: 100px;"
			onclick="location.href='list'">게시글저장</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>