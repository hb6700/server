<%--
  Created by IntelliJ IDEA.
  User: oseunghyeon
  Date: 2023/10/18
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--ex09.jsp--%>

<h1>버튼 만들기</h1>
<form method="POST" action="ex09_ok.jsp">
<table class="vertical">
  <tr>
    <th>너비(px)</th>
    <td><input type="number" name="width" min="50" max="30" step="10" value="100"> </td>
  </tr>

  <tr>
    <th>높이(px)</th>
    <td><input type="number" name="height" min="50" max="30" step="10" value="50"></td>
  </tr>

  <tr>
    <th>텍스트</th>
    <td><input type="text" name="text" value="Button"></td>
  </tr>

  <tr>
    <th>배경색</th>
    <td><input type="color" name="backcolor" value="#FFFFFF" style="height: 40px;"></td>
  </tr>

  <tr>
    <th>글자색</th>
    <td><input type="color" name="textcolor" value="#000000" style="height: 40px;"></td>
  </tr>

  <tr>
    <th>글자 크기(px)</th>
    <td><input type="number" name="fontsize" min="10" max="50" value="16"></td>
  </tr>

  <tr>
    <th>버튼 개수</th>
    <td><input type="number" name="ea" min="1" max="20" value="1"></td>
  </tr>

</table>

</form>

<div>
  <input type="submit" value="만들기">
</div>
</body>
</html>
