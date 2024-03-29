<%@ page import="java.util.List" %>
<%@ page import="VO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>用户中心</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.jscrollpane.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/unicorn.css" />

    <script src="assets/js/ace-extra.min.js"></script>
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
<body onload="initAJAX();" data-color="blue" class="flat" >

<!-- 主体 -->
<div id="wrapper">
    <!--此处为界面的主通栏  -->
    <div id="header">
        <h1>用户中心</h1>
        <a id="menu-trigger" href="#"><i class="fa fa-bars"></i></a>
    </div>
    <!--此处为界面的主通栏  -->

    <!-- 用户通栏部分 -->
    <div id="user-nav">
        <ul class="btn-group">
            <li class="btn" ><a title="" href="#">
                <i class="fa fa-user"></i>
                <% int userId =Integer.parseInt(request.getParameter("userId"));%>
                <span class="text" onclick="index()"  >
                        <%=userId%>
                </span>
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
            <li class="active">
                <a href="#"><i class="fa fa-home" ></i> <span onclick="showUserID()">个人信息</span></a>
            </li>
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
                    <li><a href="${pageContext.request.contextPath}/calendar.html" target="_blank" >日历</a></li>
                    <li><a href="${pageContext.request.contextPath}/calendarMangment.html" target="_blank">事务个性化</a></li>
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
                            <a href="https://www.baidu.com" target="_blank">
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
<script language="JavaScript">
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
                        " <h5>个人资料</h5>\n" +
                        " <div class=\"buttons\">\n" +
                        "  <a href=\"#\" class=\"btn\">" +
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
                        " <div style=\"text-align: center\">" +
                        "   <img src='https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2266790837,3806975123&fm=11&gp=0.jpg' height='auto' width='300px'>" +
                        " </div>"+
                        "</div>"+
                        // "<div class=\"col-xs-12 col-sm-4\">\n" +

                        // "</div>"+
                        " </div>"+
                        "</div>"+
                        "</div>";
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

    function ShowHotelInfo() {
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("get", "${pageContext.request.contextPath}/ShowHotelInfo", true);
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
        xmlhttp.open("get", "${pageContext.request.contextPath}/ShowDriverInfo", true);
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
        xmlhttp.open("get","${pageContext.request.contextPath}/MyOderCarInfo?userId="+userId,true);
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
        xmlhttp.open("get","${pageContext.request.contextPath}/MyOderHotelInfo?userId="+userId,true);
        xmlhttp.send();
        //test
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
            "                        <form class=\"form-horizontal\" method=\"get\" action='${pageContext.request.contextPath}/UserorderHotel' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
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
            "                        <form class=\"form-horizontal\" method=\"get\" action='${pageContext.request.contextPath}/UserOrderCar' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
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

    function setPassword(){
        var userId =document.getElementById("info").innerText;
        var listHtml = "<div class=\"widget-box\">\n" +
            "                    <div class=\"widget-title\">\n" +
            "<span class=\"icon\">\n" +
            "<i class=\"fa fa-align-justify\"></i>\n" +
            "</span>\n" +
            "                        <h5>修改个人信息</h5>\n" +
            "                        <span class=\"label label-danger\">notices</span>\n" +
            "                    </div>\n" +
            "                    <div class=\"widget-content nopadding\">\n" +
            "                        <form class=\"form-horizontal\" method=\"get\" action='${pageContext.request.contextPath}/updateUser' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">用户ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"userId\" id=\"userId\" placeholder = userId>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">姓名</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"name\" id=\"name\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">老密码</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"oldPassword\" id=\"oldPassword\" >\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">新密码</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"newPassword\" id=\"newPassword\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">电话</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"phone\" id=\"phone\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">部门</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"department\" id=\"department\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">邮箱</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"email\" id=\"email\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-actions\" style=\"text-align:center;\">\n" +
            "                                <input type=\"submit\" value=\"更新\" class=\"btn btn-primary\">\n" +
            "                            </div>\n" +
            "                        </form>\n" +
            "                    </div>\n" +
            "                </div>";
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
            "                        <form class=\"form-horizontal\" method=\"get\" action='${pageContext.request.contextPath}/UserJoinMeeting' name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\" target=\"_blank\">\n" +
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



    function index() {
        var listHtml ="<div style=\"text-align: center;\" >\n" +
            "\t\t\t<div class=\"text-primary\">\n" +
            "\t\t\t\t<h2 >欢迎来到 MeetingWeb 用户信息服务系统</h1>\n" +
            "\t\t\t</div>\n" +
            "\t\t\t<span style=\"font-size: 22px;font-family: 楷体;\">本系统由 <b>打工人</b> 小组共同完成</span>\n" +
            "\t\t\t<br>\n" +
            "\t\t\t<p class=\"text-success\" style=\"font-size: 20px;font-family: 宋体;\">\n" +
            "\t\t\t\t<span>  </span>\n" +
            "\t\t\t\t您现在所处的界面是参会者界面，您可以在本界面中查找、加入以及查看已参加的会议。\n" +
            "\t\t\t\t<br>\n" +
            "\t\t\t\t同时，您还可以预约车辆、酒店同时查看自己的信息。\n" +
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
