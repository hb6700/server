<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.todo.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//editod.jsp
	//1. 데이터 가져오기(seq)
	//2. DB작업 -> update
	//3. 피드백
	
	//1. 
	String seq = request.getParameter("seq");
	
	//2.
	Connection conn = null;
	PreparedStatement stat = null;
	try {
		conn = DBUtil.open();
		/* String sql = "";
		String sql = "update tblTodo set state = 'y' where seq = ?"; */
		String sql = "";
		sql = "select state from tblTodo where seq = ?";
		
		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);
		
		ResultSet rs = stat.executeQuery();
		String state = "";
		
		if(rs.next()) {
			state = rs.getString("state");
		}
		
		if (state.equals("n")){
	         state = "y";      
	      } else {
	         state = "n";
	      }
		
		sql = "update tblTodo set State = ? where seq = ?";
				
		stat = conn.prepareStatement(sql);
		stat.setString(1, state);
		stat.setString(2, seq);
		
		int result = stat.executeUpdate();
		
		//3.
		if(result == 1){
			response.sendRedirect("list.jsp");
		} else{
			out.println("<script>");
			out.println("alert<script>");
			out.println("location.href = list.jsp");
			out.println("</script>");
		}
		stat.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- template.jsp -->
<%@ include file="inc/asset.jsp" %>

<style>

</style>
</head>
<body class="narrow">
	<%@  include file = "inc/header.jsp" %>
	
	<script>
	
	</script>

</body>
</html>