<%@page import="com.test.jsp.Score"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex20_el.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>EL</h1>
	<%
		int a = 10;	
		pageContext.setAttribute("b", 20);
		request.setAttribute("c", 30);
	%>
	
	<h2>표현식</h2>
	<div>a : <%= a %></div>
	<div>b : <%= pageContext.getAttribute("b") %></div>
	<div>c : <%= request.getAttribute("c") %></div>
	
	<!-- 
	EL은 일반자원(지역변수, 멤버변수)은 출력할 수 없다. 
	내장 객체(pageContext, request, session, application : 순서대로)안에 있는 데이터만 전용으로 출력하는 표현식 -> EL
	-->
	
	<h2>EL</h2>
	<div>a : ${a}</div>
	<div>b : ${pageContext.getAttribute("b")}</div>
	<div>c : ${request.getAttribute("c")}</div>
	
	<div>a : ${a}</div>
	<div>b : ${b}</div>
	<div>c : ${c}</div>
	
	<hr>
	
	<h3>EL연산기능</h3>
	<div>b + 10 = ?</div>
	<div>b + 10 = <%= (int)pageContext.getAttribute("b") + 10 %></div>
	<div>b + 10 = ${b} + 10</div>
	<div>b + 10 = ${b + 10}</div>
	<hr>
	<div>b + 10 = ${b + 10}</div>
	<div>b - 10 = ${b - 10}</div>
	<div>b * 10 = ${b * 10}</div>
	<div>b / 10 = ${b / 10}</div>
	<div>b % 10 = ${b % 10}</div>
	<div>b mod 10 = ${b mod 10}</div>
	<hr>
	<div>b &gt; 10 = ${b > 10}</div>
	<div>b &gt; 10 = ${b gt 10}</div>

	<div>b &lt; 10 = ${b < 10}</div>
	<div>b &lt; 10 = ${b lt 10}</div>
	<hr>
	<div>b &gt;= 10 = ${b >= 10}</div>
	<div>b &gt;= 10 = ${b ge 10}</div>

	<div>b &lt;= 10 = ${b <= 10}</div>
	<div>b &lt;= 10 = ${b le 10}</div>
	<hr>
	<div>b == 20 = ${b == 20}</div>
	<div>b == 20 = ${b eq 20}</div>

	<div>b != 20 = ${b != 20}</div>
	<div>b != 20 = ${b ne 20}</div>
	<hr>
	<!-- 
		쇼트 서킷(short-circuit) 
		: 논리연산자에서 좌측 피연산자만으로도 결과가 확정된 경우, 굳이 우측 피연산자까지 확인하지 않는 기능
		- true && true
		- false && true 
		- true || false
	-->
	<div>${true && true}</div>
	<div>${true || true}</div>
	<div>${!true}</div>
	<div>${false and true}</div>
	<div>${true or false}</div>
	<div>${not true}</div>
	<hr>
	<div>%{b > 0 ? "양수" : "음수"}</div>
	<hr>
	<div>${"문자열".equals("문자열")}</div>
	<div>${"문자열" == "문자열"}</div>
	<div>${"문자열" == '문자열'}</div>
	<hr>

	<%
		HashMap<String, Integer> score = new HashMap<String, Integer>();
		score.put("kor", 100);
		score.put("eng", 90);
		score.put("math", 80);
		
		pageContext.setAttribute("score", score);
	%>
	<h3>객체 출력(HashMap)</h3>
	<div>국어 : <%= score.get("kor") %></div>
	<div>영어 : <%= score.get("eng") %></div>
	<div>수학 : <%= score.get("math") %></div>
	
	<div>국어 : ${score.get("kor")}</div>
	<div>영어 : ${score["eng"]}</div>
	<div>영어 : ${score.math}</div>
	<hr>


	<h3>객체 출력(일반 객체)</h3>
	<%
		Score score = new Score();
		score.setKor(100);
		score.setEng(90);
		score.setMath(80);
		
		pageContext.setAttribute("score", score);
	%>
	<div>국어 : <%= score.getKor() %></div>
	<div>국어 : ${score.getKor(()}</div>
	<div>국어 : ${score.kor}</div>
	<div>국어 : ${score["kor"]}</div>
	
	
	<div>총점 : ${score.kor}</div>
	
	<% 
		//****무언가와 충돌
		//부모와 자식 충돌 -> 자식
		//넓은 범위와 좁은 범위 충돌 -> 좁은 범위
		//두리뭉실과 구체적 충돌 -> 구체적
	
		//EL -> 순차적 탐색
		//pageContext -> request -> session -> application(생명주기 순서대로)
		pageContext.setAttribute("color", "tomato");
		request.setAttribute("color", "gold");
		session.setAttribute("color", "cornflowerblue");
		application.setAttribute("color", "yellowgreen");
	%>
	
	<%-- <div style="background-color : ${color};">${color}</div> --%>
	<div style="background-color : ${requestScope.color};">${requestScope.color}</div>
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>