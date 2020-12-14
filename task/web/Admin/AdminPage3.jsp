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
                    <div class="tab-pane fade show active" id="AdminPassword" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">修改密码</h5>

                                <%  String path = request.getContextPath();
                                    String url = path+"/AdminController?method=ChangeAdminPass&AdminId="+request.getParameter("AdminId");%>
                                <form action=<%=url%> method="post">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputPasswordCurrent">输入旧密码</label>
                                            <input type="password" class="form-control" id="inputPasswordCurrent" name="inputPasswordCurrent">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputPasswordNew">输入新密码</label>
                                            <input type="password" class="form-control" id="inputPasswordNew">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div type="text" id="explain1" style="color:green" readonly></div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputPasswordNew2">确认新密码</label>
                                            <input type="password" class="form-control" id="inputPasswordNew2" name="inputPasswordNew2" onblur="javascript:check()">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div type="text" id="explain2" style="color:red" readonly></div>
                                        </div>
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