<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex16_jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<!-- 
		파일 업로드 설정
		1. <input type="file">
		2. <form method="POST">
		3. <form enctype="">
			- application/x-www-form-urlencode -> form 태그에서 전송하는 데이터가 문자열이다.
			- multipart/form-data -> 문자열 + 비문자열 동시 전송			
	 -->
	<h1>파일 업로드</h1>
	<form method="POST" action="ex16_ok.jsp" enctype="multipart/form-data">
		<table class="vertical">	
			<tr>
				<th>이름</th>
				<td><input type=text" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type=number" name="age" min="1" max="100"></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="attach"></td>
			</tr>
		</table>
		<div>
			<input type="submit" value="regist">
		</div>
	</form>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>