<%--
  Created by IntelliJ IDEA.
  User: oseunghyeon
  Date: 2023/10/18
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String width=request.getParameter("width");
    String height=request.getParameter("height");
    String text=request.getParameter("text");
    String backcolor=request.getParameter("backcolor");
    String textcolor=request.getParameter("textcolor");
    String fontsize=request.getParameter("fontsize");
    String ea=request.getParameter("ea");

    int count =Integer.parseInt(ea);
%>

<html>
<head>
    <title>Title</title>
    <style>
        .btn{
            width: <%=width%>px;
            height: <%=height%>px;
            background-color: <%=backcolor%>;
            color: <%=textcolor%>;
            font: <%=fontsize%>px;
        }
    </style>
</head>
<body>
<h1>결과</h1>

<div>
    <% for(int i=0; i< 10; i++){ %>
    <button class="btn"><%= text %></button>
    <% } %>
</div>

<script></script>
</body>
</html>
