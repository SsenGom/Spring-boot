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
		//전체선택하면 체크박스 선택,해제
		$("#allcheck").click(function(){
			
			//체크값 얻기
			var chk=$(this).is(":checked");
			console.log(chk);
			
			//전체를 각 글앞의 체크에 일괄 전달
			$(".del").prop("checked",chk);
		});
		
		$("#btnmemberdel").click(function(){
			
			
			//체크한 인원수 구하기
			var cnt=$(".del:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("먼저 삭제할 회원을 선택해주세요");
				return;
			}
			
			$(".del:checked").each(function(i,elt){
				
				var num=$(this).attr("num");
				console.log(num);
				
				$.ajax({
					type:"get",
					dataType:"html",
					url:"delete",
					data:{"num":num},
					success:function(){
						alert("삭제성공");
						//새로고침
						location.reload();
					}
				});
				
				
				
			});
		});
	});
</script>
</head>
<body>
<h3 class="alert alert-info">${count }명의 회원이 가입하셨습니다</h3>
<c:if test="${sessionScope.loginok!=null and sessionScope.myid =='admin' }">

<hr>
<table class="table table-bordered" style="width: 1000px;">
  <caption><b>전체 회원명단</b></caption>
    <tr style="background-color: #f0ffff	">
       <th style="width: 50px;">번호</th>
       <th style="width: 180px;">이름</th>
       <th style="width: 100px;">아이디</th>
       <th style="width: 120px;">핸드폰</th>
       <th style="width: 160px;">주소</th>
       <th style="width: 150px;">이메일</th>
       <th style="width: 150px;">가입일</th>
       <th style="width: 80px;"><input type="checkbox" id="allcheck">삭제</th>
       
       
    </tr>
    
    <c:forEach var="dto"  items="${list }" varStatus="i">
      <tr>
        <td>${i.count }</td>
        <td>
          <img alt="" src="../photo/${dto.photo }" style="width: 30px; height: 30px;">&nbsp;&nbsp;
          ${dto.name }
        </td>
        <td> ${dto.id }</td>
        <td> ${dto.hp }</td>
        <td> ${dto.addr }</td>
        <td> ${dto.email }</td>
        <td> <fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd HH:mm"/></td>
        <td><input type="checkbox" class="del" num=${dto.num }></td><!-- 클래스 지정후 각각의 번호를 읽어오게 num값 설정 -->
      </tr>
    
    </c:forEach>
</table>
<button type="button" class="btn btn-danger btn-sm" style="margin-left: 930px;"
id="btnmemberdel">Delete</button>
</c:if>
</body>
</html>