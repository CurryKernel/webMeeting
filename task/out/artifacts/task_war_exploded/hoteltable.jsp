<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Table</title>
		<link rel="stylesheet" href="css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />

		<script language="JavaScript">
			function updateorder(){
				var list=requset.get
			}

		</script>
	</head>

	<body>
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
								<th><input type="checkbox" id="selected-all"></th>
								<th>序号</th>
								<th>用户id</th>
								<th>订房人姓名</th>
								<th>联系方式</th>
								<th>住房人数</th>
								<th>状态</th>
								<th>排序值</th>
								<th>置顶</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody >
							<tr>
								<td><input type="checkbox"></td>
								<td>Layui</td>
								<td>
									<a href="/manage/article_edit_1">演示站点发布成功啦。</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-16 11:50</td>
								<td>1298</td>
								<td>正常</td>
								<td>99</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
								<td width="50px">
									<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
									<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a>
									<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
								</td>
							</tr>

							<tr>
								<td><input type="checkbox"></td>
								<td>Layui</td>
								<td>
									<a href="/manage/article_edit_19">神5飞天震寰宇</a>
								</td>
								<td>就是我</td>
								<td>2016-11-18 10:18</td>
								<td>74</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
								<td>
									<a href="/detail-19" target="_blank">预览</a>
									<a href="/manage/article_edit_19">编辑</a>
									<a href="javascript:;" data-id="19" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>C#</td>
								<td>
									<a href="/manage/article_edit_8">验证（C#和正则表达式）</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:20</td>
								<td>144</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
								<td>
									<a href="/detail-8" target="_blank">预览</a>
									<a href="/manage/article_edit_8">编辑</a>
									<a href="javascript:;" data-id="8" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>博客</td>
								<td>
									<a href="/manage/article_edit_4">博客的功能点收集，欢迎留言。</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-16 16:43</td>
								<td>663</td>
								<td>草稿</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:green;"></i></td>
								<td>
									<a href="/detail-4" target="_blank">预览</a>
									<a href="/manage/article_edit_4">编辑</a>
									<a href="javascript:;" data-id="4" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>C#</td>
								<td>
									<a href="/manage/article_edit_20">1发顺丰范德萨</a>
								</td>
								<td>31</td>
								<td>2016-11-18 13:22</td>
								<td>138</td>
								<td>草稿</td>
								<td>213</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-20" target="_blank">预览</a>
									<a href="/manage/article_edit_20">编辑</a>
									<a href="javascript:;" data-id="20" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JavaScript</td>
								<td>
									<a href="/manage/article_edit_23">124324325</a>
								</td>
								<td>123</td>
								<td>2016-11-19 22:03</td>
								<td>0</td>
								<td>草稿</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-23" target="_blank">预览</a>
									<a href="/manage/article_edit_23">编辑</a>
									<a href="javascript:;" data-id="23" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>Layui</td>
								<td>
									<a href="/manage/article_edit_22">qweqweq</a>
								</td>
								<td>qweqwe</td>
								<td>2016-11-19 00:35</td>
								<td>59</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-22" target="_blank">预览</a>
									<a href="/manage/article_edit_22">编辑</a>
									<a href="javascript:;" data-id="22" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>MongoDB</td>
								<td>
									<a href="/manage/article_edit_21">标题标题标题标题标题</a>
								</td>
								<td>作者</td>
								<td>2016-11-18 15:47</td>
								<td>4</td>
								<td>草稿</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-21" target="_blank">预览</a>
									<a href="/manage/article_edit_21">编辑</a>
									<a href="javascript:;" data-id="21" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>asp.net mvc</td>
								<td>
									<a href="/manage/article_edit_18">asp.net mvc 批量保存 服务端获取客户端传进的数组参数的处理方法</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:33</td>
								<td>83</td>
								<td>草稿</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-18" target="_blank">预览</a>
									<a href="/manage/article_edit_18">编辑</a>
									<a href="javascript:;" data-id="18" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>asp.net mvc</td>
								<td>
									<a href="/manage/article_edit_17">MVC Areas出现“找到多个与名为“Home”的控制器匹配的类型”错误的解决方法</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:32</td>
								<td>149</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-17" target="_blank">预览</a>
									<a href="/manage/article_edit_17">编辑</a>
									<a href="javascript:;" data-id="17" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>Jquery</td>
								<td>
									<a href="/manage/article_edit_16">将一个form表单序列化成一个对象.</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:32</td>
								<td>86</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-16" target="_blank">预览</a>
									<a href="/manage/article_edit_16">编辑</a>
									<a href="javascript:;" data-id="16" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>asp.net mvc</td>
								<td>
									<a href="/manage/article_edit_15">asp.net mvc 下使用过滤器 Filter 实现页面跳转</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:31</td>
								<td>69</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-15" target="_blank">预览</a>
									<a href="/manage/article_edit_15">编辑</a>
									<a href="javascript:;" data-id="15" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>杂七杂八</td>
								<td>
									<a href="/manage/article_edit_14">开发环境、生产环境、测试环境的基本理解和区别</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:30</td>
								<td>37</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-14" target="_blank">预览</a>
									<a href="/manage/article_edit_14">编辑</a>
									<a href="javascript:;" data-id="14" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JavaScript</td>
								<td>
									<a href="/manage/article_edit_13">JavaScript JS 验证身份证号的正确性</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:29</td>
								<td>44</td>
								<td>草稿</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-13" target="_blank">预览</a>
									<a href="/manage/article_edit_13">编辑</a>
									<a href="javascript:;" data-id="13" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>CSS</td>
								<td>
									<a href="/manage/article_edit_12">CSS实现垂直居中6种方法</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:27</td>
								<td>62</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-12" target="_blank">预览</a>
									<a href="/manage/article_edit_12">编辑</a>
									<a href="javascript:;" data-id="12" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JavaScript</td>
								<td>
									<a href="/manage/article_edit_11">在JavaScript 中，给日期加一天</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:26</td>
								<td>37</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-11" target="_blank">预览</a>
									<a href="/manage/article_edit_11">编辑</a>
									<a href="javascript:;" data-id="11" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>C#</td>
								<td>
									<a href="/manage/article_edit_10">[C#] 对List 取交集、连集及差集</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:26</td>
								<td>54</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-10" target="_blank">预览</a>
									<a href="/manage/article_edit_10">编辑</a>
									<a href="javascript:;" data-id="10" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JavaScript</td>
								<td>
									<a href="/manage/article_edit_9">验证（Javascript和正则表达式）</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:22</td>
								<td>23</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-9" target="_blank">预览</a>
									<a href="/manage/article_edit_9">编辑</a>
									<a href="javascript:;" data-id="9" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>网络</td>
								<td>
									<a href="/manage/article_edit_7">win7网络连接不上默认网关不可用解决方案</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:18</td>
								<td>31</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-7" target="_blank">预览</a>
									<a href="/manage/article_edit_7">编辑</a>
									<a href="javascript:;" data-id="7" data-opt="del">删除</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JavaScript</td>
								<td>
									<a href="/manage/article_edit_6">Js中的window.parent ,window.top,window.self 详解</a>
								</td>
								<td>Beginner</td>
								<td>2016-11-17 14:17</td>
								<td>23</td>
								<td>正常</td>
								<td>0</td>
								<td style="text-align:center;"><i class="layui-icon" style="color:red;">ဇ</i></td>
								<td>
									<a href="/detail-6" target="_blank">预览</a>
									<a href="/manage/article_edit_6">编辑</a>
									<a href="javascript:;" data-id="6" data-opt="del">删除</a>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
			</fieldset>
			<div class="admin-table-page">
				<div id="page" class="page">
				</div>
			</div>
		</div>

		<script type="text/javascript" src="js/layui.js"></script>
		<script>
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