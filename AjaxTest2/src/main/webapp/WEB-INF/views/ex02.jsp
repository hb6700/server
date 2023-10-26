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
	<div>
		<input type="text" id="txt1" value="${count}">
		<input type="button" value="button1" id="btn1">
	</div>
	<div id="msg" class="message"></div>
	<div>
		<input type="text" id="txt2">
		<input type="button" value="button2" id="btn2">
	</div>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	
	<script>
	$('#btn1').click(function(){
		//페이지(데이터 요청)
		//1. 브라우저를 통해 요청했을 때 :
		//2. ajax를통해서 요청 했을 때 : 
		
		
		//Ajax
		//1. 순수 자바크립트
		//2. jQuery -> 개량
		
		//Ajax 요청 + 응답 > Ajax객체
		const ajax = new XMLHttpRequest();		//서버와데이터를 송수신
		//ReadyState
		//http://www.tcpschool.com/ajax/ajax_server_response
		//ajax 객체의 상태(현재 서버와의 통신 상)
		// 1. UNSENT (숫자 0) : XMLHttpRequest 객체가 생성됨.
		// 2. OPENED (숫자 1) : open() 메소드가 성공적으로 실행됨.
		// 3. HEADERS_RECEIVED (숫자 2) : 모든 요청에 대한 응답이 도착함.
		// 4. LOADING (숫자 3) : 요청한 데이터를 처리 중임.
		// 5. DONE (숫자 4) : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.
		
		ajax.onreadystatechange = function(){
			if(ajax.readyState == 4 && ajax.status == 200){
				//readystate change
	// 			$('#msg').html(ajax.responseText);
				
				
				$('#msg').append('<div>readyState : ' + ajax.readyState + '</div>');
				
				//상태코드 
				//서버가 요청에 응답할 때의 상태
				//200 OK -> 모든 상태가 정상
				//404 Not Found -> 
				//405 Method Not Allowed -> get-post 일치 에러
				//408 Request Timeout
				//500 Internal Server Error
				$('#msg').append('<div>status : ' + ajax.status + '</div>');
				
				
				$('#msg').append('<div> + responseText' + ajax.responseText + '</div>');
				$('#msg').append('<hr>');
				
				if() {
					
				}else{
					
				}
			}
			
		};
		//<form method="GET" action="주소">
// 		ajax.open('GET', '서버쪽 프로그램 주소')
		ajax.open('GET', '/ajax/ex02data.do');
		ajax.send();		//서버와 연결해

	})
	</script>
</body>
</html>