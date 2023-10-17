<%@page import="com.test.jsp.MyMath"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//무슨 변수
	//1. 멤버변수
	//2. 지역변수
	int a = 10;		//지역변수 > 어떠너 메소드 영역?
	
	/*
	public void test(){
		
	}
	*/
	
	MyMath m = new MyMath();
%>
<%!
	int b = 20;		//지역변수(X), 클래스 멤버 변수(O)
	
	//이 메소드의 호출 영역(이 JSP에서만(여기서만 사용 가능)
	public int sum(int a, int b){
		return a + b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06</title>
</head>
<body>
	<div><%= 10 + 20 %></div>
	<div><%= sum(10, 20) %></div>
	<div><%= m.sum(10, 20) %></div>
</body>
</html>