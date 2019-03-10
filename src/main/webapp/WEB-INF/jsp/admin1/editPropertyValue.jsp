<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
	<div id="page-wrapper" style="margin-top: -52px;margin-left: -0px">
			<div class="header">
				<h1 class="page-header">产品管理</h1>
				<ol class="breadcrumb">
					<li><a href="admin_index">主页</a></li>
					<li><a href="admin_product_all">产品管理</a></li>
					<li class="active">${p.name}</li>
					<li class="active">编辑产品属性</li>
				</ol>
			</div>
			<div id="page-inner">

				<div class="row">
					<div class="col-md-12">
						<!-- 分类管理 Tables -->
						<div class="card">
							<div class="card-action">编辑产品属性</div>
							<div class="card-content">
								<div class="editPVDiv">
									<c:forEach items="${pvs}" var="pv">
										<div class="eachPV">
											<span class="pvName">${pv.property.name}</span> <span
												class="pvValue"><input class="pvValue"
												pvid="${pv.id}" type="text" value="${pv.value}"></span>
										</div>
									</c:forEach>
									<div style="clear: both"></div>
								</div>
							</div>
						</div>

					</div>
				</div>
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
	<script>
		$(function() {
			$("input.pvValue").keyup(function() {
				var value = $(this).val();
				var page = "admin_propertyValue_update";
				var pvid = $(this).attr("pvid");
				var parentSpan = $(this).parent("span");
				parentSpan.css("border", "1px solid yellow");
				$.post(page, {
					"value" : value,
					"id" : pvid
				}, function(result) {
					if ("success" == result)
						parentSpan.css("border", "1px solid green");
					else
						parentSpan.css("border", "1px solid red");
				});
			});
		});
	</script>
	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
