<%@ page import="Service.MeetingInfoService" %>
<%@ page import="VO.Meeting" %>
<%@ page import="Service.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<body>
<main class="content">
    <div class="row">
        <div class="card flex-fill">
            <nav class="navbar navbar-expand navbar-light navbar-bg">
                <div class="col-md-1">
                    <h5 class="card-title mb-0">会议管理</h5>
                </div>
                <div class="col-md-7">
                    <form class="form-inline d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                            <input type="text" class="form-control" placeholder="Search…" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn" type="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search align-middle"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!--    搜索框-->
                </div>
            </nav>
            <table class="table table-hover my-0">
                <thead>
                <tr>
                    <th class="d-none d-xl-table-cell">账号</th>
                    <th class="d-none d-xl-table-cell">用户名</th>
                    <th class="d-none d-xl-table-cell">电话号码</th>
                    <th class="d-none d-md-table-cell">电子邮箱</th>
                    <th class="d-none d-md-table-cell"></th>
                </tr>
                </thead>
                <tbody>
                <%
                    UserService userService = new UserService();
                    List<User> userList = userService.findAll();
                    for(int i=0;i<userList.size();i++){
                %>
                <tr>
                    <td class="d-none d-xl-table-cell"><%=userList.get(i).getUserId()%></td>
                    <td class="d-none d-xl-table-cell"><%=userList.get(i).getUsername()%></td>
                    <td class="d-none d-xl-table-cell"><%=userList.get(i).getPhone()%></td>
                    <td class="d-none d-xl-table-cell"><%=userList.get(i).getEmail()%></td>
                    <td class="d-none d-xl-table-cell" ><a href="javascript:ChangeUser(<%=userList.get(i).getUserId()%>)">修改密码</a></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>