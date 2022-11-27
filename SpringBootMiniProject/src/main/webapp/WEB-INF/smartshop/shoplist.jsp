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
<h3 class="alert alert-info" style="width: 900px;">총 ${totalCount }개의 상품이 입고되었습니다</h3>
<button type="button" class="btn btn-success"
onclick="location.href='smartform'">스마트상품추가</button>
<table class="table table-bordered" style="width: 900px;">
	<caption><b>스마트 상점 상품등록</b></caption>
		<tr bgcolor="#fff0f5">
			<th width="60">번호</th>
			<th width="300">상품명</th>
			<th width="200">입고일</th>
		</tr>
		
			<c:forEach var="l" items="${list }">
		<tr>
				<td>${no }</td>
				<c:set var="no" value="${no-1 }"/>
				<td onclick="location.href='getdate?num=${l.num}&currentPage=${currentPage }'">${l.goods }</td>
				<td>${l.ipgoday }</td>
		</tr>
			</c:forEach>
		
</table>


<!-- 페이징처리 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align: center;" class="container">
			<ul class="pagination">
			
			<!-- 이전 -->
			<c:if test="${startPage>1 }">
				<li>
					<a href="list?currentPage=${startPage-1 }">이전</a>
				</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp==currentPage}">
					<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				<c:if test="${pp!=currentPage}">
					<li>
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<li>
					<a href="list?currentPage=${endPage+1 }">다음</a>
				</li>
			</c:if>
			</ul>
		</div>
	</c:if>
	
</div>

</body>
</html>