<%@ page import="Service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <script></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icons/icon-48x48.png" />
    <title>管理员</title>
    <link href="${pageContext.request.contextPath}/css/admin.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!--ajax跳转页面-->
    <script type="text/javascript">
        function setAjax() {
            var xmlHttp = false;
            if(window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
                try{
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }catch (e){
                    try{
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }catch (e){
                        window.alert("不支持ajax")
                    }
                }
            }
            return xmlHttp;
        }


        function selectPages(i,p,searchId) {
            var xmlHttp=setAjax();
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    if(xmlHttp.status == 200) {
                        var data = xmlHttp.responseText;
                        document.getElementById("content").innerHTML = data;
                    }
                }
            }
            xmlHttp.open("POST", "${pageContext.request.contextPath}/AdminController?method=selectPages&i="+i+"&p="+p+"&searchId="+searchId+"&AdminId="+"<%=request.getParameter("AdminId")%>", true);
            xmlHttp.send();
            //动态刷新主页面
        }


        function changeMeeting(MeetingId) {
            var xmlHttp=setAjax();
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    if(xmlHttp.status == 200) {
                        var data = xmlHttp.responseText;
                        document.getElementById("content").innerHTML = data;
                    }
                }
            }
            xmlHttp.open("POST", "${pageContext.request.contextPath}/AdminController?method=changeMeeting&MeetingId="+MeetingId+"&AdminId="+"<%=request.getParameter("AdminId")%>", true);
            xmlHttp.send();
        }


        //保存修改的会议信息
        function saveChangeMeeting() {
            var meetingId = $('#MeetingId').val();
            var detail = $('#MeetingDetail').val();
            var time = $('#MeetingTime').val();
            var place = $('#MeetingPlace').val();
            var xmlHttp=setAjax();
            xmlHttp.open("POST", "${pageContext.request.contextPath}/AdminController?method=saveChangeMeeting&meetingId="+meetingId+"&detail="+detail+"&time="+time+"&place="+place, true);
            xmlHttp.send();
            alert("会议信息已修改")
        }


        //查看参加会议的人员
        function searchUserInMeeting(meetingId,p,searchId) {
            var xmlHttp=setAjax();
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    if(xmlHttp.status == 200) {
                        var data = xmlHttp.responseText;
                        document.getElementById("content").innerHTML = data;
                    }
                }
            }
            xmlHttp.open("POST", "${pageContext.request.contextPath}/AdminController?method=searchUserInMeeting&meetingId="+meetingId+"&p="+p+"&searchId="+searchId, true);
            xmlHttp.send();
        }


        //删除参加会议的某个人员
        function deleteUserInMeeting(userId,userName,meetingId) {
            var confirmMsg = "是否要将用户: " + userName + " 从会议编号为: " + meetingId + "的会议中移除？"
            var r = confirm(confirmMsg);
            if(r==true){
                var xmlHttp=setAjax();
                xmlHttp.open("POST", "${pageContext.request.contextPath}/AdminController?method=deleteUserInMeeting&userId="+userId+"&meetingId="+meetingId, true);
                xmlHttp.send();
                var msg = "已将用户: " + userName + " 从会议中移除，请重新加载此页面"
                alert(msg)
            }

        }

        //判断两次密码是否相同
        function check() {
            var pass1=document.getElementById("inputPasswordNew");
            var pass2=document.getElementById("inputPasswordNew2");
            if(pass1.value!=""){
                if(pass1.value!=pass2.value){
                    document.getElementById("explain1").innerText="";
                    document.getElementById("explain2").innerText="两次密码不相同";
                    document.getElementById("inputPasswordNew").value="";
                    document.getElementById("inputPasswordNew2").value="";
                }
                else{
                    document.getElementById("explain1").innerText="两次密码相同";
                    document.getElementById("explain2").innerText="";
                }
            }
            else{
                document.getElementById("explain1").innerText="";
                document.getElementById("explain2").innerText="密码为空";
            }
        }


        // 提示信息
        function sendMessage(){
            var msg="<%=request.getAttribute("msg")%>";
            if(msg !="null"){
                alert(msg);
            }
        }


        //重置用户密码
        function resetUserPassword(UserId) {
            var confirmMsg = "是否要重置账户为: " + UserId +" 的密码？"
            var r = confirm(confirmMsg);
            if(r==true){
                var xmlHttp=setAjax();
                xmlHttp.open("POST", "${pageContext.request.contextPath}/AdminController?method=resetUserPassword&UserId="+UserId, true);
                xmlHttp.send();
                var msg = "将账户为: "+UserId+" 的用户密码重置为: 111111 ";
                alert(msg)
            }
        }


        //查询用户或会议
        function searchById(i,meetingId) {
            if(i=="1"){
                //查询会议ID
                var meetingId = document.getElementById("searchMeetingId").value;
                selectPages(i,1,meetingId)
            }
            else if(i=="2"){
                //查询用户ID
                var userId = $('#searchUserId').val();
                selectPages(i,1,userId)
            }
            else if(i=="3"){
                var userId = $('#searchUserId2').val();
                searchUserInMeeting(meetingId,1,userId)
            }
        }
    </script>
</head>
<body onload="selectPages(1,1,'');sendMessage()">
<div class="wrapper" id="main">
    <nav id="sidebar" class="sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand">
                <span class="align-middle">管理员</span>
            </a>

            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a class="sidebar-link" href='javascript:selectPages(1,1,"")'>
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">会议管理</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href='javascript:selectPages(2,1,"")'>
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">用户管理</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href='javascript:selectPages(3,1,"")'>
                        <i class="align-middle" data-feather="settings"></i> <span class="align-middle">账户管理</span>
                    </a>
                </li>
            </ul>

        </div>
    </nav>
    <!--以上为侧边栏-->
    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle d-flex">
                <i class="hamburger align-self-center"></i>
            </a>

            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                            <i class="align-middle" data-feather="settings"></i>
                        </a>

                        <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                            <span class="text-dark" id="IdText"><%=request.getParameter("AdminId")%></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href='javascript:selectPages(1,1,"")'><i class="align-middle mr-1" data-feather="sliders"></i>会议管理</a>
                            <a class="dropdown-item" href='javascript:selectPages(2,1,"")'><i class="align-middle mr-1" data-feather="user"></i>用户管理</a>
                            <a class="dropdown-item" href='javascript:selectPages(3,1,"")'><i class="align-middle mr-1" data-feather="settings"></i>账号管理</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/Admin/AdminLogin.jsp">登出</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <!--上边框-->
        <main id = "content">
        </main>
    </div>
</div>
</body>

</html>