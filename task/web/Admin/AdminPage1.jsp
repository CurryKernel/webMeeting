<%@ page import="Service.MeetingInfoService" %>
<%@ page import="VO.Meeting" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.UserService" %>
<%@ page import="VO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">
    <link rel="shortcut icon" href="../img/icons/icon-48x48.png" />
    <link href="../css/admin.css" rel="stylesheet">
    <link href="../css/font-awesome.css" rel="stylesheet">
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
                        <th class="d-none d-xl-table-cell">会议编号</th>
                        <th class="d-none d-xl-table-cell">创建人</th>
                        <th class="d-none d-xl-table-cell">会议时间</th>
                        <th class="d-none d-md-table-cell">会议地点</th>
                        <th class="d-none d-md-table-cell"></th>
                    </tr>
                    </thead>
                    <tbody>
<!--                    <tr>-->
<!--                        <td>Project Apollo</td>-->
<!--                        <td class="d-none d-xl-table-cell">01/01/2020</td>-->
<!--                        <td class="d-none d-xl-table-cell">31/06/2020</td>-->
<!--                        <td><span class="badge badge-success">Done</span></td>-->
<!--                        <td class="d-none d-md-table-cell">Vanessa Tucker</td>-->
<!--                    </tr>-->
                    <%
                        MeetingInfoService meetingInfoService = new MeetingInfoService();
                        List<Meeting> meetingInfoList =meetingInfoService.findAll();
                        for(int i=0;i<meetingInfoList.size();i++){
                            UserService userService = new UserService();
                            List<User> user = userService.findByUserId(meetingInfoList.get(i).getUserId());
                    %>
                        <tr>
                            <td class="d-none d-xl-table-cell"><%=meetingInfoList.get(i).getMeetingId()%></td>
                            <td class="d-none d-xl-table-cell"><%=user.get(0).getUsername()%></td>
                            <td class="d-none d-xl-table-cell"><%=meetingInfoList.get(i).getTime()%></td>
                            <td class="d-none d-xl-table-cell"><%=meetingInfoList.get(i).getPlace()%></td>
                            <td class="d-none d-xl-table-cell" href="">编辑</td>
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