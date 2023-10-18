<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex13_out</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>out : multiplication table</h1>
	<% int dan = 2; %>
	
	<h2>구구단 - 스크립틀릿 + 표현식</h2>
	<% for (int i=1 ;  i<=9 ; i++) { %>
	<div><%= dan %> X <%= i %> = <%= dan*i %></div>	
	<% } %>	
	
	
	<h2>구구단 - 스크립틀릿 + OUT</h2>
	<%
		for(int i=1; i<=9; i++) {
			out.println(String.format("<div>%d X %d= %d</div>", dan, i, dan*i));
		}
	%>
	
	<h1>방문 카운트</h1>
	<div>count : <%= session.getAttribute("count") %></div>
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>