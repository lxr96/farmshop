<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
	<div id="page-wrapper" style="margin-top: -52px;margin-left: -0px">
		<div class="header">
			<h1 class="page-header">会员管理</h1>
			<ol class="breadcrumb">
				<li><a href="admin_index">主页</a></li>
				<li class="active">会员管理</li>
			</ol>

		</div>

		<div id="page-inner">

			<div class="row">
				<div class="col-md-12">
					<!-- 订单管理Tables -->
					<div class="card">
						<div class="card-action">会员管理</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>ID</th>
											<th>用户名称</th>
											<th width="180px">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${us}" var="u">
											<tr>
												<td>${u.id}</td>
												<td>${u.name}</td>
												<td>
													<a href="admin_user_detail?id=${u.id }"><button class="btn btn-primary btn-xs">查看详情</button></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
		</div>
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
<!-- DATA TABLE SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').dataTable();
	});
	$(function() {
		$("a").click(function() {
			var deleteLink = $(this).attr("deleteLink");
			console.log(deleteLink);
			if ("true" == deleteLink) {
				var confirmDelete = confirm("确认要删除");
				if (confirmDelete)
					return true;
				return false;

			}
		});
	})
	$(document).ready(function() {

		$("#main-menu li a").each(function() {
			$this = $(this);
			if ($this[0].href == String(window.location.href)) {
				$this.addClass("active-menu");
			}
		});
	});
</script>
</body>

</html>
