<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,700">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styletable.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
	<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link type="text/css" href="${pageContext.request.contextPath}/css/styles.css" media="all" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/stickysort.css" media="all" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/topbutton.css" media="all" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/style_animal.css" media="all" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/animal.css" media="all" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/style_search.css" media="all" rel="stylesheet" />
	<script text="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
	<script>
		$(function () {
			// 给删除的a标签绑定单击事件，用于删除的确认提示操作
			$("#deletebutton").click(function () {
				return confirm("你确定要删除这条信息吗?");
			});
		});

		function searchUser_hotel(){
			var userId = $("#searchid").val();
			location.href = "${pageContext.request.contextPath}/OrderHotel?action=orderbyUser_Hotel&hotelId=<%=request.getParameter("hotelId")%>&userId="+userId;
		}
	</script>


</head>
<body>
<div class="htmleaf-container">
	<header class="htmleaf-header">

		<div class="htmleaf-links">
			<a class="htmleaf-icon icon-htmleaf-home-outline" href="login.jsp" title="回到主页" target="_blank"><span> 回到主页</span></a>
			<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="" title="回到酒店页" target="_blank"><span> 回到酒店页</span></a>
		</div>
	</header>



	<main id="content">

		<section class="demo" id="basic">
			<h2>酒店列表</h2>
			<br>
			<a class="button large regular red" style="background-color: #ff6c6f;display: inline-block" href="${pageContext.request.contextPath}/hotelorder_add.jsp?hotelId=<%=request.getParameter("hotelId")%>">增加订单</a>
			<div class="search d4" style="display: inline-block">
				<form style="display: inline-block">
					<input type="text"  placeholder="请输入用户id进行搜索">
					<button type="button" onclick="searchUser_hotel()"></button>
				</form>
			</div>

			<table>
				<thead>
				<tr>
					<th><input type="checkbox" id="selected-all"></th>
					<th>序号</th>
					<th>用户id</th>
					<th>订房人姓名</th>
					<th>联系方式</th>
					<th>住房人数</th>
					<th>入住时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tfoot>
				<tr>
					<th><input type="checkbox"></th>
					<th>序号</th>
					<th>用户id</th>
					<th>订房人姓名</th>
					<th>联系方式</th>
					<th>住房人数</th>
					<th>入住时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				</tfoot>
				<tbody>

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
						<td>
							<a href="${pageContext.request.contextPath}/OrderHotel?action=getorderbyUser_Hotel_meeting&hotelId=${page1.getHotelId()}&userId=${page1.getUserId()}&meetingId=${page1.getMeetingId()}" class="button small regular yellow" style="font-size: .75em;background-color: #fff6c6" >修改</a>
							<a href="${pageContext.request.contextPath}/OrderHotel?action=delete_order&hotelId=${page1.getHotelId()}&userId=${page1.getUserId()}" class="button small regular yellow" style="font-size: .75em;background-color: #fff6c6" id="deletebutton">删除</a>
						</td>
					</tr>
					<c:set value="${num+1}" var="num"/>
				</c:forEach>
				</tbody>


				<!--<tr>
					<td class="user-name">1</td>
					<td class="user-name">1</td>
					<td class="user-avatar">
						<img src="http://api.randomuser.me/0.2/portraits/women/31.jpg" alt="samantha morgan" title="samantha morgan" />
					</td>
					<td class="user-name">samantha morgan</td>
					<td class="user-phone">(369)-227-3751</td>
					<td class="user-email">samantha.morgan56@example.com</td>
					<td class="user-location">grapevine, idaho</td>
					<td class="user-location">grapevine, idaho</td>
					<td class="user-location">grapevine, idaho</td>
					<td>
						<a class="button small regular yellow" style="font-size: .75em;background-color: #fff6c6" href="javascript:void(0);">修改</a>
						<a class="button small regular yellow" style="font-size: .75em;background-color: #fff6c6" href="javascript:void(0);">删除</a>
					</td>

				</tr>-->

			</table>
			<p>
				<%@include file="/hotelpage.jsp"%>
			</p>
		</section>

		<main id=app>

			<mochi-box shiba="ume" mood="happy" blush
					   left-eye="laugh" right-eye="laugh"
					   left-ear="down" right-ear="down">
				<h2>Hotel Manager</h2>
				<br>
				<h3>
					<br>
					<a target="_blank" href="">欢迎光临，你的酒店界面</a>
					<br>
				</h3>
				<br>
				<p class="shop kotobuki" title="kotobuki">请点击左侧按钮查看你的订单信息</p>
			</mochi-box>
		</main>
	</main>
