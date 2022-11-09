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
<script type="text/javascript">
	$(function(){
		
		$(".btnnewphoto").click(function(){
			
			$("#newphoto").trigger("click");
		});
		
		$("#newphoto").change(function(){
			var num=$(this).attr("num");
			//consol.log(num);
			
			var form=new FormData();
			form.append("photo",$("#newphoto")[0].files[0]); //이름 , 밸류값 삽입 /선택한 1개만 추가
			form.append("num",num);
			
			console.dir(form);
			
			$.ajax({
				type:"post",
				dataType:"html",
				data:form,
				url:"updatephoto",
				processData:false,
				contentType:false,
				success:function(){
					location.reload();
				}
				
			});
		});
		
		$("#deleteme").click(function(){
			var num=$(this).attr("num");
			//consol.log(num);
				
			$.ajax({
				type:"get",
				dataType:"html",
				data:{"num":num},
				url:"deleteme",
				success:function(){
					location.reload();
				}
				
			});
		});
		
	});
</script>
</head>
<body>
<div style="margin: 50px;">
<table class="table table-bordered" style="width: 800px;">
   <c:forEach  var="dto" items="${list }">
   <c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
    <tr>
      <td style="width: 250px;" align="center" rowspan="5">
         <img alt="" src="../photo/${dto.photo }" width="230" height="230" border="1">
         <br><br>
         <input type="file" id="newphoto" style="display: none;" num=${dto.num }> <!-- 사진수정시 호출 -->
         <button type="button" class="btn btn-info btnnewphoto">사진수정</button>
      </td>
      <td style="width: 300px;">회원명: ${dto.name } </td>
      <td rowspan="5" align="center"  style="width: 200px; vertical-align: middle;">
      <button type="button" class="btn btn-default">수정</button>
      <button type="button" class="btn btn-default" num=${dto.num } id="deleteme">탈퇴</button>
      </td>
    </tr>
    <tr>
       <td>아이디: ${dto.id }</td>
    </tr>
    <tr>
       <td>이메일: ${dto.email }</td>
    </tr>
    <tr>
       <td>핸드폰: ${dto.hp }</td>
    </tr>
    <tr>
       <td>주소: ${dto.addr }</td>
    </tr>
  </c:if>  
  </c:forEach>
</table>
</div>

</body>
</html>