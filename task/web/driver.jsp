<%--
  Created by IntelliJ IDEA.
  User: 柯淇文
  Date: 2020/12/14
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>司机信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
    <script src="assets/js/ace-extra.min.js"></script>
    <style>
    td {
        text-align: center; /*设置水平居中bai*/
        vertical-align: middle; /*设置垂直du居中*/
    }
    th{
        text-align: center; /*设置水平居中bai*/
        vertical-align: middle; /*设置垂直du居中*/
    }
    </style>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    司机个人中心
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo" />
                        <% int Id =Integer.parseInt(request.getParameter("driverId"));%>
                        <span class="user-info">
									<small>欢迎登录</small>
                            <span id="info" onclick="index()"><%=Id%></span>
								</span>
                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                <span onclick="UpdateDriver()">设置</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                <span onclick="ShowDriverInfo()">个人资料</span>
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="login.jsp">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="icon-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="icon-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="icon-group"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="icon-cogs"></i>
                    </button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->
            <ul class="nav nav-list">
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 个人账号 </span>


                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li class="active">
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                <span class="menu-text" onclick="ShowDriverInfo()">个人信息</span>
                            </a>
                        <li class="active">
                            <a href="#">
                                <i class="icon-edit"></i>
                                <span class="menu-text" onclick="UpdateDriver()">修改个人信息</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 乘客信息 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu">
                        <li class="active">
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                <span onclick="ShowPassergers()">乘客预定信息</span>
                            </a>
                        </li>
                        <li calss="active">
                            <a href="#">
                                <i class="icon-double-angle-right"></i>
                                <span onclick="ShowMyOrderInfo()">已接单信息</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="calendar.html">
                        <i class="icon-calendar"></i>
                        <span class="menu-text">
                            任务时间
                            <span class="badge badge-transparent tooltip-error" title="2&nbsp;Important&nbsp;Events">
                                <i class="icon-warning-sign red bigger-130"></i>
                            </span>
                        </span>
                    </a>
                </li>
            </ul><!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>
                <!-- 最上面通栏 -->
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>

                    <li>
                        <a href="#">Information</a>
                    </li>
                </ul><!-- .breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="icon-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- #nav-search -->
            </div>
            <div class="page-content">
                <div class="page-header">
                    <h1>
                        司机中心
                    </h1>
                </div><!-- /.page-header -->
                    <div class="row">
                     <div class="col-xs-12" id="ineer">
                        <!-- 分割处 -->
                    </div><!-- /span -->
                </div><!-- /row -->
            </div><!-- /.page-content -->
        </div><!-- /.main-content -->

        <!-- UI交互 -->
        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; Choose Skin</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                    <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                    <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                    <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                    <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                    <label class="lbl" for="ace-settings-add-container">
                        Inside
                        <b>.container</b>
                    </label>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->
</div><!-- /.main-container -->

