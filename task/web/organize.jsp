<%@ page import="java.util.List" %>
<%@ page import="VO.User" %>
<%@ page import="VO.CheckInfo" %>
<%@ page import="Controller.DeleteInfo" %>
<%@ page import="Controller.CheckInfoController" %><%--
  Created by IntelliJ IDEA.
  User: 程心媛
  Date: 2020/11/25
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Unicorn Organizer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.jscrollpane.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.css" />
    <style>
        td {
            text-align:center; /*设置水平居中bai*/
            vertical-align:middle;/*设置垂直du居中*/
        }
    </style>

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-44987299-1', 'bootstrap-hunter.com');
        ga('send', 'pageview');
    </script>
<body onload="initAJAX();" data-color="orange" class="flat" >

<!-- 主体 -->
<div id="wrapper">
    <!--此处为界面的主通栏  -->
    <div id="header">
        <h1><a href="#">会议组织者</a></h1>
        <a id="menu-trigger" href="#"><i class="fa fa-bars"></i></a>
    </div>
    <!--此处为界面的主通栏  -->

    <!-- 用户通栏部分 -->
    <div id="user-nav">
        <ul class="btn-group">
            <li class="btn" ><a title="" href="#">
                <i class="fa fa-user"></i>
                <% int userId =Integer.parseInt(request.getParameter("userId"));%>
                <span class="text" onclick="index()">用户<%=userId%></span>
            </a>
            </li>
            <li class="btn"><a title="" href="#">
                <i class="fa fa-cog"></i>
                <span class="text"><span onclick="setPassword()">设置</span></span>
            </a>
            </li>
            <li class="btn">
                <a title="" href="login.jsp">
                    <i class="fa fa-share"></i>
                    <span class="text">登出</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- 用户通栏部分 -->

    <!-- 改变颜色、样式 -->
    <div id="switcher">
        <div id="switcher-inner">
            <h3>Theme Options</h3>
            <h4>Colors</h4>
            <p id="color-style">
                <a data-color="orange" title="Orange" class="button-square orange-switcher" href="#"></a>
                <a data-color="turquoise" title="Turquoise" class="button-square turquoise-switcher" href="#"></a>
                <a data-color="blue" title="Blue" class="button-square blue-switcher" href="#"></a>
                <a data-color="green" title="Green" class="button-square green-switcher" href="#"></a>
                <a data-color="red" title="Red" class="button-square red-switcher" href="#"></a>
                <a data-color="purple" title="Purple" class="button-square purple-switcher" href="#"></a>
                <a href="#" data-color="grey" title="Grey" class="button-square grey-switcher"></a>
            </p>
            <h4 class="visible-lg">Layout Type</h4>
            <p id="layout-type">
                <a data-option="flat" class="button" href="#">Flat</a>
                <a data-option="old" class="button" href="#">Old</a>
            </p>
        </div>
        <div id="switcher-button">
            <i class="fa fa-cogs"></i>
        </div>
    </div>
    <!-- 改变颜色、样式 -->



    <!-- 侧边栏信息 -->
    <div id="sidebar">
        <div id="search">
            <input type="text" placeholder="Search here..."/>
            <button type="submit" class="tip-right" title="Search">
                <i class="fa fa-search"></i>
            </button>
        </div>
        <ul>
            <%--            onclick="showUser()"--%>
            <li class="active "><a href="#"><i class="fa fa-home" ></i> <span onclick="showUserID()">个人信息</span></a></li>
            <li class="submenu">
                <a href="#"><i class="fa fa-flask"></i> <span>会议中心</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="ShowMyMeetingInfo()">我创建的会议</span></a></li>
                    <li><a href="#"><span onclick="ShowMeetingInfo()">会议大厅</span></a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-th-list"></i> <span>管理会议</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="CreateMeeting()">创建会议</span></a></li>
                    <li><a href="#"><span onclick="UpdateMyMeetingInfo()">修改会议相关信息</span></a></li>
                    <li><a href="#"><span onclick="CheckAttendInfo()">查看参会人员信息</span></a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-th-list"></i> <span>预约信息查看</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="ShowOrderHotelInfo()">酒店预约信息</span></a></li>
                    <li><a href="#"><span onclick="ShowOrderCarInfo()">司机预约信息</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 侧边栏信息 -->

    <!-- 以上模块不再变动 -->

    <!-- 个人信息侧边栏信息 -->
    <div id="content">
        <div id="content-header" class="mini">
            <h1>欢迎访问(｡･ω･｡)ﾉ♡<span id="name" style="font-family: 华光行楷_CNKI"></span></h1>
            <ul class="mini-stats box-3">
                <li>
                    <div class="left sparkline_bar_good"><span>2,4,9,7,12,10,12</span></div>
                    <div class="right">
                        <strong>2020</strong>
                        Fighting!
                    </div>
                </li>
                <li>
                    <div class="left sparkline_bar_neutral"><span>10,12,14,16,20,22</span></div>
                    <div class="right">
                        <strong>2021</strong>
                        Come on！
                    </div>
                </li>
                <li>
                    <div class="left sparkline_bar_bad"><span>3,5,9,7,12,20,10</span></div>
                    <div class="right">
                        <strong>2022</strong>
                        Keep going!
                    </div>
                </li>
            </ul>
        </div>
        <!-- 小导航栏 -->
        <div id="breadcrumb">
            <a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
            <a href="#" class="current">Information</a>
        </div>
        <!-- 小导航栏 -->
        <div class="container-fluid">
            <!-- 打算做成网络跳转，不浪费这个icon -->
            <div class="row">
                <div class="col-xs-12 center" style="text-align: center;">
                    <ul class="quick-actions">
                        <li>
                            <a href="https://www.aliyun.com/" target="_blank">
                                <i class="icon-cabinet"></i>
                                阿里云
                            </a>
                        </li>
                        <li>
                            <a href="https://www.jd.com/" target="_blank">
                                <i class="icon-shopping-bag"></i>
                                购物
                            </a>
                        </li>
                        <li>
                            <a href="http://www.dangdang.com/" target="_blank">
                                <i class="icon-book"></i>
                                当当书城
                            </a>
                        </li>
                        <li>
                            <a href="https://www.csdn.net/"target="_blank">
                                <i class="icon-database"></i>
                                CSDN
                            </a>
                        </li>
                        <li>
                            <a href="https://mail.qq.com/" target="_blank">
                                <i class="icon-mail"></i>
                                QQ邮箱
                            </a>
                        </li>
                        <li>
                            <a href="https://www.baidu.com/" target="_blank">
                                <i class="icon-piechart"></i>
                                百度
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 打算做成网络跳转，不浪费这个icon -->
            <br />
            <!-- 第二部分 -->
            <div class="row">
                <div class="col-xs-12"id="ineer">

                </div>
            </div>
            <!-- 第二部分 -->
        </div>
    </div>
    <!-- 个人信息侧边栏信息 -->

    <!-- 页脚部分，做成一致 -->
    <div class="row">
        <div id="footer" class="col-xs-12">
            2020 - 2021 &copy; Kernel. Brought to <span id="info" ><%=userId%></span> by <a href="#">MyWork</a>
        </div>
    </div>
    <!-- 页脚部分，做成一致 -->
