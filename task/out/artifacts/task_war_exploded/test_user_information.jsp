<%--
  Created by IntelliJ IDEA.
  User: 柯淇文
  Date: 2020/11/26
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/task/findByUserId" method="get">
    <fieldset>
        <legend>登录</legend>
        <p>
            用户名：<input type="text" name="userId">
        </p>
        <p>
            密码：<input type="password" name="password">
        </p>
        <input type="submit" value="提交">
    </fieldset>
</form>
</body>
</html>
