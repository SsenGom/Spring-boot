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
<table class="table" style="width: 600px;"> 
	<caption>상세 보기</caption>
	<tr>
		<td>
			작성자: ${dto.writer }
				<span style="float: right;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></span>
		</td>
	</tr>
	<tr height="100">
		<td>
			<h2><b>${dto.subject }</b></h2>
			${dto.content }
			<c:if test="${dto.photo!='no' }">
			<br><Br>
			<img alt="" src="../save/${dto.photo }" style="max-width: 300px;">
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" class="btn btn-default" style="width: 80px;"
			onclick="location.href='addform'"><span class="glyphicon glyphicon-pencil"></span>글쓰기</button>
			<button type="button" class="btn btn-default" style="width: 80px;"
			onclick="location.href='list'"><span class="glyphicon glyphicon-th-list"></span>목록</button>
			<button type="button" class="btn btn-default" style="width: 80px;"
			onclick="location.href='updateform?num=${dto.num}'"><span class="glyphicon glyphicon-edit"></span>수정</button>
			<button type="button" class="btn btn-default" style="width: 80px;"
			onclick="remove(${dto.num})"><span class="glyphicon glyphicon-trash">삭제</button>
		</td>
	</tr>
</table>
<script type="text/javascript">
function remove(num) {
	//alert(num);
	var ans=confirm("삭제하려면 [확인]을 눌러주세요");
	if(ans) {
		location.href="delete?num="+num;
	}
}
</script>
</body>
</html>