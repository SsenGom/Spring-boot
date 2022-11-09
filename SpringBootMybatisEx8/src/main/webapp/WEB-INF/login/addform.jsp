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
	<div class="loginform" style="50px 50px;">
		<form action="loginprocess" method="post">
			<table class="table table-bordered" style="width: 400px;">
				<caption><b>회원로그인</b></caption>
				<tr>
					<th style="width: 120px; background-color: #fff0f5">아이디</th>
						<td>
							<input placeholder="아이디를 입력하세요" style="width: 150px;" 
							type="text" name="id" class="form-control" required="required">
						</td>
				</tr>
				<tr>
					<th style="width: 120px; background-color: #fff0f5">비밀번호</th>
						<td>
							<input placeholder="비밀번호를 입력하세요" style="width: 150px;" 
							type="password" name="pass" class="form-control" required="required">
						</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="checkbox" name="cbsave">아이디저장
						<button type="submit" class="btn btn-info" style="width: 150px;">회원로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>