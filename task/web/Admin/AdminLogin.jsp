<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/12/10
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/AdminController?method=Login" method="post">
        账号：<input type="text" name = "AdminId">
        密码：<input type="password">
        <input type="submit">
    </form>
</body>
</html>
