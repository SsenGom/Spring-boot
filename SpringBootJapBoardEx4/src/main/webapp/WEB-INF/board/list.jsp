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
	<button type="button" class="btn btn-info" onclick="location.href='addform'">글쓰기</button>
	<br>
	<h2>총 ${count }개의 게시글이 있습니다</h2>
	<br>
	<table class="table table-bordered" style="width: 800px;">
		<tr bgcolor="#ddd">
		<th width="60">번호</th>
		<th width="450">제목</th>
		<th width="100">작성자</th>
		<th width="160">작성일</th>
		</tr>
		
		<c:if test="${count==0 }">
			<tr>
				<td colspan="4" align="center">
				<b>등록된 게시글이 없습니다</b>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${count>0 }">
			<c:forEach items="${list }" var="dto" varStatus="i">
				<c:set var="n" value="${count-i.index }"/> <!-- 끝번호부터 뜸 -->
				<tr>
					<td>${n }</td>
					<td>
						<a href="detail?num=${dto.num}">${dto.subject }</a>
						<c:if test="${dto.photo!='no' }">
						&nbsp;&nbsp;<span class="glyphicon glyphicon-picture" style="color: gray; font-size: 0.8em;"></span>
						</c:if>
					</td>
					<td>${dto.writer }</td>
					<td>
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
</body>
</html>