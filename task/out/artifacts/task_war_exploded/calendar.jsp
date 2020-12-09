<%--
  Created by IntelliJ IDEA.
  User: 柯淇文
  Date: 2020/11/25
  Time: 22:15
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
    <link rel="stylesheet" href="css/unicorn.css" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-44987299-1', 'bootstrap-hunter.com');
        ga('send', 'pageview');

    </script>
</head>
<body data-color="grey" class="flat">
<div id="wrapper">
    <!--此处为界面的主通栏  -->
    <div id="header">
        <h1><a href="./user.jsp">Unicorn User</a></h1>
        <a id="menu-trigger" href="#"><i class="fa fa-align-justify"></i></a>
    </div>
    <!--此处为界面的主通栏  -->

    <!-- 以上模块不再变动 -->

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
            <input type="text" placeholder="Search here..."/><button type="submit" class="tip-right" title="Search"><i class="fa fa-search icon-white"></i></button>
        </div>
        <ul>
            <li class="active"><a href="user.jsp"><i class="fa fa-home"></i> <span>个人信息</span></a></li>
            <li class="submenu">
                <a href="#"><i class="fa fa-flask"></i> <span>会议中心</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="">我的会议</a></li>
                    <li><a href="#">加入会议</a></li>
                    <li><a href="#">会议大厅</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-th-list"></i> <span>酒店预约</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#">酒店信息</a></li>
                    <li><a href="#">预约</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="fa fa-th-list"></i> <span>驾车预约</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#">司机信息</a></li>
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
                    <li class="active">日历<a href="calendar.jsp"></a></li>
                </ul>
            </li>

        </ul>
    </div>
    <!-- 侧边栏信息 -->

    <div id="content">
        <!-- 可写成跳转链接，也可闲置先 -->
        <div id="content-header">
            <h1>Calendar</h1>
            <div class="btn-group">
                <a class="btn" title="Manage Files"><i class="fa fa-file"></i></a>
                <a class="btn" title="Manage Users"><i class="fa fa-user"></i></a>
                <a class="btn" title="Manage Comments"><i class="fa fa-comment"></i><span class="label label-danger">5</span></a>
                <a class="btn" title="Manage Orders"><i class="fa fa-shopping-cart"></i></a>
            </div>
        </div>
        <!-- 可写成跳转链接，也可闲置先 -->

        <!-- 横向树结构 -->
        <div id="breadcrumb">
            <a href="user.jsp" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
            <a href="#">Calendar</a>
        </div>
        <!-- 横向树结构 -->
        <br />

        <div class="row">
            <div class="col-xs-12">

                <!-- 小广告 -->
                <div class="alert alert-info">
                    This page demonstrates a jQuery calendar plugin. Try to add a new event!
                    <a href="#" class="close" data-dismiss="alert">×</a>
                </div>
                <!-- 小广告 -->

                <!-- 日历 -->
                <div class="widget-box widget-calendar">
                    <div class="widget-title">
                        <span class="icon"><i class="fa fa-calendar"></i></span>
                        <h5>Calendar</h5>
                        <!-- 添加事务 -->
                        <div class="buttons">
                            <a id="add-event" data-toggle="modal" href="#modal-add-event" class="btn"><i class="fa fa-plus"></i> <span class="text">Add new event</span></a>
                        </div>
                        <!-- 添加事务 -->
                    </div>
                    <!-- 日历表 -->
                    <div class="widget-content nopadding">
                        <div class="panel-left">
                            <div id="fullcalendar"></div>
                        </div>
                        <!-- 预估的事务 -->
                        <div id="external-events" class="panel-right">
                            <div class="panel-title"><h5>Events</h5></div>
                            <div class="panel-content">
                                <div class="external-event ui-draggable label label-inverse">会客人</div>
                                <div class="external-event ui-draggable label label-success">聚会</div>
                                <div class="external-event ui-draggable label label-purple">度假</div>
                                <div class="external-event ui-draggable label label-warning">休息</div>
                                <div class="external-event ui-draggable label label-info">运动</div>
                            </div>
                        </div>
                        <!-- 预估的事务 -->
                    </div>
                    <!-- 日历表 -->
                </div>
                <!-- 日历 -->

            </div>
        </div>

        <!-- 添加事务的时候的alert -->
        <div class="modal fade" id="modal-add-event">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3>Add a new event</h3>
                    </div>
                    <div class="modal-body">
                        <p>Enter event name:</p>
                        <p><input class="form-control" id="event-name" type="text" /></p>
                    </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default btn-small" data-dismiss="modal">Cancel</a>
                        <a href="#" id="add-event-submit" class="btn btn-primary btn-small">Add event</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 添加事务的时候的alert -->
    </div>
</div>>
<!-- 页脚部分 做成一致 -->
<div class="row">
    <div id="footer" class="col-xs-12">
        2020 - 2021 &copy; Kernel. Brought to you by <a href="#">MyWork</a>
    </div>
</div>
<!-- 页脚部分 做成一致 -->


<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.calendar.js"></script>
</body>
</html>
