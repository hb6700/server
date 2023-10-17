<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<!-- ex07 -->
	<h1>데이터 전송하기</h1>
	<h2>폼태그 + POST방식으로 보내기</h2>
	<form method="POST" action="ex07_ok.jsp">
		<div>
			문자 : <input type="text" name="txt">
		</div>
		<div>
			숫자 : <input type="text" name="num">
		</div>
		<div>
			<input type="submit" name="send">
		</div>
	</form>
	
	<h2>폼태그 + GET방식으로 보내기</h2>
	<form method="GET" action="ex07_ok.jsp">
		<div>
			문자 : <input type="text" name="txt">
		</div>
		<div>
			숫자 : <input type="text" name="num">
		</div>
		<div>
			<input type="submit" value="send" name="send">
		</div>
	</form>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>