<script>
    function ShowDriverInfo(){
        xmlhttp =new XMLHttpRequest();
        var driverId =document.getElementById("info").innerText;
        console.log(driverId);
        xmlhttp.open("get","${pageContext.request.contextPath}/findByDrvierId?driverId="+driverId,true);
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
                        "<div class=\"col-sm-6\">\n"+
                        "<div class=\"dd\" id=\"nestable\">\n" +
                        "<ol class=\"dd-list\">\n" +
                        "<li class=\"dd-item\" data-id=\"11\">\n" +
                        "<div class=\"dd-handle\">\n" +
                        "您的ID为：<span>"+obj[i].driverId+"</span>\n" +
                        "<span class=\"sticker\">\n" +
                        "<i class=\"icon-ok bigger-110\"></i>\n" +
                        "</span>\n" +
                        "</span>\n" +
                        "</div>\n" +
                        "</li>\n" +
                        "<div class=\"space-4\"></div>\n"+
                        "<li class=\"dd-item\" data-id=\"11\">\n" +
                        "<div class=\"dd-handle\">\n" +
                        "您的密码为:<span>"+obj[i].password+"</span> \n" +
                        "<span class=\"sticker\">\n" +
                        "<i class=\"icon-ok bigger-110\"></i>\n" +
                        "</span>\n" +
                        "</span>\n" +
                        "</div>\n" +
                        "</li>\n" +
                        "<div class=\"space-4\"></div>\n"+
                        "<li class=\"dd-item\" data-id=\"11\">\n" +
                        "<div class=\"dd-handle\">\n" +
                        "您的电话是：<span>"+obj[i].phone+"</span>\n" +
                        "<span class=\"sticker\">\n" +
                        "<i class=\"icon-ok bigger-110\"></i>\n" +
                        "</span>\n" +
                        "</span>\n" +
                        "</div>\n" +
                        "</li>\n" +
                        "<div class=\"space-4\"></div>\n"+
                        "<li class=\"dd-item\" data-id=\"11\">\n" +
                        "<div class=\"dd-handle\">\n" +
                        "您的自我描述：<span>"+obj[i].description+"</span>\n" +
                        "<span class=\"sticker\">\n" +
                        "<i class=\"icon-ok bigger-110\"></i>\n" +
                        "</span>\n" +
                        "</span>\n" +
                        "</div>\n" +
                        "</li>\n" +
                        "</ol>\n" +
                        "</div>"+
                        "</div>"+
                        "<div class=\"col-xs-12 col-sm-6\">\n" +
                        " <div>" +
                        "   <img src='https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2266790837,3806975123&fm=11&gp=0.jpg' height='auto' width='300px'>" +
                        " </div>"+
                        "</div>"+
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

    function ShowPassergers(){
        xmlhttp =new XMLHttpRequest();
        var driverId =document.getElementById("info").innerText;
        console.log(driverId);
        xmlhttp.open("get","${pageContext.request.contextPath}/ShowOrderCarIn?driverId="+driverId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml ="<div class=\"alert alert-info\">\n" +
                    "                     受理状态中0代表未受理,1代表接单,2代表拒绝接单\n" +
                    "                    <a href=\"#\" class=\"close\" data-dismiss=\"alert\">×</a>\n" +
                    "                </div>"+
                    "                        <div class=\"table-responsive\">\n" +
                    "                             <table id=\"sample-table-1\" class=\"table table-striped table-bordered table-hover\">\n" +
                    "                                 <thead>\n" +
                    "                                 <tr>\n" +
                    "                                     <th class=\"center\">\n" +
                    "                                         <label>\n" +
                    "                                             <input type=\"checkbox\" class=\"ace\" />\n" +
                    "                                             <span class=\"lbl\"></span>\n" +
                    "                                         </label>\n" +
                    "                                     </th>\n" +
                    "                                     <th >\n" +
                    "                                         用户ID\n" +
                    "                                     </th>\n" +
                    "                                     <th>\n" +
                    "                                         乘车人数\n" +
                    "                                     </th>\n" +
                    "                                     <th>\n" +
                    "                                         乘车地点\n" +
                    "                                     </th>\n" +
                    "                                     <th >\n" +
                    "                                         乘车时间\n" +
                    "                                     </th>\n" +
                    "                                     <th >\n" +
                    "                                         预定状态\n" +
                    "                                     </th>\n" +
                    "                                     <th>同意接单 or 不同意接单</th>\n" +
                    "                                 </tr>\n" +
                    "                                 </thead>";
                for(var i in obj){
                    listHtml+=" <tbody>\n" +
                        "                                 <tr>\n" +
                        "                                     <td class=\"center\">\n" +
                        "                                         <label>\n" +
                        "                                             <input type=\"checkbox\" class=\"ace\" />\n" +
                        "                                             <span class=\"lbl\"></span>\n" +
                        "                                         </label>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "<span>"+obj[i].userId+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "<span>"+obj[i].people+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td >\n" +
                        "<span>"+obj[i].place+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "<span >"+obj[i].deadline+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td >\n" +
                        " <span>"+obj[i].state+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "                                         <div class=\"visible-md visible-lg hidden-sm hidden-xs btn-group\">\n" +
                        "                                             <button class=\"btn btn-xs btn-info\" >\n" +
                        "                                                 <i class=\"icon-edit bigger-120\" onclick='p_prompt()'></i>\n" +
                        "                                             </button>\n" +
                        "                                             <button class=\"btn btn-xs btn-danger\" >\n" +
                        "                                                 <i class=\"icon-trash bigger-120\" onclick='disp_prompt()'></i>\n" +
                        "                                             </button>\n" +
                        "                                         </div>\n" +
                        "                                     </td>\n" +
                        "                                 </tr>\n" +
                        "                                 </tbody>"
                }
                document.getElementById("ineer").innerHTML=listHtml+"</table>" + "</div>";
            }else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }
    function ChangeStateTosuccess(userId,deadline){
        xmlhttp =new XMLHttpRequest();
        xmlhttp.open("get","${pageContext.request.contextPath}/ChangeStateS?userId="+userId+"&deadline="+deadline,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200){
                window.alert("接车成功，请在规定时间内到达接车地点！");
            }else{
                window.alert("网络出现问题，请重新提交一次");
            }
        }
    }

    function ChangeStateToError(userId,deadline){
        xmlhttp =new XMLHttpRequest();
        xmlhttp.open("get","${pageContext.request.contextPath}/ChangeStateR?userId="+userId+"&deadline="+deadline,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200){
                window.alert("拒绝成功，我们会及时通知到用户！");
            }else{
                window.alert("网络出现问题，请重新提交一次");
            }
        }
    }
    function p_prompt()
    {
        var userId=prompt("请输入用户的ID","");
        var deadline=prompt("请输入用户预定时间","");
        if (userId!=null && userId != "")
        {
            ChangeStateTosuccess(userId,deadline);
        }
    }

    function disp_prompt()
    {
        var userId=prompt("请输入用户的ID","");
        var deadline=prompt("请输入用户预定时间","");
        if (userId!=null && userId != "")
        {
            ChangeStateToError(userId,deadline);
        }
    }
    function ShowMyOrderInfo(){
        xmlhttp =new XMLHttpRequest();
        var driverId =document.getElementById("info").innerText;
        xmlhttp.open("get","${pageContext.request.contextPath}//DriverOrders?driverId="+driverId,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange = function callback(){
            if (xmlhttp.status==200) {
                var date = xmlhttp.responseText;
                var obj = JSON.parse(date);
                var listHtml = "  <div class=\"table-responsive\">\n" +
                    "                             <table id=\"sample-table-1\" class=\"table table-striped table-bordered table-hover\">\n" +
                    "                                 <thead>\n" +
                    "                                 <tr>\n" +
                    "                                     <th class=\"center\">\n" +
                    "                                         <label>\n" +
                    "                                             <input type=\"checkbox\" class=\"ace\" />\n" +
                    "                                             <span class=\"lbl\"></span>\n" +
                    "                                         </label>\n" +
                    "                                     </th>\n" +
                    "                                     <th >\n" +
                    "                                         用户姓名\n" +
                    "                                     </th>\n" +
                    "                                     <th >\n" +
                    "                                         用户电话\n" +
                    "                                     </th>\n" +
                    "                                     <th>\n" +
                    "                                         乘车地点\n" +
                    "                                     </th>\n" +
                    "                                     <th>\n" +
                    "                                         乘车时间\n" +
                    "                                     </th>\n" +
                    "                                     <th >\n" +
                    "                                         乘车人数\n" +
                    "                                     </th>\n" +
                    "                                 </thead>";
                for(var i in obj){
                    listHtml+=" <tbody>\n" +
                        "                                 <tr>\n" +
                        "                                     <td class=\"center\">\n" +
                        "                                         <label>\n" +
                        "                                             <input type=\"checkbox\" class=\"ace\" />\n" +
                        "                                             <span class=\"lbl\"></span>\n" +
                        "                                         </label>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "<span>"+obj[i].userName+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "<span>"+obj[i].phone+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td >\n" +
                        "<span>"+obj[i].place+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td>\n" +
                        "<span >"+obj[i].deadline+"</span>\n" +
                        "                                     </td>\n" +
                        "                                     <td >\n" +
                        " <span>"+obj[i].people+"</span>\n" +
                        "                                     </td>\n" +
                        "                                 </tr>\n" +
                        "                                 </tbody>"
                }
                document.getElementById("ineer").innerHTML=listHtml+"</table>" + "</div>";
            }else {
                alert("┗|｀O′|┛ 嗷~~ 界面走丢，请致电开发人员");
            }
        }
    }

    function UpdateDriver(){
        var listHtml ="<form class=\"form-horizontal\" action='${pageContext.request.contextPath}/updateDriver' target=\"_blank\" >\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">司机ID</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"driverId\" id=\"driverId\" placeholder=\"您的id\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">密码</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"password\" id=\"password\" placeholder=\"您的密码\"  >\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">电话</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"phone\" id=\"phone\" placeholder=\"您的手机号\" >\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"form-group\">\n" +
            "                                <label class=\"col-sm-3 col-md-3 col-lg-2 control-label\">个人描述</label>\n" +
            "                                <div class=\"col-sm-9 col-md-9 col-lg-10\">\n" +
            "                                    <input type=\"text\" class=\"form-control input-sm\" name=\"description\" id=\"description\" placeholder=\"您的个人描述\">\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "<div class=\"clearfix form-actions\">\n" +
            "\t\t\t\t\t\t\t\t\t<div class=\"col-md-offset-3 col-md-9\">\n" +
            "\t\t\t\t\t\t\t\t\t\t<button class=\"btn btn-info\" type=\"submit\">\n" +
            "\t\t\t\t\t\t\t\t\t\t\t<i class=\"icon-ok bigger-110\"></i>\n" +
            "\t\t\t\t\t\t\t\t\t\t\t 提交更改\n" +
            "\t\t\t\t\t\t\t\t\t\t</button>\n" +
            "\t\t\t\t\t\t\t\t\t</div>\n" +
            "\t\t\t\t\t\t\t\t</div>"
            "</form>";
        document.getElementById("ineer").innerHTML=listHtml;
    }

    function index() {
        var listHtml ="<div style=\"text-align: center;\" >\n" +
            "\t\t\t<div class=\"text-primary\">\n" +
            "\t\t\t\t<h2 >欢迎来到 MeetingWeb 司机信息服务系统</h1>\n" +
            "\t\t\t</div>\n" +
            "\t\t\t<span style=\"font-size: 22px;font-family: 楷体;\">本系统由 <b>打工人</b> 小组共同完成</span>\n" +
            "\t\t\t<br>\n" +
            "\t\t\t<p class=\"text-success\" style=\"font-size: 20px;font-family: 宋体;\">\n" +
            "\t\t\t\t<span>  </span>\n" +
            "\t\t\t\t您现在所处的界面是司机界面。\n" +
            "\t\t\t\t<br>\n" +
            "\t\t\t\t您可以在本界面中查找客户预定车辆信息，同时查看自己的信息。\n" +
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
</script>
<script>
    window.onload=index();
</script>

<script src="http://ajax.useso.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/excanvas.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/jquery-ui.custom.js"></script>--%>

<%--<script src="${pageContext.request.contextPath}/js/jquery.flot.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/commons.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/jquery.nicescroll.min.js"></script>--%>
<script type="text/javascript">
    jQuery(function($) {
        var oTable1 = $('#sample-table-2').dataTable( {
            "aoColumns": [
                { "bSortable": false },
                null, null,null, null, null,
                { "bSortable": false }
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    })
</script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
