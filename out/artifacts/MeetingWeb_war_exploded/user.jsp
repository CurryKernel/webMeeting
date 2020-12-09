<%@ page import="java.util.List" %>
<%@ page import="VO.User" %><%--
  Created by IntelliJ IDEA.
  User: 柯淇文
  Date: 2020/11/25
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Unicorn User</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <link rel="stylesheet" href="css/jquery.jscrollpane.css" />
    <link rel="stylesheet" href="css/unicorn.css" />
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
</head>
<body onload="initAJAX();" data-color="grey" class="flat" >

<!-- 主体 -->
<div id="wrapper">
    <!--此处为界面的主通栏  -->
    <div id="header">
        <h1><a href="./user.jsp">Unicorn User</a></h1>
        <a id="menu-trigger" href="#"><i class="fa fa-bars"></i></a>
    </div>
    <!--此处为界面的主通栏  -->

    <!-- 用户通栏部分 -->
    <div id="user-nav">
        <ul class="btn-group">
            <li class="btn" ><a title="" href="#">
                <i class="fa fa-user"></i>
                <span class="text">用户</span>
            </a>
            </li>
            <li class="btn"><a title="" href="#">
                <i class="fa fa-cog"></i>
                <span class="text">设置</span>
            </a>
            </li>
            <li class="btn">
                <a title="" href="login.html">
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
                <a href="#"><i class="fa fa-flask"></i> <span >会议中心</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="ShowMyMeetingInfo()">我的会议</span></a></li>
                    <li><a href="#"><span onclick="MjoinInfo()">加入会议</span></a></li>
                    <li><a href="#"><span onclick="ShowMeetingInfo()">会议大厅</span></a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-th-list"></i> <span>酒店预约</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="ShowHotelInfo()">酒店信息</span></a></li>
                    <li><a href="#"><span onclick="HorderInfo()">酒店预约</span></a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-th-list"></i> <span>驾车预约</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="ShowDriverInfo()">司机信息</span></a></li>
                    <li><a href="#"><span onclick="CorderInfo()">车辆预约</span></a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-file"></i> <span>我的预约</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#"><span onclick="ShowMyOrderHotelInfo()">酒店预约信息</span></a></li>
                    <li><a href="#"><span onclick="ShowMyOrderCarInfo()">车辆预约信息</span></a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-file"></i> <span>日期事务管理</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#" ><span onclick="Calendar()">日历</span></a></li>
                    <li><a href="#" ><span onclick="Things()">事务个性化</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 侧边栏信息 -->

    <!-- 以上模块不再变动 -->

    <!-- 个人信息侧边栏信息 -->
    <div id="content">
        <div id="content-header" class="mini">
            <h1>欢迎访问(｡･ω･｡)ﾉ♡</h1>
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
                            <a href="www.baidu.com" target="_blank">
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
            <% int userId =Integer.parseInt(request.getParameter("userId"));%>
            2020 - 2021 &copy; Kernel. Brought to <span id="info" ><%=userId%></span> by <a href="#">MyWork</a>
        </div>
    </div>
    <!-- 页脚部分，做成一致 -->
</div>>
<!-- 主体 -->
<script src="js/excanvas.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.flot.min.js"></script>
<script src="js/jquery.flot.resize.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/commons.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.dashboard.js"></script>


