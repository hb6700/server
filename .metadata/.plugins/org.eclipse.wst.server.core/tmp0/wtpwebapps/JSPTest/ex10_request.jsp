<%--
  Created by IntelliJ IDEA.
  User: oseunghyeon
  Date: 2023/10/18
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>request</h1>

<p>요청 URL : <%=request.getRequestURI()%></p>
<p>요청 서버 도메인:<%=request.getServerName()%></p>
<p>요청 방식: <%=request.getMethod()%></p>
<p>클라이언트 주소(IP): <%=request.getRemoteAddr()%></p>
<p>컨텍스트 경로: <%=request.getContextPath()%></p>

<a href="ex09.jsp">9번 예제</a>
<a href="/abcd/ex09.jsp.jsp">9번 예제</a>
<a href="<%=request.getContextPath()%>/ex09.jsp">9번 예제</a>



</body>
</html>
