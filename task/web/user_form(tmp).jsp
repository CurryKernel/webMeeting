<%--
  Created by IntelliJ IDEA.
  User: 柯淇文
  Date: 2020/11/25
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Unicorn Admin</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icheck/flat/blue.css" />
    <link rel="stylesheet" href="css/select2.css" />
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

    </script></head>
<body data-color="grey" class="flat">
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
            <li class="active"><a href="user.jsp"><i class="fa fa-home"></i> <span>个人信息</span></a></li>
            <li class="submenu">
                <a href="#"><i class="fa fa-flask"></i> <span>会议中心</span> <i class="arrow fa fa-chevron-right"></i></a>
                <ul>
                    <li><a href="#">我的会议</a></li>
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

    <!-- 以上模块不再变动 -->

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

        <div id="breadcrumb">
            <a href="user.jsp" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
            <a href="#">表单名称</a>
        </div>

        <!-- 表单，用于改动 -->
        <div class="row">
            <div class="col-xs-12">
                <div class="widget-box">
                    <div class="widget-title">
								<span class="icon">
									<i class="fa fa-align-justify"></i>
								</span>
                        <h5>预约窗口</h5>
                        <span class="label label-danger">notices</span>
                    </div>
                    <div class="widget-content nopadding">
                        <form class="form-horizontal" method="post" action="#" name="basic_validate" id="basic_validate" novalidate="novalidate">
                            <div class="form-group">
                                <label class="col-sm-3 col-md-3 col-lg-2 control-label">酒店ID</label>
                                <div class="col-sm-9 col-md-9 col-lg-10">
                                    <input type="text" class="form-control input-sm" name="Hrequired" id="Hrequired">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 col-md-3 col-lg-2 control-label">用户ID</label>
                                <div class="col-sm-9 col-md-9 col-lg-10">
                                    <input type="text" class="form-control input-sm" name="Urequired" id="Urequired">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 col-md-3 col-lg-2 control-label">Date</label>
                                <div class="col-sm-9 col-md-9 col-lg-10">
                                    <input type="text" class="form-control input-sm" name="date" id="date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 col-md-3 col-lg-2 control-label">URL</label>
                                <div class="col-sm-9 col-md-9 col-lg-10">
                                    <input type="text" class="form-control input-sm" name="url" id="url">
                                </div>
                            </div>
                            <div class="form-actions">
                                <input type="submit" value="Validate" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 表单，用于改动 -->
    </div>
</div>

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
<script src="js/jquery.icheck.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.js"></script>

<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.form_validation.js"></script>
</body>
</html>
