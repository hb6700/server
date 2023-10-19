<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("a");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex19_scope_2.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>Second Page</h1>
	<%-- <p>1. 지역변수 a : <%= a %></p> --%>
	<p>1. 지역변수 a : <%= a %></p>
	<%-- <p>2. 멤버변수 a : <%= b %></p> --%>
	<p>3. pageContext c : <%= pageContext.getAttribute("c") %></p>
	<p>4. request d : <%= request.getAttribute("d") %></p>
	<p>5. session e : <%= request.getAttribute("e") %></p>
	<p>6. application f : <%= request.getAttribute("f") %></p>
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>