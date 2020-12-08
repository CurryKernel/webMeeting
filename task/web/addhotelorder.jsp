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

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
</head>

<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>增加酒店订单</legend>
    </fieldset>


    <form class="layui-form" action="/MeetingWeb/OrderHotel" method="post">
        <input type="hidden" name="action" value="add_order"/>

        <div class="layui-form-item">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <input type="text" name="userid" lay-verify="title" autocomplete="off" placeholder="请输入用户的ID" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">酒店ID</label>
            <div class="layui-input-block">
                <input type="text" name="hotelid" lay-verify="title" autocomplete="off" placeholder="请输入用户的ID" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">住房人数</label>
            <div class="layui-input-block">
                <input type="text" name="people" lay-verify="title" autocomplete="off" placeholder="请输入住房人数" class="layui-input" >
            </div>
        </div>

        <!--<div class="layui-form-item">
        <label class="layui-form-label">订单状态</label>
        <div class="layui-input-block">
            <input type="radio" name="state" value="0" title="未审核" checked="">
            <input type="radio" name="state" value="1" title="审核未通过">
            <input type="radio" name="state" value="2" title="审核通过" disabled="">
        </div>
    </div>-->

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" name="state" lay-verify="title" autocomplete="off" placeholder="请输入订单状态（0/1/2）" class="layui-input" >
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
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            userid: function(value) {
                if(value.length < 5) {
                    return 'ID至少得5个字符啊';
                }
            };

            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function(value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });

</script>

</body>

</html>