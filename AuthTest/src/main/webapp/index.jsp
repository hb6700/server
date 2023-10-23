<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>인증/허가</h1>
	<% if(session.getAttribute("auth") == null) { %>
		<fieldset>
			<input type="button" value="login" onclick="location.href='auth.login.jsp';">
		</fieldset>
	<% } else { %>
		<fieldset>
			<input type="button" value="logout" onclick="location.href='auth.logoutok.jsp';">
		</fieldset>
		<div class="message">
			<div>아이디 : <%= session.getAttribute("auth") %></div>		
			<div>이름 : <%= session.getAttribute("name") %></div>		
			<div>등급 : <%= session.getAttribute("lv").toString().equals("1" ? "customer" : "Administrator")) %></div>
		</div>
	<% } %>
	
	<hr>
	<% if(session.getAttribute("auth") != null) { %>
		<div><a href="member/member.jsp">Member Page</a></div>
	<% } else {%>
		<div><a href="#!" onclick="alert('Only members can access this site')">Member Page</a></div>
	<% } %>
	
	<% if(session.getAttribute("auth") != null && session.getAttribute("lv").toString().equals("2")) { %>
		<div><a href="admin/admin.jsp">Admin Page</a></div>
	<% } %>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>