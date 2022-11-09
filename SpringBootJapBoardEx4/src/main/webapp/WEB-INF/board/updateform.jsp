<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
#myimg{
	position:absolute;
	left: 600px;
	top: 100px;
	max-width: 200px;
}
</style>

<script type="text/javascript">
$(function(){
		
		$("#upload").change(function(){
		
			var reader = new FileReader();
	        reader.onload = function (e) {
	        $('#myimg').attr('src', e.target.result);
	        }
	        reader.readAsDataURL($(this)[0].files[0]); //현재 선택한 팡리
		});
	});
</script>

</head>
<body>
<div style="margin: 50px;">
	<form action="update" method="post" enctype="multipart/form-data"><!-- 이미지 들어갈 때는 무조건 encdata -->
	<input type="hidden" value="${dto.num }" name="num">	
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th width="120" bgcolor="pink">작성자</th>
				<td>
					<span name="writer" ><b>${dto.writer }</b></span>
				</td>
			</tr>
			<tr>
				<th width="120" bgcolor="pink">제목</th>
				<td>
					<input type="text" name="subject" required="required" class="form-control"
					style="width: 350px;" value="${dto.subject }">
				</td>
			</tr>
			<tr>
				<th width="120" bgcolor="pink">사진</th>
				<td>
					<input type="file" name="upload"  class="form-control"
					style="width: 350px;" id="upload" value="${dto.photo }" > <!-- 일부러 photo (db와 같게) 안함. 중간과정에서 무엇이 잘못됐는지 확인하기 위해 -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<textarea style="width: 500px; height: 150px;" name="content" required="required" >${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;" >저장</button>
					<button type="button" class="btn btn-success" style="width: 100px;"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
	
	<img alt="" src="../save/${dto.photo }" style="max-width: 315px;" id="myimg">
</div>
</body>
</html>