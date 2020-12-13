<%@ page import="VO.Meeting" %>
<%@ page import="Service.MeetingInfoService" %>
<%@ page import="Service.UserService" %>
<%@ page import="VO.User" %><%--
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
                            <div class="card-header"></div>
                            <div class="card-body">
                                <%
                                    String MeetingId = request.getParameter("MeetingId");
                                    MeetingInfoService meetingInfoService = new MeetingInfoService();
                                    UserService userService = new UserService();
                                    Meeting meeting = meetingInfoService.findByPartOfUserId(MeetingId).get(0);
                                    User builder = userService.findByUserId(meeting.getUserId()).get(0);
                                %>
                                <form name="ChangeUser">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="MeetingId">会议编号 </label>
                                            <input type="text" class="form-control" id="MeetingId" value="<%=meeting.getMeetingId()%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="BuilderId">创建人</label>
                                            <input type="text" class="form-control" id="BuilderId" value="<%=builder.getUsername()%>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="MeetingDetail">会议详情</label>
                                        <input type="text" class="form-control" id="MeetingDetail" value="<%=meeting.getDetail()%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="MeetingTime">会议时间</label>
                                        <input type="text" class="form-control" id="MeetingTime" value="<%=meeting.getTime()%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="MeetingPlace">会议地点</label>
                                        <input type="text" class="form-control" id="MeetingPlace" value="<%=meeting.getPlace()%>">
                                    </div>
                                </form>
                                <button class="btn btn-primary" onclick="javascript:saveChangeMeeting()">保存</button>
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