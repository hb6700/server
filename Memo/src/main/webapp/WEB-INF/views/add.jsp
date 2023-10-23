<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<%@ include file="/inc/asset.jsp" %>
	<form method="POST" action="/memo/addok.do">
		<table class="vertical">
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<th>MEMO</th>
				<td><textarea name="memo" required class="full"></textarea></td>
			</tr>
		</table>
		<div>
			<input type="button" value="return" onclick="location.href='/memo/list.do';">
			<input type="submit" value="write">
		</div>
	</form>
	
	<script>
	
	</script>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>