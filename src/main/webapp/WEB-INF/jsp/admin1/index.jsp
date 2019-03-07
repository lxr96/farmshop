<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
<!--导航条  -->
<%@include file="include/navbar.jsp"%>
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li><a href="admin_home" target="rightDiv"
				class="waves-effect waves-dark active-menu"><i class="fa fa-dashboard"></i>
					主页</a></li>
			<li><a href="admin_category_list" target="rightDiv"
				class=" waves-effect waves-dark"><i class="fa fa-table"></i>
					分类管理</a></li>
			<li><a href="admin_product_all" target="rightDiv"
				class="waves-effect waves-dark"><i class="fa fa-edit"></i> 产品管理
			</a></li>
			<li><a href="admin_order_list" target="rightDiv"
				class="waves-effect waves-dark"><i class="fa fa-desktop"></i>
					订单管理</a></li>
			<li><a href="admin_user_list" target="rightDiv"
				class="waves-effect waves-dark"><i class="fa fa-qrcode"></i>
					会员管理</a></li>
			<li><a href="admin_report_list" target="rightDiv"
				class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>
					统计报表</a></li>
		</ul>
	</div>
</nav>
<div id="page-wrapper">
		<iframe src="admin_home" name="rightDiv" width="100%" height="1000"> </iframe>
		<!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>

<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/materialize/js/materialize.min.js"></script>

<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>


<script src="assets/js/easypiechart.js"></script>
<script src="assets/js/easypiechart-data.js"></script>

<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
<script>
	$("#main-menu li a").click(function() {
		$this = $(this);
		$(this).parent().siblings().children('a').removeClass("active-menu");
		$this.addClass("active-menu");
	});
</script>
</body>

</html>