<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//인증받지 못한 사용자가 직접 접근하면 내쫒아야 함
 	if(session.getAttribute("auth")==null){
 		out.println("<html>");
 		out.println("<head>");
 		out.println("<meta charset='UTF-8'>");
 		out.println("</head");
 		out.println("<body>");
 		out.println("alert(''Only members can access  this page)");
 		out.println("locationhref == '..index/jsp';");
 		out.println("</script>");
 		out.println("</body>");
 		out.println("</html>");
//  		out.close("");			//더 이상 아래의 코드진행을 하지 않고 중단한다.

//  		response.sendRedirect("../index.jsp");
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member.jsp</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style></style>
</head>
<body>
	<h1>Member Only</h1>
	
<!-- 	Only members can access this site -->
	
	<!-- https://releases.jquery.com/ -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- https://github.com/pinnpublic/cdn -->
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
</body>
</html>