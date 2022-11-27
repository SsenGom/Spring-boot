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
<table class="table table-bordered" style="width: 700px;">
	<tr>
		<td>
			<h3><b>${dto.subject }</b>
				<span style="font-size: 13pt; color: gray; float: right;" >
				<fmt:formatDate value="${dto.wirteday }" pattern="yyyy-MM-dd HH:mm"/></span></h3>
			<span>작성자:${dto.name }&nbsp;${dto.myid }</span>
		
			<c:if test="${dto.uploadfile!='no' }">
				<span style="float: right;">
			<!--href경로가 download컨트롤러 겟매핑값 clip은 파라메터로 넘어가는 값. 오리지날 파일네임과 같다-->					
			<a href="download?clip=${dto.uploadfile }" ><span class="glyphicon glyphicon-download-alt"></span>
			${dto.uploadfile }
			</a>
				</span>
			</c:if>
		</td>
	</tr>
	<tr>
	<td>
	<c:if test="${bupload==true }">
		<h3>업로드 파일이 이미지 입니다</h3>
		<img src="../photo/${dto.uploadfile }" style="max-width: 200px;">
	</c:if>
		<br><br>
		<pre style="background-color: #fff; border: 0px;" >
			<br>${dto.content }
		</pre>
		<br>
		<b>조회수: ${dto.readcount }</b>
		</td>
	</tr>
	
		<!-- 댓글 -->
				<tr>
					<td>
						<div id="answer">
						<b>댓글 ${acount }<br><br>
						
						<c:forEach items="${alist }" var="a">
						
								${a.name } ${a.myid } 
								<div style="background-color: lightgray;"> ${a.content }</div> 
						<span style="color: gray; font-size: 0.8em">
						<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
						<span class="adel" style="cursor: pointer;" idx="${a.idx }">삭제</span>
  						<c:if test="${sessionScope.loginok!=null && sessionScope.myid==a.myid }">
						<span class="aup" style="cursor: pointer;" idx="${a.idx }">수정</span>
						</c:if>
						<br><br>
						</span>
						</c:forEach>
						</b>
						</div>
						<form action="ainsert" method="post" class="form-inline">
							<input type="hidden" name="num" value="${dto.num }">
							<input type="hidden" name="currentPage" value="${currentPage }">
							<div>
								<input type="text" name="content" class="form-control" style="width: 500px;" required="required"
								placeholder="댓글 내용은 입력해주세요">
								<button type="submit" class="btn btn-default">확인</button>
							</div>
						</form>
					</td>
				</tr> 
				
	
	
	<tr>
		<td align="right">
			<c:if test="${sessionScope.loginok!=null }"> 
			<button type="button" class="btn btn-success" onclick="location.href='form'">글쓰기</button>
			</c:if>
			<button type="button" class="btn btn-success" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			<c:if test="${sessionScope.loginok!=null && sessionScope.myid == dto.myid}">
			<button type="button" class="btn btn-success" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
			<button type="button" class="btn btn-success" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</c:if>
		</td>
	</tr>
	
<script type="text/javascript">
 
   $("span.adel").click(function(){
	   
	   var idx=$(this).attr("idx");
		console.log(idx);

	   $.ajax({
		   
		   type:"get",
		   dataTYpe:"html",
		   url:"adelete",
		   data:{"idx":idx},
		   success:function(){			   
			   alert("삭제성공");
				//새로고침
			   location.reload();
		   }
	   });
   });
 
 </script>
</table>
</body>
</html>