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
#showimg{
	border: 1px solid gray;
	width: 130px;
	height: 150px;
}
</style>
<script type="text/javascript">
$(function(){
	//버튼클릭시 사진불러오기
	$("#btnphoto").click(function(){	
		$("myphoto").trigger("click");
	});
	
	//사진불러오면 이미지 미리보기
	$("#myphoto").click(function(){
		
	
	});
	//중복체크 버튼시 아이디 체크
	
	
	//2번째 비밀번호 입력시 체크
	$("#pass2").keyup(function(){
		
		var p1=$("#pass").val();
		var p2=$(this).val();
		
		if(p1==p2)
			$("span.passsuccess").text("ok");
		else
			$("span.passsuccess").text("");
	});
	
});
</script>
</head>
<body>
<button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
<form action="insert" method="post" enctype="multipart/form-data">
<table class="table table-bordered" style="width: 600px;">
	<caption><h4 class="alert alert-danger"><b>회원가입</b></h4></caption>
	<tr>
		<td style="width: 250px;" rowspan="4" align="center">
			<input type="file" name="myphoto" id="myphoto" style="display: none;">
			<button type="button" class="btn btn-info" id="btnphoto">사진선택</button>
			<br>
			<img id="showimg">
		</td>
		<td>
			<div class="form-inline">
				<input required="required" type="text" placeholder="아이디입력" id="id" name="id" class="form-control" style="width: 120px;">
				<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">중복체크</button>&nbsp; 
				<span class="idsuccess" style="width: 60px; color: green;"></span>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="form-inline">
				<input type="password" style="width: 120px;" class="form-control" name="pass" id="pass" placeholder="숫자4자리" required="required">
				<input type="password" style="width: 120px;" class="form-control" name="pass2" id="pass2" placeholder="숫자4자리" required="required">
					<span class="passsuccess" style="width: 60px; color: green;"></span>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="name" class="form-control" style="width: 150px;"
			placeholder="이름을 입력하세요" required="required">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="email" class="form-control" style="width: 200px;"
			placeholder="이메일을 입력하세요" required="required">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="form-inline">
				<input type="text" name="hp" placeholder="-없이 핸드폰 번호만 입력" class="form-control"
				style="width: 220px;" required="required">
				<input type="text" name="addr" placeholder="주소를 입력하세요" class="form-control"
				style="width: 340px;" required="required">
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit" class="btn btn-info" style="width: 200px;">회원가입</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>