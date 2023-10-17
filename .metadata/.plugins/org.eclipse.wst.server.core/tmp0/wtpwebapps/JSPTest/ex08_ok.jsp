<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST -> 한글 인코딩
	request.setCharacterEncoding("utf-8");
	
	//텍스트 박스
	//1. 입력O > 입력값 반환
	//2. 컨트롤O + 입력X> 빈문자열 반환
	//3. 컨트롤X (key 오류) > null 반환
	String txt1 = request.getParameter("txt1");
	
	//System.out.println(txt1 == null);		//false
	//System.out.println(txt1.equals(""));	//false
	
	
	//암호박스
	String txt2 = request.getParameter("txt2");
	
	//다중텍스트
	String txt3 = request.getParameter("txt3");
	txt3 = txt3.replace("\r\n", "<br>");	//여러줄 엔터
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>RESULT</h1>
	<h2>text BOX</h2>
	<div><%= txt1 %></div>
	
	<h1>RESULT</h1>
	<h2>PASSWORD</h2>
	<div><%= txt2 %></div>
	
	<h1>RESULT</h1>
	<h2>TEXTs</h2>
	<div><%= txt3 %></div>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>