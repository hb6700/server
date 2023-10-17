<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex08</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>컨트롤 입력 + 전송</h1>
	<form method="POST" action="ex08_ok.jsp">
		<table class="vertical">
			<tr>
				<th>Text BOX</th>
				<td><input type="text" name="txt1"></td>
			</tr>
			<tr>
				<th>Secret password</th>
				<!-- PASSWORD특성상 한글 입력 ㄴㄴ 사실 복붙으로는 가능 근데 안댐 -->
				<!-- 되는데? 아니 안되요 됐는데? 아니요 없어요 그냥 -->
				<td><input type="password" name="txt2"></td>
			</tr>
			<tr>
				<th>text X n</th>
				<td><textarea name="txt3"></textarea></td>
			</tr>
			<tr>
				<th>CHECK BOX</th>
				<td><input type="checkbox" name="cb1"></td>
			</tr>
			<tr>
				<th>CHECK BOX</th>
				<td>
					<h3>취미 선택</h3>
					<label><input type="checkbox" name="cb2" value="read">read</label>
					<label><input type="checkbox" name="cb3" value="exercise">exercise</label>
					<label><input type="checkbox" name="cb4" value="coding">coding</label>
				</td>
			</tr>
			<tr>
				<th>CHECK BOX</th>
				<td>
					<h3>취미 선택2</h3>
					<label><input type="checkbox" name="cb5" value="read">read</label>
					<label><input type="checkbox" name="cb5" value="exercise">exercise</label>
					<label><input type="checkbox" name="cb5" value="coding">coding</label>
				</td>
			</tr>
			<tr>
				<th>RADIO BUTTON</th>
				<td>
					<h3>성별</h3>
					<label><input type="radio" name="rb" value="male" checked>male</label>
					<label><input type="radio" name="rb" value="female">female</label>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="send">
		</div>
	</form>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>