</div>

	<div id="wrapper" class="wrapper">
	  <main>

	    <div class="container">

	      <section>
	      </section>
	    </div>
	  </main>
	</div><!-- /wrapper -->

	<button id="mm-menu-toggle" class="mm-menu-toggle">查询菜单</button>
	<nav id="mm-menu" class="mm-menu">
	  <div class="mm-menu__header" style="background-color:brown">
	    <h2 class="mm-menu__title"><a>酒店查询</a></h2>
	  </div>
	  <ul class="mm-menu__items">

		  <li class="mm-menu__item">
	      <a class="mm-menu__link" href="${pageContext.request.contextPath}/OrderHotel?action=page&hotelId=<%=request.getParameter("hotelId")%>">
			  <span class="mm-menu__link-text"><i class="md md-home"></i> 全部订单</span>
	      </a>
	    </li>

	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="${pageContext.request.contextPath}/OrderHotel?action=orderbyState_Hotel&state=0&hotelId=<%=request.getParameter("hotelId")%>">
	        <span class="mm-menu__link-text"><i class="md md-person"></i> 未审核订单</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="${pageContext.request.contextPath}/OrderHotel?action=orderbyState_Hotel&state=1&hotelId=<%=request.getParameter("hotelId")%>">
	        <span class="mm-menu__link-text"><i class="md md-inbox"></i> 审核未通过订单</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="${pageContext.request.contextPath}/OrderHotel?action=orderbyState_Hotel&state=2&hotelId=<%=request.getParameter("hotelId")%>">
	        <span class="mm-menu__link-text"><i class="md md-favorite"></i> 审核通过订单</span>
	      </a>
	    </li>
	    <li class="mm-menu__item">
	      <a class="mm-menu__link" href="${pageContext.request.contextPath}/OrderHotel?action=orderbyPeople_Hotel&minpeople=3&maxpeople=5&hotelId=<%=request.getParameter("hotelId")%>">
	        <span class="mm-menu__link-text"><i class="md md-settings"></i> 套房(3<=人数<=5)订单</span>
	      </a>
	    </li>
		  <li class="mm-menu__item">
			  <a class="mm-menu__link" href="${pageContext.request.contextPath}/OrderHotel?action=orderbyPeople_Hotel&minpeople=1&maxpeople=2&hotelId=<%=request.getParameter("hotelId")%>">
				  <span class="mm-menu__link-text"><i class="md md-settings"></i> 标间/大床房(<=2)订单</span>
			  </a>
		  </li>
	  </ul>
	</nav><!-- /nav -->
	
	<script src="${pageContext.request.contextPath}/js/production/materialMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.17/vue.min.js'></script>
<script  src="${pageContext.request.contextPath}/js/script_animal.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.stickysort.js"></script>
<script>
	$(function () {
		// We select for tables universally - you can change the selector to target the tables you want
		// Basic table
		$('#basic table').stickySort();

		// Basic table with sort
		$('#basic-sort table').stickySort({ sortable: true });

		// Biaxial
		$('#biaxial .bx1').stickySort();
		$('#biaxial .bx2').stickySort({ sortable: true });

		// Final
		$('#final table').stickySort({ sortable: true });

		// The codes below has no impact on the functionality of StickySort functionality
		//-----------------------------------------------------------------------------------------------------------------
		// Smooth scrolling plugin by Chris Coiyer
		// Source: http://css-tricks.com/snippets/jquery/smooth-scrolling/
		$('a[href*=#]:not([href=#])').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top
					}, 1000);
					return false;
				}
			}
		});

		// Section toggle
		$('section.demo h2')
				.append('<a href="#" title="Collapse section" class="toggle">Collapse</a>')
				.on('click', 'a', function(e) {
					e.preventDefault();
					if(!$(this).data('state') || $(this).data('state') == 0) {
						$(this)
								.data('state', 1)
								.attr('title', 'Expand section')
								.text('Expand')
								.parent()
								.siblings()
								.stop(true,true).slideUp();
					} else {
						$(this)
								.data('state', 0)
								.attr('title', 'Collapse section')
								.text('Collapse')
								.parent()
								.siblings()
								.stop(true,true).slideDown();
					}
				});

		// Unrelated to sticky header function
		$('table').each(function () {
			if($(this).attr('data-color') != undefined) {
				$(this).find('tbody td').each(function() {
					if($(this).text().match(/^\d+$/)) {
						$(this).css({
							'background-color': 'hsl('+parseInt($(this).text())+',75%,85%)'
						});
					}
				});
			}
		});
	});
</script>
	<script>
	  var menu = new Menu;
	</script>
</body>
</html>