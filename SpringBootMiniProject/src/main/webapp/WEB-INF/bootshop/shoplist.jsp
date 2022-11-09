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
<div class="alert alert-success" style="width: 800px; margin: 50px;">
   <b>총 ${totalCount }개의 상품이 있습니다</b>
</div>

<table class="table table-bordered" style="width: 800px; margin: 50px;">
  <caption><span style="float: right;"><button type="button" class="btn btn-dafault"
  onclick="location.href='shopform'">상품추가</button></span></caption>
  
  <c:forEach var="dto" items="${list }">
    <tr>
      <td width="400" rowspan="4">
         <c:if test="${dto.photoname!=null }">
            <img alt="" src="../photo/${dto.photoname }" style="width: 200px;">
         </c:if>
         <c:if test="${dto.photoname==null }">
            <img alt="" src="../image/noimage.png" style="width: 200px;">
         </c:if>
      </td>
      <td>
         <b>상품명:${dto.sangpum }</b>
      </td>
    </tr>
    
    <tr>
      <td>
        <b>단가: <fmt:formatNumber value="${dto.price }" type="currency"/></b>
      </td>
    </tr>
    
    <tr>
      <td>
        <b>단가: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/></b>
      </td>
    </tr>
    
    <tr>
      <td>
        <button type="button" class="btn btn-info btn-sm" 
        onclick="location.href='updateform?num=${dto.num}'">수정</button>
        
         <button type="button" class="btn btn-danger btn-sm" 
        onclick="location.href='delete?num=${dto.num}'">삭제</button>
      </td>
    </tr>
  </c:forEach>
  
  
</table>
</body>
</html>