<%--
  Created by IntelliJ IDEA.
  User: 李婉芸
  Date: 2020/12/8
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="VO.OrderHotel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>酒店</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" href="css/layui.css" media="all" />
		<link rel="stylesheet" href="css/layout.css" media="all" />
		<link rel="stylesheet" href="css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" href="css/table.css" />
		<style>
			div.search {padding: 0px 0;}
			.bar1 input {
				border: 2px solid #7BA7AB;
				border-radius: 5px;
				height: 25px;
				background: white;
				color: #9E9C9C;
			}
		</style>


		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
		<script>
			$(function () {
				// 给删除的a标签绑定单击事件，用于删除的确认提示操作
				$("#deletebutton").click(function () {
					return confirm("你确定要删除这条信息吗?");
				});
			});

			function searchUser_hotel(){
				var userid = $("#searchid").val();
				location.href = "${pageContext.request.contextPath}/OrderHotel?action=orderbyUser_Hotel&hotelid=<%=request.getParameter("hotelid")%>&userid="+userid;
			}
		</script>

	</head>

	<body>
		<div class="layui-layout layui-layout-admin beg-layout-container">

			<div class="layui-header beg-layout-header">
				<div class="beg-layout-main beg-layout-logo">
					<a href="#" target="_blank">
						<%
							String hotelid=request.getParameter("hotelid");
							out.println("Hello"+hotelid);
						%>
					</a>
				</div>

				<div class="beg-layout-main beg-layout-side-toggle">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
				<!--一级菜单-->
				<div class="beg-layout-main beg-layout-menu" id="menu">
					<ul class="layui-nav beg-layout-nav" lay-filter="">
						<li class="layui-nav-item layui-this">
							<a href="javascript:;" data-module-id="1">
								<i class="fa fa-desktop" aria-hidden="true"></i>
								<cite>内容管理</cite>
							</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">
								<i class="fa fa-shopping-bag" aria-hidden="true"></i>
								<cite>商品管理</cite>
							</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;" data-module-id="3">
								<i class="fa fa-users" aria-hidden="true"></i>
								<cite>会员管理</cite>
							</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">
								<i class="fa fa-tv" aria-hidden="true"></i>
								<cite>订单管理</cite>
							</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">
								<i class="fa fa-gears" aria-hidden="true"></i>
								<cite>设置</cite>
							</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">
								<i class="fa fa-plug" aria-hidden="true"></i>
								<cite>扩展</cite>
							</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">
								<i class="fa fa-paper-plane" aria-hidden="true"></i>
								<cite>社区</cite>
							</a>
						</li>
					</ul>
				</div>

				<div class="beg-layout-main beg-layout-panel">
					<ul class="layui-nav beg-layout-nav" lay-filter="user">
						<li class="layui-nav-item">
							<a href="javascript:;" class="beg-layou-head">
								<img src="img/icons/32/client.png" />
								<span>beginner</span>
							</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="javascript:;" data-tab="true" data-url='user.html'>
										<i class="fa fa-user-circle" aria-hidden="true"></i>
										<cite>个人信息</cite>
									</a>
								</dd>
								<dd>
									<a href="javascript:;" data-tab="true" data-url="setting.html">
										<i class="fa fa-gear" aria-hidden="true"></i>
										<cite>设置</cite>
									</a>
								</dd>
								<dd>
									<a href="login.html">
										<i class="fa fa-sign-out" aria-hidden="true"></i>
										<cite>注销</cite>
									</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>

			</div>


			<!--侧边导航栏-->
			<div class="layui-side beg-layout-side" id="side" lay-filter="side">
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
					<legend>酒店查询</legend>
				</fieldset>
				<ul class="layui-nav layui-nav-tree">

					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">房型订单</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${pageContext.request.contextPath}/OrderHotel?action=orderbyPeople_Hotel&minpeople=3&maxpeople=5&hotelid=<%=request.getParameter("hotelid")%>">套房(3<=人数<=5)</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/OrderHotel?action=orderbyPeople_Hotel&minpeople=1&maxpeople=2&hotelid=<%=request.getParameter("hotelid")%>">标间/大床房(<=2)</a>
							</dd>
						</dl>
					</li>

					<li class="layui-nav-item">
						<a href="${pageContext.request.contextPath}/OrderHotel?action=page&hotelid=<%=request.getParameter("hotelid")%>">全部订单</a>
					</li>

					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">审核状态</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${pageContext.request.contextPath}/OrderHotel?action=orderbyState_Hotel&state=0&hotelid=<%=request.getParameter("hotelid")%>">未审核订单</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/OrderHotel?action=orderbyState_Hotel&state=1&hotelid=<%=request.getParameter("hotelid")%>">审核未通过订单</a>
							</dd>
							<dd>
								<a href="${pageContext.request.contextPath}/OrderHotel?action=orderbyState_Hotel&state=2&hotelid=<%=request.getParameter("hotelid")%>">审核通过订单</a>
							</dd>
						</dl>
					</li>

				</ul>
			</div>

			<!--内容区域-->
			<div class="layui-body beg-layout-body">
				<div class="layui-tab layui-tab-brief layout-nav-card" lay-filter="layout-tab" style="border: 0; margin: 0;box-shadow: none; height: 100%;">
					<div class="layui-tab-content" style="min-height: 500px; padding: 5px 0 0 0;">
						<div class="layui-tab-item layui-show" style="height: 790px">
							<!--<iframe src="hoteltable.jsp"></iframe>-->
							<div class="admin-main">

								<blockquote class="layui-elem-quote">
									<a href="${pageContext.request.contextPath}/hotelorder_add.jsp?hotelid=<%=request.getParameter("hotelid")%>" class="layui-btn layui-btn-small" id="add">
										<i class="layui-icon">&#xe608;</i> 增加订单
									</a>
									<a href="#" class="layui-btn layui-btn-small" id="import">
										<i class="layui-icon">&#xe608;</i> 修改信息
									</a>
									<a href="#" class="layui-btn layui-btn-small">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i> 删除信息
									</a>
									<span class="search bar1" style="position: relative;left: 500px;">
											<input type="text" id="searchid" name="userid" placeholder="请输入搜索用户的ID" class="layui-input" style="width:200px;display: inline-block">
										<button class="layui-btn layui-btn-small" style="display: inline-block" onclick="searchUser_hotel()">搜索</button>
									</span>
								</blockquote>

								<fieldset class="layui-elem-field">
									<legend>酒店订单数据列表</legend>
									<div class="layui-field-box">
										<table class="site-table table-hover">
											<thead>
											<tr style="text-align: center">
												<th><input type="checkbox" id="selected-all"></th>
												<th>序号</th>
												<th>用户id</th>
												<th>订房人姓名</th>
												<th>联系方式</th>
												<th>住房人数</th>
												<th>入住时间</th>
												<th>状态</th>
												<th>置顶</th>
												<th>操作</th>
											</tr>
											</thead>

											<tbody id="tablebody">
											<div>
												<c:set value="1" var="num" />
												<c:forEach items="${requestScope.page.items}" var="page1">
											<tr>
												<td><input type="checkbox"></td>
												<td>${num}</td>
												<td><a href="#">${page1.getUserId()}</a></td>
												<td>${page1.getUserName()}</td>
												<td>${page1.phone}</td>
												<td>${page1.getPeople()}</td>
												<td>${page1.getTime()}</td>
												<td>${page1.getState()}</td>
												<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
												<td width="120px">
													<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
													<a href="${pageContext.request.contextPath}/hotelorder_state_edit.jsp?&hotelid=${page1.getHotelId()}&userid=${page1.getUserId()}" class="layui-btn layui-btn-mini" id="stateedit">编辑</a>
													<a href="${pageContext.request.contextPath}/OrderHotel?action=delete_order&hotelid=${page1.getHotelId()}&userid=${page1.getUserId()}" data-id="1" data-opt="del" id="deletebutton" class="layui-btn layui-btn-danger layui-btn-mini" >删除</a>
												</td>
											</tr>
													<c:set value="${num+1}" var="num"/>
												</c:forEach>
											</div>
											</tbody>

										</table>

									</div>
								</fieldset>

								<!--<div class="admin-table-page" style="left: 900px">
									<div id="page" class="page" >
									</div>
								</div>-->
								<!--<div style="position:relative; left:650px; top:420px">-->
							</div>

								<!--<div style="position:fixed;left:650px;top:620px">-->
								<!--</div>-->

							</div>

						</div>
					</div>

				</div>


			<!--页脚-->
			<!--<div lass="layui-footer beg-layout-footer">
			</div>-->
			<div class="layui-footer beg-layout-footer">
				<p>
					<%@include file="/hotelpage.jsp"%>
				</p>
			</div>
		</div>

		<div id="contextmenu" class="layout-tab-contextmenu">
			<ul class="layui-nav " lay-filter>
				<li class="layui-nav-item " data-toggle="closeCurrent">
					<a href="javascsript:; ">关闭标签</a>
				</li>
				<li class="layui-nav-item " data-toggle="refresh">
					<a href="javascsript:; ">刷新</a>
				</li>
				<li class="layui-nav-item " data-toggle= "closeLeft">
					<a href="javascsript:; ">关闭左侧</a>
				</li>
				<li class="layui-nav-item " data-toggle= "closeRight">
					<a href="javascsript:; ">关闭右侧</a>
				</li>
				<li class="layui-nav-item " data-toggle= "closeOther">
					<a href="javascsript:; ">关闭其他</a>
				</li>
				<li class="layui-nav-item " data-toggle= "closeAll">
					<a href="javascsript:; ">关闭所有</a>
				</li>
			</ul>
		</div>

		<script src="js/layui.js "></script>
		<script src="js/layout.js "></script>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>

		<script>
			layui.use('element', function() {
				var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
			});

			layui.config({
				base: 'plugins/layui/modules/'
			});

			layui.use(['icheck', 'laypage','layer'], function() {
				var $ = layui.jquery,
						laypage = layui.laypage,
						layer = parent.layer === undefined ? layui.layer : parent.layer;
				$('input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				});

				//page
				laypage({
					cont: 'page',
					pages:25 //总页数
					,
					groups: 5 //连续显示分页数
					,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});

				$('#search').on('click', function() {

				});

				$('#add').on('click', function() {
					$.get('temp/edit-form.html', null, function(form) {
						layer.open({
							type: 1,
							title: '添加表单',
							content: form,
							btn: ['保存', '取消'],
							area: ['600px', '400px'],
							maxmin: true,
							yes: function(index) {
								console.log(index);
							},
							full: function(elem) {
								var win = window.top === window.self ? window : parent.window;
								$(win).on('resize', function() {
									var $this = $(this);
									elem.width($this.width()).height($this.height()).css({
										top: 0,
										left: 0
									});
									elem.children('div.layui-layer-content').height($this.height() - 95);
								});
							}
						});
					});
				});

				$('#import').on('click', function() {
					var that = this;
					var index = layer.tips('只想提示地精准些', that,{tips: [1, 'white']});
					$('#layui-layer'+index).children('div.layui-layer-content').css('color','#000000');
				});

				$('.site-table tbody tr').on('click', function(event) {
					var $this = $(this);
					var $input = $this.children('td').eq(0).find('input');
					$input.on('ifChecked', function(e) {
						$this.css('background-color', '#EEEEEE');
					});
					$input.on('ifUnchecked', function(e) {
						$this.removeAttr('style');
					});
					$input.iCheck('toggle');
				}).find('input').each(function() {
					var $this = $(this);
					$this.on('ifChecked', function(e) {
						$this.parents('tr').css('background-color', '#EEEEEE');
					});
					$this.on('ifUnchecked', function(e) {
						$this.parents('tr').removeAttr('style');
					});
				});
				$('#selected-all').on('ifChanged', function(event) {
					var $input = $('.site-table tbody tr td').find('input');
					$input.iCheck(event.currentTarget.checked ? 'check' : 'uncheck');
				});
			});
		</script>

	</body>

</html>