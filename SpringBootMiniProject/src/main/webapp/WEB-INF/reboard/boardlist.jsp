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
<div class="searcharea" style="width: 100%; text-align: center;">
	<!-- 검색창  -->
	<form action="list" class="form-inline">
		<div style="width: 450px;">
			<select class="form-control" style="width: 150px;" name="searchcolumn">
				<option value="subject">제목</option>
				<option value="id">아이디</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchword" class="form-control" style="width: 150px;" >
			<button type="submit" class="btn btn-info">검색</button>
		</div>
	</form>
	
	<a href="list?searchcolumn=id&searchword=${sessionScope.myid }">내가쓴글</a>
</div>

<div class="boardlist" style="margin-top: 20px;">
	<h3 class="alert alert-info">${totalCount }개의 글이 있습니다</h3>
	<br>
	<table class="table table-bordered">
		<tr>
			<th width="30">번호</th>
			<th width="200">제목</th>
			<th width="50">작성자</th>
			<th width="50">작성일</th>
			<th width="30">조회</th>
			<th width="30">추천</th>
		</tr>
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="6" align="center">
					<h4>등록된 글이 없습니다</h4>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0 }">
			<c:forEach var="dto" items="${list }">
			<tr>
				<td align="center">${no }</td>
			<c:set var="no" value="${no-1 }"/>
			<td>
				<!-- 답글일 경우 level당 2칸 띄우기-->
				<c:forEach begin="1" end="${dto.relevel }">&nbsp;&nbsp;</c:forEach>
				<!-- 답글일경우 답글 이미지 -->
				<c:if test="${dto.relevel>0 }">
					<img alt="" src="../image/re.png">				
				</c:if>
				
				<a href="detail?num=${dto.num }&currentPage=${currentPage}">${dto.subject }
					<c:if test="${dto.photo!='no' }">
						<span class="glyphicon glyphicon-picture" style="color: gray;"></span>
					</c:if>
				</a>
			</td>
			<td>${dto.name }</td>
			<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></td>
			<td>${dto.readcount }</td>
			<td>${dto.likes }</td>
			</tr>
			</c:forEach>
		</c:if>


<!-- 글쓰기 버튼은 로그인을 해야 보인다 -->
<c:if test="${sessionScope.loginok!=null }">
	<tr>
		<td colspan="6" align="center">
		<button type="button" class="btn btn-info" onclick="location.href='form'">글쓰기</button>
		</td>
	</tr>
</c:if>
	</table>
</div>


<button type="button"onclick="location.href='form'" class="btn btn-success">답변형폼</button>
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