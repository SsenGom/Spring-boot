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
  <div class="loginform" style="margin: 50px 50px;">
     <form action="loginprocess" method="post">
       <table class="table table-bordered" style="width: 400px;">
          <caption><b>회원로그인</b></caption>
            <tr>
              <th style="width: 120px; background-color: #fff0f5">아이디</th>
                <td>
                  <input type="text" name="id" class="form-control" required="required"
                  placeholder="아이디" style="width: 150px;" value="${sessionScope.saveok==null?"":sessionScope.myid }">  <!-- //세션 스코프로 벨류값을 줘 세션에 저장하는 값 남기기 -->
                </td>
            </tr>
            <tr>
              <th style="width: 120px; background-color: #fff0f5">비밀번호</th>
                <td>
                  <input type="password" name="pass" class="form-control" required="required"
                  placeholder="비밀번호" style="width: 150px;">
                </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked" }>아이디 저장 <!-- 아이디 저장 세이브 ok가 비어있다면 공란 아니면 check -->
                   <button type="submit" class="btn btn-info" style="width: 150px;">회원로그인</button>
              </td>
            </tr>
       </table>
     </form>
  </div>
</body>
</html>