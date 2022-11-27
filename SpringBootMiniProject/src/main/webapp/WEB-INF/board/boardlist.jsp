<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.loginok!=null }">
<button type="button" class="btn btn-default" style="width: 100px; margin-left: 800px;"
onclick="location.href='form'">글쓰기</button>
</c:if>
<br><br>
<table class="table table-bordered" style="width: 900px;">
	<tr>
		<th width="60">번호</th>
		<th width="400">제목</th>
		<th width="60">작성자</th>
		<th width="60">조회</th>
		<th width="120">등록일</th>
	</tr>
	<c:if test="${totalCount ==0}">
		<tr>
			<td colspan="5" align="center">
				<h4>등록된 글이 없습니다</h4>
			</td>
		</tr>
	</c:if>
	<c:forEach var="l" items="${list}">
		<tr>
			<td align="center">${no }</td>
			<c:set var="no" value="${no-1 }"/>
			<td>
				<a href="content?num=${l.num }&currentPage=${currentPage}">${l.subject }</a>
				<c:if test="${l.acount>0 }">
					<a style="color: red;" href="content?num=${l.num }&currentpage=${currentPage} #answer">[${l.acount }]</a>
					</c:if>
				<c:if test="${l.uploadfile!= 'no' }">
					<span class="glyphicon glyphicon-picture"></span>
				</c:if>
			</td>
			
			<td>${l.name }</td>
			<td>${l.readcount }</td>
			<td>
			<fmt:formatDate value="${l.wirteday }" pattern="yyyy-MM-dd"/>
			</td>
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