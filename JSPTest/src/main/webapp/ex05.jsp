<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";
	int age = 20;
	String txt = "<input type='text'>";
	
	String color = "cornflowerBlue";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05</title>
<style>
	div{
		color:"color"
	}
</style>
</head>
<body>
	<h1>스크립틀릿 + 표현식</h1>
	<div>이름 : <%= name %></div>
	<div>나이 : <%= age %></div>
	<div><%= txt %></div>
	<div><input type="text" value="<%= color %>"></div>
	<input type="button" value="button" id="btn1">
	<hr>
	<%-- <div><%= sum(30, 40) %></div> --%>
	<script>
		document.getElementById('btn1').onclick = function() {
			alert('<%= color %>');
		};
	</script>
</body>
</html>