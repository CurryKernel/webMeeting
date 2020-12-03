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

<%--<script src="js/excanvas.min.js"></script>--%>
<%--<script src="js/jquery.min.js"></script>--%>
<%--<script src="js/jquery-ui.custom.js"></script>--%>
<%--<script src="js/bootstrap.min.js"></script>--%>
<%--<script src="js/jquery.flot.min.js"></script>--%>
<%--<script src="js/jquery.flot.resize.min.js"></script>--%>
<%--<script src="js/jquery.sparkline.min.js"></script>--%>
<%--<script src="js/fullcalendar.min.js"></script>--%>
<%--<script src="js/commons.js"></script>--%>
<%--<script src="js/jquery.nicescroll.min.js"></script>--%>
<%--<script src="js/unicorn.js"></script>--%>
<%--<script src="js/unicorn.dashboard.js"></script>--%>

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
            <li class="active "><a href="#"><i class="fa fa-home" ></i> <span>个人信息</span></a></li>
            <li class="submenu">
                <a href="#"><i class="fa fa-flask"></i> <span >会议中心</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="">我的会议</a></li>
                    <li><a href="#">加入会议</a></li>
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
                    <li><a href="#">预约</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-file"></i> <span>我的预约</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#">酒店预约信息</a></li>
                    <li><a href="#">驾车预约信息</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-file"></i> <span>日期事务添加</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="calendar.jsp">日历</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- 侧边栏信息 -->

    <!-- 以上模块不再变动 -->

    <!-- 个人信息侧边栏信息 -->
    <div id="content">
        <div id="content-header" class="mini">
            <h1>个人展示....</h1>
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
                            <a href="#">
                                <i class="icon-cal"></i>
                                Manage Events
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-shopping-bag"></i>
                                Manage Orders
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-database"></i>
                                Manage DB
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-people"></i>
                                Manage Users
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-lock"></i>
                                Security
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-piechart"></i>
                                Statistics
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
            <!-- 第三部分 --日历 -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box widget-calendar">
                        <div class="widget-title">
									<span class="icon">
										<i class="fa fa-calendar"></i>
									</span>
                            <h5>日历</h5>
                        </div>
                        <div class="widget-content ">
                            <div class="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
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
                        "                            <td>"+obj[i].pepleCount+"</td>\n" +
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

    function HorderInfo(){
        var listHtml = "<div class=\"widget-box\">"+"<div class=\"widget-title\">\n" +
            "<span class=\"icon\">\n" +
            "<i class=\"fa fa-align-justify\"></i>\n" +
            "</span>\n" +
            "                        <h5>预约窗口</h5>\n" +
            "                        <span class=\"label label-danger\">notices</span>\n" +
            "                    </div>"+
            "<div class=\"widget-content nopadding\">\n" +
            "                        <form class=\"form-horizontal\" method=\"post\" action=\"#\" name=\"basic_validate\" id=\"basic_validate\" novalidate=\"novalidate\">\n" +
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
            "<div class=\"form-actions\">\n" +
            "                                <input type=\"submit\" value=\"Validate\" class=\"btn btn-primary\" onclick='orderHotel()'>\n" +
            "                            </div>\n" +
            "                        </form>"+
            "</div>"+
            "</div>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function orderHotel(){
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("get", "/task/orderHotel?userId="+Urequired+"&hotelId="+Hrequired, true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status == 200){
                alert("您的信息已经提交，同一酒店不需要再次预约啦 (๑•́ωก̀๑) ");
            }
        }

    }
</script>
<script>
    window.onload=showUserID();
</script>
</html>
