<%@ page import="Service.MeetingInfoService" %>
<%@ page import="VO.Meeting" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.UserService" %>
<%@ page import="VO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">
</head>
<style>
    ul.pagination {
        display: inline-block;
        padding: 0;
        margin: 0;
    }

    ul.pagination li {display: inline;}

    ul.pagination li a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    .pagination li:first-child a {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
    }

    .pagination li:last-child a {
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    ul.pagination li a.active {
        background-color: #3b7ddd;
        color: white;
        border: 1px solid #3b7ddd;
    }

    ul.pagination li a:hover:not(.active) {background-color: #ddd;}
</style>
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
                                <input type="text" class="form-control" placeholder="请输入需要查询的会议编号..." aria-label="Search" id="searchMeetingId" value="<%=request.getParameter("searchId")%>">
                                <div class="input-group-append">
                                    <button class="btn" type="button" onclick='javascript:searchById(1,"")'>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search align-middle"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <!--    搜索框-->
                    </div>
                </nav>

                <table class="table table-hover my-0" >
                    <thead>
                    <tr>
                        <th class="d-none d-xl-table-cell">会议编号</th>
                        <th class="d-none d-xl-table-cell">创建人</th>
                        <th class="d-none d-xl-table-cell">会议时间</th>
                        <th class="d-none d-md-table-cell">会议地点</th>
                        <th class="d-none d-md-table-cell">编辑会议</th>
                        <th class="d-none d-md-table-cell">参加人员</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        String searchId = request.getParameter("searchId");
                        MeetingInfoService meetingInfoService = new MeetingInfoService();
                        List<Meeting> meetingInfoList =meetingInfoService.findByPartOfUserId(searchId);

                        String Sp = request.getParameter("p");
                        int p = Integer.parseInt(Sp);
                        int pageSize = 6;//页面大小
                        int pages = (int)Math.ceil((double)meetingInfoList.size()/pageSize);//总页数
                        int fp,np;//上一页和下一页的页码
                        if(pages == 1){
                            fp = 1;
                            np = 1;
                        }
                        else if(p==1){
                            fp = 1;
                            np = p+1;
                        }
                        else if(p==pages){
                            fp = p-1;
                            np = pages;
                        }else{
                            fp = p-1;
                            np = p+1;
                        }
                        for(int i=(p-1)*pageSize;i<p*pageSize&&i<meetingInfoList.size();i++){
                            UserService userService = new UserService();
                            List<User> user = userService.findByUserId(meetingInfoList.get(i).getUserId());
                    %>
                        <tr>
                            <td class="d-none  d-xl-table-cell"><%=meetingInfoList.get(i).getMeetingId()%></td>
                            <td class="d-none d-xl-table-cell"><%=user.get(0).getUsername()%></td>
                            <td class="d-none d-xl-table-cell"><%=meetingInfoList.get(i).getTime()%></td>
                            <td class="d-none d-xl-table-cell"><%=meetingInfoList.get(i).getPlace()%></td>
                            <td class="d-none d-xl-table-cell">
                                <button type="submit" class="btn btn-primary"onclick='javascript:changeMeeting("<%=meetingInfoList.get(i).getMeetingId()%>")'>编辑</button>
                            </td>
                            <td class="d-none d-xl-table-cell">
                                <button type="submit" class="btn btn-primary"onclick='javascript:searchUserInMeeting("<%=meetingInfoList.get(i).getMeetingId()%>",1,"")'>参加人员</button>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                <ul class="pagination">
                    <li><a href='javascript:selectPages(1,1,"<%=searchId%>")'>首页</a></li>
                    <li><a href='javascript:selectPages(1,"<%=fp%>","<%=searchId%>")'><</a></li>

                    <%//目录只显示5条

                        if(pages<=5){
                            //12pages
                            for(int i = 0;i<pages;i++){
                                if(i+1==p){
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")' class="active"><%=i+1%></a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")'><%=i+1%></a></li>
                    <%
                            }
                        }
                    }
                    else if(p == 1 || p == 2){
                        //12345
                        for(int i = 0;i<5;i++){
                            if(i+1==p){
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")' class="active"><%=i+1%></a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")'><%=i+1%></a></li>
                    <%
                            }
                        }
                    }
                    else if(p == pages || p == pages-1){
                        //56789
                        for(int i = pages-5;i<pages;i++){
                            if(i+1==p){
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")' class="active"><%=i+1%></a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")'><%=i+1%></a></li>
                    <%
                            }
                        }
                    }
                    else{
                        for(int i = p-3;i<p+2;i++){
                            if(i+1==p){
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")' class="active"><%=i+1%></a></li>
                    <%
                    }
                    else{
                    %>
                    <li><a href='javascript:selectPages(1,"<%=i+1%>","<%=searchId%>")'><%=i+1%></a></li>
                    <%
                                }
                            }
                        }
                    %>

                    <li><a href='javascript:selectPages(1,"<%=np%>","<%=searchId%>")'>></a></li>
                    <li><a href='javascript:selectPages(1,"<%=pages%>","<%=searchId%>")'>尾页</a></li>
                </ul>
            </div>
        </div>
    </main>
</body>
</html>