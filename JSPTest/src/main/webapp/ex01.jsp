<!-- Jsp 지시자 : page 지시자 -->
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01</title>
</head>
<body>
	<!-- ex01 -->
	<%
		Calendar now = Calendar.getInstance();
	%>
	
	<p>현재시간 : <%= String.format("%tT", now) %></p>
	
	<%@ include file="inc/copyright.jsp" %>
</body>
</html>
