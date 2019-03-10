<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
		<div id="page-wrapper" style="margin-top: -52px;margin-left: -0px">
			<div class="header">
				<h1 class="page-header">主页</h1>
				<ol class="breadcrumb">
					<li><a href="">主页</a></li>
					<li class="active">数据分析</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="dashboard-cards">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-3">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image red">
									<i class="material-icons dp48">import_export</i>
								</div>
								<div class="card-stacked red">
									<div class="card-content">
										<h3>￥<fmt:formatNumber type="number" value="${revenue }" maxFractionDigits="1"/></h3>
									</div>
									<div class="card-action">
										<strong>收入</strong>
									</div>
								</div>
							</div>

						</div>
						<div class="col-xs-12 col-sm-6 col-md-3">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image orange">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked orange">
									<div class="card-content">
										<h3>${sales }</h3>
									</div>
									<div class="card-action">
										<strong>销量</strong>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-3">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image blue">
									<i class="material-icons dp48">equalizer</i>
								</div>
								<div class="card-stacked blue">
									<div class="card-content">
										<h3>${products }</h3>
									</div>
									<div class="card-action">
										<strong>产品数量</strong>
									</div>
								</div>
							</div>

						</div>
						<div class="col-xs-12 col-sm-6 col-md-3">

							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image green">
									<i class="material-icons dp48">supervisor_account</i>
								</div>
								<div class="card-stacked green">
									<div class="card-content">
										<h3>${users }</h3>
									</div>
									<div class="card-action">
										<strong>用户数量</strong>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-8">
						<div class="row">
							<div class="col-xs-12">
								<div class="card"  style="height: 470px">
					<div class="card-action">收入</div>
					<div class="card-content">
						<div id="revenuechart"></div>
					</div>
				</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4">
					
					
						<div class="cirStats">
							<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-12">
									<div class="card-panel text-center">
										<h4>利润 :￥<fmt:formatNumber type="number" value="${revenue*(0.65) }" maxFractionDigits="1"/></h4>
										<div class="easypiechart" id="easypiechart-blue"
											data-percent="65">
											<span class="percent">65%</span>
										</div>
									</div>
									<div class="card-panel text-center">
										<h4>成本 :￥<fmt:formatNumber type="number" value="${revenue*(0.35) }" maxFractionDigits="1"/>

										</h4>
										<div class="easypiechart" id="easypiechart-red"
											data-percent="35">
											<span class="percent">35%</span>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					<!--/.row-->

					<!--/.row-->
				</div>
				<!-- /. ROW  -->

				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
		</div>
	<!-- /. WRAPPER  -->
	
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
		$.ajax({
			url : "report_date",
			type : "GET",
			dataType: 'json',
			success : function(result) {
	            //1周
	            new Morris.Line({
	                element: 'revenuechart',
	                data: result["report"],
	                xkey: 'day',
	                ykeys: ['revenue'],
	                labels: ['总收入：￥'],
	                fillOpacity: 0.6,
	                hideHover: 'auto',
	                behaveLikeLine: true,
	                resize: true,
	                pointFillColors:['#ffffff'],
	                pointStrokeColors: ['black'],
	                lineColors:['gray','#414e63']
		      });
			}
		});
	})
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>

</body>
</html>