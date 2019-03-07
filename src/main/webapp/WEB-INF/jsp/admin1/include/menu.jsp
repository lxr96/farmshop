<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li><a href="admin_index" target="right" class="waves-effect waves-dark"><i
					class="fa fa-dashboard"></i> 主页</a></li>
			<li><a href="admin_category_list"
				class=" waves-effect waves-dark"><i class="fa fa-table"></i>
					分类管理</a></li>
			<li><a href="admin_product_all" class="waves-effect waves-dark"><i
					class="fa fa-edit"></i> 产品管理 </a></li>
			<li><a href="admin_order_list" class="waves-effect waves-dark"><i
					class="fa fa-desktop"></i> 订单管理</a></li>
			<li><a href="admin_user_list" class="waves-effect waves-dark"><i
					class="fa fa-qrcode"></i> 会员管理</a></li>
			<li><a href="admin_report_list" target="right" class="waves-effect waves-dark"><i
					class="fa fa-bar-chart-o"></i> 统计报表</a></li>

		</ul>

	</div>

</nav>
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>

<script>
	$("#main-menu li a").click(function() {
		$this = $(this);
		$this.addClass("active-menu");
	});
</script>