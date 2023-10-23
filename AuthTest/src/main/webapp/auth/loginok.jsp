<%@page import="com.test.auth.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//loginok.jsp
	//1. 데이터  가져오기(id, pw)
	//2. DB작업 -> select
	//3-1. 존재O -> 인증티켓 발급
	//3-2. 존재X -> 아무일도 일어나지 않음
	//4. 피드백(로그인 성공여부 반환)
	
	//1.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2. 
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	try{
		conn = DBUtil.open();
		String sql = "select * from tblUser where id = ? and pw = ?";
		
		stat = conn.prepareStatement(sql);
		stat.setString(1, id);
		stat.setString(2, pw);
		
		rs = stat. executeQuery();
		
		if(rs.next()){
			System.out.println("login success");
			//로그인 성공 -> 인증티켓 발견 -> 세션 안에 로그인을 성공했다는 표시를 저장!!(세션 -> 전역변수, 개인공간)
			session.setAttribute("auth", id);				//인증티켓
			
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("lv", rs.getString("lv"));
			
			response.sendRedirect("../index.jsp");
		}else{			
			System.out.println("login failed");
			response.sendRedirect("login.jsp");			
		}
		
		rs.close();
		stat.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginok</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>