</div>>
<div id ='try'></div>
<!-- 主体 -->
<script src="${pageContext.request.contextPath}/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/commons.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/unicorn.js"></script>
<script src="${pageContext.request.contextPath}/js/unicorn.dashboard.js"></script>


</body>
<script type="text/javascript" language="JavaScript">
    function showUserID(){
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/findByUserId?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = " ";
                for(var i in obj) {
                    listHtml += "<div class=\"alert alert-info\">\n" +
                        "                        Welcome in the <strong>information of you</strong>. Don't forget to check all the details!\n" +
                        "                        <a href=\"#\" data-dismiss=\"alert\" class=\"close\">×</a>\n" +
                        "                    </div>" +
                        " <div class=\"widget-box\"  >"+
                        "<div class=\"widget-title\">\n" +
                        "<span class=\"icon\"><i class=\"fa fa-signal\"></i></span>\n" +
                        " <h5>个人资料</h5>" +
                        "</a>"+
                        "  </div>\n" +
                        " </div>"+
                        "<div class=\"widget-content\">\n" +
                        "     <div class=\"row\">\n" +
                        "     <div class=\"col-xs-12 col-sm-4\">"+
                        "   <ul class=\"site-stats\">"+
                        "       <li><div class=\"cc\"><i class=\"fa fa-user\"></i> <strong>"+obj[i].userId +"</strong> <small>您的id</small></div></li>" +
                        "       <li><div class=\"cc\"><i class=\"fa fa-arrow-right\"></i> <strong>"+obj[i].username+"</strong><small>您的姓名</small></div></li>" +
                        "       <li class=\"divider\"></li>" +
                        "       <li><div class=\"cc\"><i class=\"fa fa-arrow-right\"></i> <strong>"+obj[i].phone+"</strong> <small>您的手机号</small></div></li>" +
                        "       <li><div class=\"cc\"><i class=\"fa fa-tag\"></i><strong>"+obj[i].password+"</strong> <small>您的密码,妥善保存</small></div></li>" +
                        "       <li><div class=\"cc\"><i class=\"fa fa-arrow-right\"></i> <strong>"+obj[i].department+"</strong><small>您的部门</small></div></li>" +
                        "       <li><div class=\"cc\"><i class=\"fa fa-arrow-right\"></i> <strong>"+obj[i].email+"</strong><small>您的邮箱</small></div></li>" +
                        "       </ul>"+
                        "       </div>" +
                        "<div class=\"col-xs-12 col-sm-8\">\n" +
                        " <div>" +
                        "   <img src='use.jpg' width=\"319\" height=\"361\">" +
                        " </div>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>"
                }
                document.getElementById("ineer").innerHTML=listHtml;
            } else {
                alert("错了");
            }
        }
    }
    function ShowMeetingInfo() {
        xmlhttp =new XMLHttpRequest();
        xmlhttp.open("get","${pageContext.request.contextPath}/ShowMeetingInfo",true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200){
                var date = xmlhttp.responseText;
                //var obj = JSON.parse(date);
                var obj =eval("("+date+")");
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>会议信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>会议ID</th>\n" +
                    "                            <th>会议地点</th>\n" +
                    "                            <th>会议人数</th>\n" +
                    "                            <th>会议时间</th>\n" +
                    "                            <th>会议细节</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for(var i in obj){
                    listHtml+="<tr class=\"gradeX\">\n" +
                        "                            <td>"+obj[i].meetingId+"</td>\n" +
                        "                            <td>"+obj[i].place+"</td>\n" +
                        "                            <td>"+obj[i].peopleCount+"</td>\n" +
                        "                            <td>"+obj[i].time+"</td>\n"+
                        "                            <td class=\"center\">"+obj[i].detail+"</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML=listHtml+"</table>"+"</div>"+"</div>";
            }
        }
    }
    function update(){
        window.alert("您已经修改成功 稍等片刻后台会即刻更新");
        UpdateMyMeetingInfo();
    }
    function UpdateMyMeetingInfo() {
        var f=false;
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/MyMeetingInfo?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200){
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var obj =eval("("+date+")");
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>查看会议信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>会议ID</th>\n" +
                    "                            <th>会议地点</th>\n" +
                    "                            <th>会议人数</th>\n" +
                    "                            <th>会议时间</th>\n" +
                    "                            <th>会议细节</th>\n" +
                    "                            <th>更改参会人数</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for(var i in obj){
                    listHtml+="<tr class=\"gradeX\">\n" +
                        "                            <td>"+obj[i].meetingId+"</td>\n" +
                        "                            <td>"+obj[i].place+"</td>\n" +
                        "                            <td>"+obj[i].peopleCount+"</td>\n" +
                        "                            <td>"+obj[i].time+"</td>\n"+
                        "                            <td class=\"center\">"+obj[i].detail+"</td>\n" ;
                      listHtml+=  "<td><form action = \"${pageContext.request.contextPath}/UpdateMyMeetingInfo\" method=\"post\" target=\"_blank\">\n" +
                         "   请输入会议Id：<input name=\"meetingId\" id=\"meetingId\" type=\"text\"size=\"3\">"+
                         "&nbsp;&nbsp;&nbsp"+
                        "  请输入更改量 ：<input name=\"peopleCount\" id=\"peopleCount\"  type=\"text\"size=\"3\">"+
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
                        "<input type=\"submit\" value=\"修改\"size=\"10\" onblur=\"update()\" >" +
                        "</form>"+
                        "</td>\n"+
                        "</tr>"
                        f=true;
                }

                document.getElementById("ineer").innerHTML=listHtml+"</table>"+"</div>"+"</div>";
            }
        }
        return f;
    }
    function deletes_(userid,meetingid){
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        var sendStr="userId="+userid+"&meetingId=" +meetingid;
        var url="${pageContext.request.contextPath}/DeleteInfo";
        xmlhttp.open("post",url,true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send(sendStr);
        window.alert("您已经删除成功 稍等片刻后台会即刻更新");
        CheckAttendInfo();
    }
    function ShowMyMeetingInfo(){
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/MyMeetingInfo?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>您的创建的会议信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>会议ID</th>\n" +
                    "                            <th>会议地点</th>\n"+
                    "                            <th>会议人数</th>\n" +
                    "                            <th>会议时间</th>\n" +
                    "                            <th>会议信息</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].meetingId + "</td>\n" +
                        "                            <td>" + obj[i].place + "</td>\n" +
                        "                            <td>" + obj[i].peopleCount + "</td>\n" +
                        "                            <td>" + obj[i].time + "</td>\n" +
                        "                            <td>" + obj[i].detail + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML=listHtml+"</table>"+"</div>"+"</div>";
            }
            else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }
    function CheckAttendInfo(){
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/CheckInfo?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200){
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>修改会议信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                        <th>会议ID</th>\n" +
                    "                        <th>用户ID</th>\n" +
                    "                            <th>用户名</th>\n" +
                    "                            <th>phone</th>\n" +
                    "                            <th>部门</th>\n" +
                    // "                            <th>email</th>\n" +
                    "                            <th>数据操作</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for(var i in obj){
                    listHtml+="<form action = \"DeleteInfo\" method=\"get\">\n" +
                        "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].meetingId + "</td>\n" +
                        "                            <td>" + obj[i].userId + "</td>\n" +
                        "                            <td>" + obj[i].username + "</td>\n" +
                        "                            <td>" + obj[i].phone + "</td>\n" +
                        "                            <td>" + obj[i].department + "</td>\n" +
                        // "                            <td>" + obj[i].email + "</td>\n" +
                        '<td><button onclick="deletes_(\''+obj[i].userId+'\',\''+obj[i].meetingId+'\')">删除</button>'+"</td>\n"+
                        "                        </tr>"+
                        "</form>";
                }
                document.getElementById("ineer").innerHTML=listHtml+"</table>"+"</div>"+"</div>";
            }
        }
    }
    function ShowOrderCarInfo(){
        xmlhttp =new XMLHttpRequest();
        //console.log("到这");
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/OderCarInfo?userId="+userId,true);
        xmlhttp.send();
        //
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "<div class=\"alert alert-info\">\n" +
                    "                    受理状态中0代表未受理,1代表已经受理,2代表拒绝接单\n" +
                    "                    <a href=\"#\" class=\"close\" data-dismiss=\"alert\">×</a>\n" +
                    "                </div>"+
                    "           <div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>相关车辆信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>MeetingID</th>\n" +
                    "                            <th>用户ID</th>\n" +
                    "                            <th>司机ID</th>\n" +
                    "                            <th>接车地点</th>\n"+
                    "                            <th>接车时间</th>\n" +
                    "                            <th>乘客人数</th>\n" +
                    "                            <th>受理状态</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].meetingId + "</td>\n" +
                        "                            <td>" + obj[i].userId + "</td>\n" +
                        "                            <td>" + obj[i].driverId + "</td>\n" +
                        "                            <td>" + obj[i].place + "</td>\n" +
                        "                            <td>" + obj[i].deadline + "</td>\n" +
                        "                            <td>" + obj[i].people + "</td>\n" +
                        "                            <td>" + obj[i].state + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML=listHtml;
            }
            else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }
    function ShowOrderHotelInfo(){
        xmlhttp =new XMLHttpRequest();
        //console.log("到这");
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/OrderHotelInfo?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml ="<div class=\"alert alert-info\">\n" +
                    "                     受理状态中0代表未受理,1代表已经受理,2代表拒绝接单\n" +
                    "                    <a href=\"#\" class=\"close\" data-dismiss=\"alert\">×</a>\n" +
                    "                </div>"+
                    "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>相关酒店信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>MeetingID</th>\n" +
                    "                            <th>用户ID</th>\n" +
                    "                            <th>酒店ID</th>\n" +
                    "                            <th>受理状态</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].meetingId + "</td>\n" +
                        "                            <td>" + obj[i].userId + "</td>\n" +
                        "                            <td>" + obj[i].hotelId + "</td>\n" +
                        "                            <td>" + obj[i].state + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML=listHtml;
            }
            else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }
    function checkMeetingId(){
        var meetingId =document.getElementById("meetingId").value;
        var xhr = new XMLHttpRequest();
        xhr.open("get","${pageContext.request.contextPath}/CheckMeetingId?meetingId="+meetingId,true);
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        //4.请求体
        xhr.send("meetingId="+meetingId);
        xhr.onreadystatechange = function (){
            //正常交互
            if (xhr.status == 200 && xhr.readyState == 4) {
                //得到返回结果,并利用结果判断用户名是否可用
                var result = xhr.responseText;
                //返回true,可用
                if ("true" ==result) {
                    //判用户名是否为空
                    if (meetingId == null || meetingId == "") {
                        //name_Span.style.color = "red";
                        //name_Span.innerHTML = "用户名不可为空";
                        document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>meetingId不可为空</em>";
                        //document.getElementById("meetingId").focus();
                    } else {
                        //name_Span.style.color = "green";
                        //name_Span.innerHTML = "用户名可用";
                        document.getElementById("name_Span").innerHTML = "<em style = 'color:#008000'>meetingId可用</em>";
                    }
                } else {  //返回false,用户名不可用
                    //name_Span.style.color = "red";
                    //name_Span.innerHTML = "用户名不可用";
                    document.getElementById("name_Span").innerHTML = "<em style = 'color:#EF0000'>mettingId已被使用</em>";
                    document.getElementById("meetingId").focus();
                }
            }
        }

    }
    function create(){

        ShowMyMeetingInfo();
    }
    function  CreateMeeting(){
        var listHtml = "<div class=\"widget-box\">\n" +
            "                <div class=\"widget-title\">\n" +
            "                    <span class=\"icon\">\n" +
            "                        <i class=\"fa fa-th\"></i>\n" +
            "                    </span>\n" +
            "                    <h5>创建会议</h5>\n" +
            "                </div>\n" +
            "</div>";
        listHtml+=
            "<tr><form action = \"${pageContext.request.contextPath}/CreateMeeting\" method=\"get\" target=\"_blank\">\n" +
            "<td>  <div style=\"text-align:center;vertical-align:middel;\"> 请输入会议Id：<input id= \"meetingId\" name=\"meetingId\" type=\"text\" onblur=\"checkMeetingId()\" ><br></td>"+
            "<tr><span id=\"name_Span\"><p style=\"font-family:'新宋体','楷体';\">meetingId</p></span></tr>\n" +
            " <td ><div style=\"text-align:center;vertical-align:middel;\">  请输用户ID ：<input name=\"userId\" type=\"text\"><br><br></td>"+
            " <td ><div style=\"text-align:center;vertical-align:middel;\">  请输会议地点 ：<input name=\"place\" type=\"text\"><br><br></td>"+
            "  <td> <div style=\"text-align:center;vertical-align:middel;\">请输参会人数 ：<input name=\"peopleCount\" type=\"text\" ><br><br></td>"+
            "  <td ><div style=\"text-align:center;vertical-align:middel;\"> 请输会议时间 ：<input name=\"time\" type=\"text\" ><br><br></td>"+
            " <td>  <div style=\"text-align:center;vertical-align:middel;\">请输会议内容 ：<input name=\"detail\" type=\"text\"><br><br></td>"+
            "<td ><div style=\"text-align:center;vertical-align:middel;\"><input type=\"submit\" value=\"创建\"size=\"10\" onblur=\"create()\"></td>" +
            "</form>\n"+
            "</tr>";


        document.getElementById("ineer").innerHTML=listHtml;//+"</table>";//+"</div>"+"</div>";
        //     }
        // }
    }
    function ShowMyMeetingInfo(){
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","${pageContext.request.contextPath}/MyMeetingInfo?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>您的创建的会议信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>会议ID</th>\n" +
                    "                            <th>会议地点</th>\n"+
                    "                            <th>会议人数</th>\n" +
                    "                            <th>会议时间</th>\n" +
                    "                            <th>会议信息</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].meetingId + "</td>\n" +
                        "                            <td>" + obj[i].place + "</td>\n" +
                        "                            <td>" + obj[i].peopleCount + "</td>\n" +
                        "                            <td>" + obj[i].time + "</td>\n" +
                        "                            <td>" + obj[i].detail + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML=listHtml+"</table>"+"</div>"+"</div>";
            }
            else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }


    function index() {
        var listHtml ="<div style=\"text-align: center;\" >\n" +
            "\t\t\t<div class=\"text-primary\">\n" +
            "\t\t\t\t<h2 >欢迎来到 MeetingWeb 会议管理员信息服务系统</h1>\n" +
            "\t\t\t</div>\n" +
            "\t\t\t<span style=\"font-size: 22px;font-family: 楷体;\">本系统由 <b>打工人</b> 小组共同完成</span>\n" +
            "\t\t\t<br>\n" +
            "\t\t\t<p class=\"text-success\" style=\"font-size: 20px;font-family: 宋体;\">\n" +
            "\t\t\t\t<span>  </span>\n" +
            "\t\t\t\t您现在所处的界面是会议组织者界面，您可以在本界面中查找、修改、创建会议。\n" +
            "\t\t\t\t<br>\n" +
            "\t\t\t\t同时，您查看自己的信息，删除修改参会者的信息。\n" +
            "\t\t\t\t<br>\n" +
            "\t\t\t\t我们还为您提供了个性化日历功能，可以按照您的需要安排事务处理顺序。\n" +
            "\t\t\t</p>\n" +
            "\t\t\t<p class=\"text-info\" style=\"font-size: 16px;font-family: 宋体;\">\n" +
            "\t\t\t\t祝您使用过程愉快！\n" +
            "\t\t\t\t如在使用过程中出现了任何问题，欢迎致电我们团队。\n" +
            "\t\t\t\t\n" +
            "\t\t\t</p>\n" +
            "\t\t\t<p class=\"text-warning\">联系电话：182****7526</p>\n" +
            "\t\t</div>\n" +
            "\t\t<div style=\"text-align: right;\"><b><i>2020/12/24</i></b></div>"+
            "\t\t<div style=\"text-align: center;\"> \n" +
            "              <img src= \"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1775516601,1815140982&fm=26&gp=0.jpg \" width='300px' height='atuo'>\n" +
            "        </div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function Showname(){
        xmlhttp =new XMLHttpRequest();
        var userId =document.getElementById("info").innerText;
        xmlhttp.open("get","${pageContext.request.contextPath}/findByUserId?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status == 200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = " ";
                for (var i in obj) {
                    listHtml +="<span>"+obj[i].username+"</span>"
                }
                document.getElementById("name").innerHTML = listHtml;
            }
        }
    }
</script>
<script>
    window.onload=index();
    window.onload=Showname();
</script>
</html>