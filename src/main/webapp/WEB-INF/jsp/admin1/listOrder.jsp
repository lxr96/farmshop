<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
	<div id="page-wrapper" style="margin-top: -52px;margin-left: -0px">
		<div class="header">
			<h1 class="page-header">订单管理</h1>
			<ol class="breadcrumb">
				<li><a href="admin_index">主页</a></li>
				<li class="active">订单管理</li>
			</ol>

		</div>

		<div id="page-inner">

			<div class="row">
				<div class="col-md-12">
					<!-- 订单管理Tables -->
					<div class="card">
						<div class="card-action">订单管理</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>ID</th>
											<th>状态</th>
											<th width="100px">买家名称</th>
											<th>订单号</th>
											<th width="100px">商品数量</th>
											<th>金额</th>
											<th>支付时间</th>
											<th>发货时间</th>
											<th>确认收货时间</th>
											<th width="180px">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${os}" var="o">
											<tr>
												<td>${o.id}</td>
												<td>${o.statusDesc}</td>
												<td align="center">${o.user.name}</td>
												<td>${o.orderCode}</td>
												<td align="center">${o.totalNumber}</td>
								
												<td>￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></td>
												<td><fmt:formatDate value="${o.payDate}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${o.deliveryDate}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${o.confirmDate}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>

												<td>
													
													<a href="admin_order_detail?id=${o.id}"><button class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button></a>

													<c:if test="${o.status=='waitDelivery'}">
														<a href="admin_order_delivery?id=${o.id}">
															<button class="btn btn-primary btn-xs">发货</button>
														</a>
													</c:if>
													
													<c:if test="${o.status=='waitReturn'}">
														<a href="admin_order_return_success?id=${o.id}">
															<button class="btn btn-primary btn-xs">退款</button>
														</a>
													</c:if>
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
<!-- /. PAGE WRAPPER  -->
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
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
