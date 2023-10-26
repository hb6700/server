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
	<!-- ex03.jsp -->
	<div>
		<input type="text" id="txt1">
		<input type="button" value="button1" id="btn1">
	</div>
	<div>
		<input type="text" id="txt2">
		<input type="button" value="button2" id="btn2">
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	<script>
		$('#btn1').click(function(){
// 			$('#btn1').click();
// 			jQuery.ajax();
			const hong = {
				name: '홍길동',
				age: 20,
				hello: function(){
					
				}
					
			};
				
			$.ajax({
				//ajax.open('GET', 'do') -> 페이지 요청 정보 
				type: 'GET',
				url: '/ajax/ex03data.do',
				
				async: false,		//true(비동기), false(동기)
				
				//ex03data.do?name=홍길동
				data: 'name=홍길동',
				
				//onreadystatechange + readyState(4) + status(200)
				success: function(result){
					//result == ajax.responseText
					$('#txt1').val(result);
					
				},
				error: function(a, b, c){
					console.log(a, b, c);
				}
			});
		});
	</script>
</body>
</html>