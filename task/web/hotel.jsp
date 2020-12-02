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

		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" href="layout.css" media="all" />
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />


		<script language="JavaScript">
			function updatehoteltable(obj){
				xmlHttp.open("GET","hoteltable.jsp?order="+obj,true);
				xmlHttp.onreadystatechange = function(){
					var data = xmlHttp.responseText;
				}
				xmlHttp.send();
			}

			function findhotelorder(category,hotelid){
				var xmlHttp = new XMLHttpRequest();
				xmlHttp.open("GET","http://localhost:8080/MeetingWeb/OrderHotel?hotelId="+hotelid,true);
				//"category="+category
				xmlHttp.onreadystatechange = function(){
					if (xmlHttp.readyState == 4) {
						var data = xmlHttp.responseText;
						alert(data);
						var obj = JSON.parse(data);
						var list = '';
						var now=1;
						var people=1;
						for(var i in obj){
							var userid=obj[i].userId;
							var people=obj[i].people;
							var state=obj[i].state;
							//alert(userid,people,state);
							//xmlHttp.open("GET","hoteltable.jsp?userid="+userid+"people="+people+"state="+state,true);
							list += `<tr>` +
									'<td><input type="checkbox"></td>' +
									'<td>'+now+'</td>' +
									'<td>' +
									'<a href="/manage/article_edit_19">'+userid+'</a>' +
									'</td>' +
									'<td>lll</td>' +
									'<td>15684730222</td>' +
									'<td>'+people+'</td>' +
									'<td>'+state+'</td>' +
									'<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>' +
									'<td>' +
									'<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>'+
									'<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a>'+
									'<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>'+
									'</td>' +
									'</tr>'
							now++;
						}
						document.getElementById("tablebody").innerHTML = list;
					}
			}
			xmlHttp.send();
		}

		</script>
	</head>

	<body onload="initAJAX(),findhotelorder()">
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
								<img src="images/0.jpg" />
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
					<legend>垂直导航菜单</legend>
				</fieldset>

				<ul class="layui-nav layui-nav-tree">
					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">全部订单</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">选项1</a>
							</dd>
							<dd>
								<a href="">选项2</a>
							</dd>
						</dl>
					</li>

					<li class="layui-nav-item">
						<a href="javascript:findhotelorder(1,1)">全部订单</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;">审核状态</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">未审核订单</a>
							</dd>
							<dd>
								<a href="">审核通过订单</a>
							</dd>
							<dd>
								<a href="">审核未通过订单</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">大数据</a>
					</li>
					<li class="layui-nav-item">
						<a href="">社区</a>
					</li>
				</ul>
			</div>
			<!--内容区域-->
			<div class="layui-body beg-layout-body">
				<div class="layui-tab layui-tab-brief layout-nav-card" lay-filter="layout-tab" style="border: 0; margin: 0;box-shadow: none; height: 100%;">
					<ul class="layui-tab-title">
						<li class="layui-this">
							<a href="javascript:;">
								<i class="fa fa-dashboard" aria-hidden="true"></i>
								<cite>控制面板</cite>
							</a>
						</li>

					</ul>
					<div class="layui-tab-content" style="min-height: 500px; padding: 5px 0 0 0;">
						<div class="layui-tab-item layui-show" style="height: 790px">
							<!--<iframe src="hoteltable.jsp"></iframe>-->
							<div class="admin-main">

								<blockquote class="layui-elem-quote">
									<a href="javascript:;" class="layui-btn layui-btn-small" id="add">
										<i class="layui-icon">&#xe608;</i> 增加订单
									</a>
									<a href="#" class="layui-btn layui-btn-small" id="import">
										<i class="layui-icon">&#xe608;</i> 修改信息
									</a>
									<a href="#" class="layui-btn layui-btn-small">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i> 删除信息
									</a>
									<a href="javascript:;" class="layui-btn layui-btn-small" id="search">
										<i class="layui-icon">&#xe615;</i> 搜索
									</a>
								</blockquote>
								<fieldset class="layui-elem-field">
									<legend>数据列表</legend>
									<div class="layui-field-box">
										<table class="site-table table-hover">
											<thead>
											<tr>
												<th>&nbsp&nbsp<input type="checkbox" id="selected-all"></th>
												<th>&nbsp&nbsp序号</th>
												<th>&nbsp&nbsp用户id</th>
												<th> &nbsp&nbsp订房人姓名</th>
												<th> &nbsp&nbsp联系方式</th>
												<th> &nbsp&nbsp住房人数</th>
												<th> &nbsp&nbsp状态</th>
												<th> &nbsp&nbsp置顶</th>
												<th> &nbsp&nbsp操作</th>
											</tr>
											</thead>
											<tbody id="tablebody">
											<div >
											<tr>
												<td><input type="checkbox"></td>
												<td>1</td>
												<td>
													<a href="/manage/article_edit_1">123</a>
												</td>
												<td>Beginner</td>
												<td>13446789230</td>
												<td>2</td>
												<td>正常</td>
												<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
												<td width="50px">
													<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
													<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a>
													<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
												</td>
											</tr>
											</div>
											</tbody>

										</table>

									</div>
								</fieldset>
								<div class="admin-table-page">
									<div id="page" class="page">
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>


			<!--页脚-->
			<div class="layui-footer beg-layout-footer">
				<p>2016 &copy;
					<a href="#">beginner.zhengjinfan.cn</a> LGPL license
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
		<script src="plugins/layui/layui.js "></script>
		<script src="js/layout.js "></script>
		<!--<script>
            //这是js的枚举，哈哈。
			var closedEnum = {
				closeCurrent:'closeCurrent', //关闭当前
				refresh:'refresh',           //刷新
				closeLeft:'closeLeft',       //关闭左侧
				closeRight:'closeRight',     //关闭右侧
				closeOther:'closeOther',     //关闭其他
				closeAll:'closeAll'          //关闭所有
			};
		
			layui.use('jquery', function() {
				var $ = layui.jquery;

				var $contextMenu = $('#contextmenu');

				$(document).on('mousedown', '.layout-nav-card > ul.layui-tab-title', function (e) {
                    //防止事件冒泡
				    e.preventDefault();
					//鼠标右击
					if(e.which === 3) {
						var $this = $(e.target);
					    //元素定位
						$contextMenu.css({
						    left: e.pageX-2,
						    top: e.pageY-2
						}).show()
						.children('ul.layui-nav').children('li.layui-nav-item').each(function () {
						    var $that = $(this);
						    //绑定点击事件
						    $that.on('click', function () {
						        var toggle = $that.data('toggle');
						        var localName = $this[0].localName;
						        var $li;
						        if (localName === 'ul') {
						            $li = $this.children('li.layui-this');
						        } else if (localName === 'i' || localName === 'cite') {
						            $li = $this.parent('li');
						        } else {
						            $li = $this;
						        }
						        switch (toggle) {
						            //关闭当前标签
						            case closedEnum.closeCurrent:
						                $li.children('i.layui-tab-close').click();
						                break;
						            case closedEnum.refresh:
						                layer.msg('你点击了刷新哦');
						                break;
						            case closedEnum.closeLeft:
						                layer.msg('你点击了关闭左侧哦');
						                break;
						            case closedEnum.closeRight:
						                layer.msg('你点击了关闭右侧哦');
						                break;
						            case closedEnum.closeOther:
						                layer.msg('你点击了关闭其他哦');
						                break;
						            case closedEnum.closeAll:
						                layer.msg('你点击了关闭所有哦');
						                break;
						            default:
						                break;
						        }

						        console.log($li);
						    });
						});

						
					    $contextMenu.on('mouseover', function (e) {
						    $(this).show();
						}).on('mouseout', function () {
						    $(this).hide();
						});
					}					
				});
				
				//禁用鼠标右键
				$(document).bind("contextmenu ", function(e) {
					return false;
				});
			});
		</script>-->
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
					pages: 25 //总页数
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
					parent.layer.alert('你点击了搜索按钮')
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