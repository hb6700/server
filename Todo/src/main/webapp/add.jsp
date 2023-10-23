<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- template.jsp -->
<%@ include file="inc/asset.jsp" %>

<style>

</style>
</head>
<body class="narrow">
	<%@  include file = "inc/header.jsp" %>
	<form method="post" action="addok.jsp">
		<table>
			<tr>
				<th>할 일</th>
				<td><input type="text" class="long" name="todo" required></td>
			</tr>
		</table>
		<div>
			<button class="back" type="button" onclick="location.href='list.jsp';">return</button>
			<button class="add" >apply</button>
		</div>
	</form>
	<script>
		
	</script>

</body>
</html>