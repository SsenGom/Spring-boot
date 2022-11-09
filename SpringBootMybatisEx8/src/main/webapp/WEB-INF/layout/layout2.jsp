<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.layout div.menu{
	position: absolute;
	top: 100px;
	left: 300px;
	height: 100px;
}
div.layout div.main{
	position: absolute;
	top: 200px;
	left: 300px;
}
</style>
</head>
<body style="background-color: #fffsee">
 <div  class="layout">
	<div class="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
 </div>
</body>
</html>