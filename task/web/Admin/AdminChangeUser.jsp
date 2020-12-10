<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/12/9
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<body>
<main class="content">
    <div class="container-fluid p-0">

        <div class="row">
            <div class="col-md-9 col-xl-10">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="account" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <%
                                    String UserId=request.getParameter("UserId");
                                %>
                                <h5 class="card-title mb-0">正在修改的账号为:<%=UserId%></h5>
                            </div>
                            <div class="card-body">
                                <form name="ChangeUser" action="${pageContext.request.contextPath}/AdminController?method=ChangeUser" method="post">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputUserName">用户名</label>
                                            <input type="text" class="form-control" id="inputUserName" name="inputUserName" placeholder="用户名">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputUserPassword">修改密码</label>
                                            <input type="text" class="form-control" id="inputUserPassword" name="inputUserPassword" placeholder="修改密码">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div type="text" id="explain1" style="color:green" readonly></div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="confirmPassword">确认密码</label>
                                            <input type="text" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="确认密码" onBlur="javascript:check()">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div type="text" id="explain2" style="color:red" readonly></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Email">
                                    </div>

                                    <div class="form-group">
                                        <label for="inputDepartment">部门</label>
                                        <input type="text" class="form-control" id="inputDepartment" name="inputDepartment" placeholder="部门">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputUserPhone">电话</label>
                                        <input type="text" class="form-control" id="inputUserPhone" name="inputUserPhone" placeholder="电话">
                                    </div>
                                    <button type="submit" class="btn btn-primary">保存</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</main>

</body>
</html>