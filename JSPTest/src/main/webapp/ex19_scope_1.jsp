<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//첫번재 페이지(데이터 생성) -> (전달) -> 두번째 페이지(데이터 사용)
	
	//1. 지역변수 -> 실패
	int a = 10;
	
	//3. pageContext객체 -> 실패
	pageContext.setAttribute("c", 30);	
	
	//4.request -> 실패
	request.setAttribute("d", 40);
	
	//5. session 객체
	session.setAttribute("e", 50);
		
	//6. application 객체
	application.setAttribute("f", 60);
	
	//pageContext.forward("ex19_scope_2.jsp");
	//response.sendRedirect("ex19_scope_2.jsp");
%>
<%!

	//2. 멤버변수 > 실패
	int b = 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex19_scope_1.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>First Page</h1>
	
	<!-- <a href="ex19_scope_2.jsp">second page</a> -->
	<a href="ex19_scope_2.jsp?a=<%= a %>">second page</a>
	<hr>
	<input type="button" value="second page" id="btn1">
	<hr>
	<form method="GET" action="ex19_scope_2.jsp">
		<input type="hidden" name="a" value="<%= a %>">
		<input type="submit" value="second page">
	</form>
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	
	<script>
		$('#btn1').click(function() {
			location.href = 'ex19_scope_2.jsp?a=<%= a %>';
		})
	</script>
</body>
</html>