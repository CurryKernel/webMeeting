<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 李婉芸
  Date: 2020/12/8
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>表单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="css/layui.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
</head>

<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>增加酒店订单</legend>
    </fieldset>


    <form class="layui-form" action="${pageContext.request.contextPath}/OrderHotel" method="post">
        <input type="hidden" name="action" value="add_order"/>

        <div class="layui-form-item">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input type="text" name="userId" lay-verify="title" autocomplete="off" placeholder="请输入用户的ID" class="layui-input" >
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">住房人数</label>
            <div class="layui-input-block">
                <input type="text" name="people" lay-verify="title" autocomplete="off" placeholder="请输入住房人数" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <select name="state" lay-filter="ss">
                    <option value=""></option>
                    <option value="0"  selected="">未审核</option>
                    <option value="1"> 审核未通过</option>
                    <option value="2">审核通过</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">酒店ID</label>
            <div class="layui-input-block">
                <input type="text" name="hotelId" lay-verify="title" autocomplete="off" placeholder="请输入用户的ID" class="layui-input" >
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn"  lay-filter="demo1"></input>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render('select','ss');
        //各种基于事件的操作，下面会有进一步介绍
        //form.render('组件名','lay-filter名')
    });
</script>
</body>

</html>