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
<table class="table table-bordered" style="width: 600px;">
	<tr> ${dto.subject }</tr>
	<tr> ${dto.name } </tr>
	<tr height="300" valign="top">
		<td>
			<pre style="background-color: #fff; border: 0px;">${dto.content }</pre>
			<br><br>
			<c:if test="${dto.photo!='no' }">
				<c:forTokens items="${dto.photo }" var="photo" delims=",">
					<img alt="" src="../photo/${photo }" width="100" class="img-thumbnail">
				</c:forTokens>
			</c:if>
			
			<br><br><br>
			<div class="likes" style="float: left;">
				<span class="glyphicon glyphicon-heart"></span>&nbsp;
				좋아요 <b>${dto.likes }</b></div>
				&nbsp;&nbsp;
				<span class="glyphicon glyphicon-comment"></span>
				&nbsp;<b class="banswer">0</b>		
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='form'">새글</button>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			
			<c:if test="${sessionScope.loginok!=null && sessionScope.myid ==dto.id }">
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</c:if>
		</td>
	</tr>
</table>

<script type="text/javascript">
$("div.likes").click(function(){
	
	var heart=$(this).find("span").attr("class");
	//alert(heart);
	
	if(heart=='glyphicon glyphicon-heart'){
		$(this).find("span").attr("class","glyphicon glyphicon-heart").css("color","red");
	}else {
		$(this).find("span").attr("class","glyphicon glyphicon-heart").css("color","black");
	}
	
	//ajax이용 증가후 출력
	
	var num=${dto.num};
	console.log(num);
	
	$.ajax({
		
		type:"get",
		url:"likes",
		dataType:"json",
		data:{"num":num},
		success:function(res){
			$("div.likes").find("b").text(res.likes);
		}
		
	});
});
</script>

</body>
</html>