</body>
<script language="JavaScript">
    function showUserID(){
        //alert("ni");
        xmlhttp =new XMLHttpRequest();
        //console.log("到这");
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","/task/findByUserId?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            // console.log("到这");
            // xmlhttp.readyState == 4
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                // console.log(obj);
                // console.log(date);
                var listHtml = " ";
                for(var i in obj) {
                    listHtml += "<div class=\"alert alert-info\">\n" +
                        "                        Welcome in the <strong>information of you</strong>. Don't forget to check all the details!\n" +
                        "                        <a href=\"#\" data-dismiss=\"alert\" class=\"close\">×</a>\n" +
                        "                    </div>" +
                        " <div class=\"widget-box\"  >"+
                        "<div class=\"widget-title\">\n" +
                        "<span class=\"icon\"><i class=\"fa fa-signal\"></i></span>\n" +
                        " <h5>个人资料</h5>\n" +
                        " <div class=\"buttons\">\n" +
                        "  <a href=\"user.jsp\" class=\"btn\">" +
                        "  <i class=\"fa fa-refresh\"></i> " +
                        "  <span class=\"text\">更新</span></a>\n" +
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
                        "   <img src='https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2274662792,161237713&fm=26&gp=0.jpg'>" +
                        " </div>"+
                        "</div>"+
                        "       </div>"+
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
        xmlhttp.open("get","/task/ShowMeetingInfo",true);
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

    function ShowHotelInfo() {
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("get", "/task/ShowHotelInfo", true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status == 200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                //var obj =eval("("+date+")");
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>酒店信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>酒店ID</th>\n" +
                    "                            <th>酒店描述</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].hotelId + "</td>\n" +
                        "                            <td>" + obj[i].description + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML = listHtml + "</table>" + "</div>" + "</div>";
            }
        }
    }

    function ShowDriverInfo(){
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("get", "/task/ShowDriverInfo", true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status == 200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>司机信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>司机ID</th>\n" +
                    "                            <th>司机电话</th>\n"+
                    "                            <th>司机个人描述</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
                        "                            <td>" + obj[i].driverId + "</td>\n" +
                        "                            <td>" + obj[i].phone + "</td>\n" +
                        "                            <td>" + obj[i].description + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML = listHtml + "</table>" + "</div>" + "</div>";
            }
        }
    }

    function ShowMyMeetingInfo(){
        xmlhttp =new XMLHttpRequest();
        //console.log("到这");
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","/task/MyMeetingInfo?userId="+userId,true);
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
                    "                    <h5>您的会议信息</h5>\n" +
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
                        "                            <td>" + (obj[i].place).toString() + "</td>\n" +
                        "                            <td>" + obj[i].peopleCount + "</td>\n" +
                        "                            <td>" + obj[i].time + "</td>\n" +
                        "                            <td>" + obj[i].detail + "</td>\n" +
                        "                        </tr>"
                }
                document.getElementById("ineer").innerHTML=listHtml;
            }
            else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }

    function ShowMyOrderCarInfo(){
        xmlhttp =new XMLHttpRequest();
        //console.log("到这");
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","/task/MyOderCarInfo?userId="+userId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback() {
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "<div class=\"alert alert-info\">\n" +
                    "                    受理状态中0代表未受理,1代表已经受理,2代表拒绝接单\n" +
                    "                    <a href=\"#\" class=\"close\" data-dismiss=\"alert\">×</a>\n" +
                    "                </div>"+
                    "<div class=\"widget-box\">\n" +
                    "                <div class=\"widget-title\">\n" +
                    "                    <span class=\"icon\">\n" +
                    "                        <i class=\"fa fa-th\"></i>\n" +
                    "                    </span>\n" +
                    "                    <h5>您的车辆信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>司机ID</th>\n" +
                    "                            <th>接车地点</th>\n"+
                    "                            <th>接车时间</th>\n" +
                    "                            <th>乘客人数</th>\n" +
                    "                            <th>受理状态</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
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

    function ShowMyOrderHotelInfo(){
        xmlhttp =new XMLHttpRequest();
        //console.log("到这");
        var userId =document.getElementById("info").innerText;
        console.log(userId);
        xmlhttp.open("get","/task/MyOderHotelInfo?userId="+userId,true);
        xmlhttp.send();
        //
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
                    "                    <h5>您的酒店信息</h5>\n" +
                    "                </div>\n" +
                    "                <div class=\"widget-content nopadding\">\n" +
                    "                    <table class=\"table table-bordered table-striped table-hover data-table\">\n" +
                    "                        <thead>\n" +
                    "                        <tr>\n" +
                    "                            <th>酒店ID</th>\n" +
                    "                            <th>受理状态</th>\n" +
                    "                        </tr>\n" +
                    "                        </thead>";
                for (var i in obj) {
                    listHtml += "<tr class=\"gradeX\">\n" +
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

    function HorderInfo(){
        var listHtml = "<div class=\"widget-box\">"+"<div class=\"widget-title\">\n" +
            "<span class=\"icon\">\n" +
            "<i class=\"fa fa-align-justify\"></i>\n" +
            "</span>\n" +
            "                        <h5>预约窗口</h5>\n" +
            "                        <span class=\"label label-danger\">notices</span>\n" +
            "                    </div>"+
            "<div class=\"widget-content nopadding\">\n" +
            "                        <form class=\"form-horizontal\" method=\"get\" action='/task/UserorderHotel' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">酒店ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Hrequired\" id=\"Hrequired\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">用户ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Urequired\" id=\"Urequired\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">居住人数</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Pcount\" id=\"Pcount\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "<div class=\"form-actions\">\n" +
            "                                <input type=\"submit\" value=\"提交\" class=\"btn btn-primary\" >\n" +
            "                            </div>\n" +
            "                        </form>"+
            "</div>"+
            "</div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function CorderInfo(){
        var listHtml = "<div class=\"widget-box\">"+"<div class=\"widget-title\">\n" +
            "<span class=\"icon\">\n" +
            "<i class=\"fa fa-align-justify\"></i>\n" +
            "</span>\n" +
            "                        <h5>预约窗口</h5>\n" +
            "                        <span class=\"label label-danger\">notices</span>\n" +
            "                    </div>"+
            "<div class=\"widget-content nopadding\">\n" +
            "                        <form class=\"form-horizontal\" method=\"get\" action='/task/UserOrderCar' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">司机ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Drequired\" id=\"Drequired\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">用户ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Urequired\" id=\"Urequired\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">乘车人数</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Pcount\" id=\"Pcount\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">乘车地点</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"place\" id=\"place\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">最晚时间</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"deadline\" id=\"deadline\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "<div class=\"form-actions\">\n" +
            "                                <input type=\"submit\" value=\"提交\" class=\"btn btn-primary\"  >\n" +
            "                            </div>\n" +
            "                        </form>"+
            "</div>"+
            "</div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function MjoinInfo(){
        var listHtml = "<div class=\"widget-box\">"+"<div class=\"widget-title\">\n" +
            "<span class=\"icon\">\n" +
            "<i class=\"fa fa-align-justify\"></i>\n" +
            "</span>\n" +
            "                        <h5>选择会议</h5>\n" +
            "                        <span class=\"label label-danger\">notices</span>\n" +
            "                    </div>"+
            "<div class=\"widget-content nopadding\">\n" +
            "                        <form class=\"form-horizontal\" method=\"get\" action='/task/UserJoinMeeting' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">会议ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Mrequired\" id=\"Mrequired\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">用户ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"Urequired\" id=\"Urequired\">\n" +
            "                                </div>\n" +
            "                            </div>"+
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">是否预定用车</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"needCar\" id=\"needCar\" placeholder='1代表需要,2代表不需要'>\n" +
            "                                </div>\n" +
            "                            </div>"+
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">是否预定酒店</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"needHotel\" id=\"needHotel\" placeholder='1代表需要,2代表不需要' >\n" +
            "                                </div>\n" +
            "                            </div>"+
            "<div class=\"form-actions\">\n" +
            "                                <input type=\"submit\" value=\"提交\" class=\"btn btn-primary\"  >\n" +
            "                            </div>\n" +
            "                        </form>"+
            "</div>"+
            "</div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function Things(){
        var listHtml ="               <div class=\"alert alert-info\">\n" +
            "                    This page demonstrates a jQuery calendar plugin. Try to add a new event!\n" +
            "                    <a href=\"#\" class=\"close\" data-dismiss=\"alert\">×</a>\n" +
            "                </div>"+
            "<div class=\"widget-box widget-calendar\">\n" +
            "                    <div class=\"widget-title\">\n" +
            "                        <span class=\"icon\"><i class=\"fa fa-calendar\"></i></span>\n" +
            "                        <h5>Calendar</h5>\n" +
            "                        <!-- 添加事务 -->\n" +
            "                        <div class=\"buttons\">\n" +
            "                            <a id=\"add-event\" data-toggle=\"modal\" href=\"#modal-add-event\" class=\"btn\"><i class=\"fa fa-plus\"></i> <span class=\"text\">Add new event</span></a>\n" +
            "                        </div>\n" +
            "                        <!-- 添加事务 -->\n" +
            "                    </div>\n" +
            "                    <!-- 日历表 -->\n" +
            "                    <div class=\"widget-content nopadding\">\n" +
            "                        <div class=\"panel-left\">\n" +
            "                            <div id=\"fullcalendar\"></div>\n" +
            "                        </div>\n" +
            "                        <!-- 预估的事务 -->\n" +
            "                        <div id=\"external-events\" class=\"panel-right\">\n" +
            "                            <div class=\"panel-title\"><h5>Events</h5></div>\n" +
            "                            <div class=\"panel-content\">\n" +
            "                                <div class=\"external-event ui-draggable label label-inverse\">会客人</div>\n" +
            "                                <div class=\"external-event ui-draggable label label-success\">聚会</div>\n" +
            "                                <div class=\"external-event ui-draggable label label-purple\">度假</div>\n" +
            "                                <div class=\"external-event ui-draggable label label-warning\">休息</div>\n" +
            "                                <div class=\"external-event ui-draggable label label-info\">运动</div>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                        <!-- 预估的事务 -->\n" +
            "                    </div>\n" +
            "                    <!-- 日历表 -->\n" +
            "                </div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function Calendar(){
        var listHtml="<div class=\"widget-box widget-calendar\">\n" +
            "                        <div class=\"widget-title\">\n" +
            "                         </n><span class=\"icon\">\n" +
            "                           <i class=\"fa fa-calendar\"></i>\n" +
            "                           </span>\n" +
            "                            <h5>日历</h5>\n" +
            "                        </div>\n" +
            "                        <div class=\"widget-content \">\n" +
            "                            <div class=\"calendar\"></div>\n"+
            "                        </div>\n" +
            "                    </div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }
</script>
<script>
    window.onload=showUserID();
</script>
</html>