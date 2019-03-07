<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
	<div id="page-wrapper" style="margin-top: -52px;margin-left: -0px">
		<div class="header">
			<h1 class="page-header">订单管理</h1>
			<ol class="breadcrumb">
				<li><a href="admin_index">主页</a></li>
				<li><a href="admin_order_list">订单管理</a></li>
				<li class="active">订单详情</li>
			</ol>

		</div>

		<div id="page-inner">

			<div class="row">
				<div class="col-md-12">
					<!-- 分类管理 Tables -->
					<div class="card">
						<div class="card-action">订单详情</div>
						<div class="card-content">
							<div class="table-responsive">
								订单号：${o.orderCode}
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>图片</th>
											<th>产品名称</th>
											<th>数量</th>
											<th>单价</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${o.orderItems}" var="oi">
											<tr>
												<td align="left"><img width="40px" height="40px"
													src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
												</td>

												<td><a href="foreproduct?pid=${oi.product.id}"> <span>${oi.product.name}</span>
												</a></td>
												<td align="right"><span class="text-muted">${oi.number}个</span>
												</td>
												<td align="right"><span class="text-muted">单价：￥${oi.product.promotePrice}</span>
												</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
								总金额：￥${o.total}
							</div>

						</div>
					</div>

				</div>
			</div>
			<div class="col-md-4 col-md-offset-4"></div>
		</div>
	</div>
</div>
<!-- /. ROW  -->

</div>
<!-- /. PAGE INNER  -->
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
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
