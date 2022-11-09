<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Jua&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">

/* body{
    font-family: 'Jua';
    font-size: 1.3em;
} */
div.layout div {
	border: 0px solid gray;
}

div.layout div.title {
	position: absolute;
	top: 10px;
	left: 350px;
	height: 100px;
}

div.layout div.menu {
	position: absolute;
	top: 150px;
	left: 250px;
	height: 130px;
}



div.layout div.main {
	position: absolute;
	left: 300px;
	top: 300px;
	width: 1000px;
	height: 500px;
}
</style>
</head>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title2" />
		</div>
		<div class="menu">
			<tiles:insertAttribute name="menu2" />
		</div>
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>