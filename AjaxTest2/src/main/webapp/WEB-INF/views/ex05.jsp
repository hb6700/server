<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	<style>
	
	</style>
</head>
<body>
	
	<h1>AJAX 데이터 보내는 방법 </h1>
	<form id="form1">
		<table class="vertical">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" value="홍길동"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" id="age" value=20></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" id="gender1" value="m" checked>남자</td>
				<td><input type="radio" name="gender" id="gender2" value="f">여자</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address" value="서울시 강남구 역삼동"></td>
			</tr>
			<tr>
				<th>전화</th>
				<td><input type="text" name="tel" id="tel" value="010-1234-5678"></td>
			</tr>
		</table>
		
		<div>
			<input type="button" value="check" id="btn">
		</div> 
	</form>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		$('#btn').click(function(){
			/*
			//단일 데이터 전송
			$.ajax({
				type: 'POST',
				url: 'ajax/ex05data.do',
				data: 'name=' + $('#name').val(),
// 				success: function(result){
					
// 				}
				error: function(a, b, c){
					console.log(a, b, c);
				}
			});
			*/
// 			alert('name=' + $('#name').val(), 'age=' + $('#age').val());

// 			$.ajax({
// 				type: 'POST',
// 				url: 'ajax/ex05data.do',
// 				//data: 'key=value&key=value&key=value'
// 				data: 'name=' + $('#name').val(), 'age=' + $('#age').val(),
// 				error: function(a, b, c){
// 					console.log(a, b, c);
// 				}
// 			});
			
			
			//남자선택?여자선택?
// 			$('input[name=gender]:checked').hide();
// 			alert($('input[name=gender]:checked').val());
			
// 			$.ajax({
// 				type: 'POST',
// 				url: 'ajax/ex05data.do',
// 				data: 'name=' + $('#name').val() + 
// 					  'age=' + $('#age').val() +
// 					  'gender=' + $('input[name=gender]:checked').val() + 
// 					  'address=' + $('#address').val() +
// 					  'tel=' + $('#tel').val(),
// 				error: function(a, b, c){
// 					console.log(a, b, c);
// 				}
// 			});


// 			$.ajax({
// 				type: 'POST',
// 				url: 'ajax/ex05data.do',
// 				//data: 'name=홍길동&age=20'
// 				data: { name: $('#name').val(), 
// 						age: $('#age').val(), 
// 						gender: $('#gender').val(), 
// 						address: $('#address').val(), 
// 						tel: $('#tel').val()
// 				},
// 				error: function(a, b, c){
// 					console.log(a, b, c);
// 				}
// 			});
			
			
			
// 			alert($('#form1').serialize());
// 			console.log($('#form1').serialize());

			//1. <form>태그 사용
			//2. <input name="key"> > 태그마다 name을 반드시 명시
			
			
			$.ajax({
				type: 'POST',
				url: 'ajax/ex05data.do',
				//data: 'name=홍길동&age=20'
				data: $('#form1').serialize(),
				error: function(a, b, c){
					console.log(a, b, c);
				}
			});



		});
	</script>
</body>
</html>