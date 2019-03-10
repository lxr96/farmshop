<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
<div id="page-wrapper" style="margin-top: -52px; margin-left: -0px">
	<div class="header">
		<h1 class="page-header">统计报表</h1>
		<ol class="breadcrumb">
			<li><a href="">主页</a></li>
			<li class="active">统计报表</li>
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
								<h3>
									￥
									<fmt:formatNumber type="number" value="${revenue }"
										maxFractionDigits="1" />
								</h3>
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
			<div class="col-md-6 col-sm-12 col-xs-12">
				<div class="card">
					<div class="card-action">类别销量</div>
					<div class="card-content">
						<div id="salecategory"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12">
				<div class="card">
					<div class="card-action">商品销量</div>
					<div class="card-content">
						<div id="saleproduct"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12">
				<div class="card">
					<div class="card-action">销量</div>
					<div class="card-content">
						<div id="myfirstchart"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12">
				<div class="card">
					<div class="card-action">收入</div>
					<div class="card-content">
						<div id="revenuechart"></div>
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
</script>
<script>
	$(function(){
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
	})
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
<script type="text/javascript">
<!--

//-->


new Morris.Line({
    element: 'myfirstchart',
    data: [
{ day: "2016-07-10", value: 120 },
{ day: "2016-07-11", value: 10 },
{ day: "2016-07-12", value: 5000 },
{ day: "2016-07-13", value: 50 },
{ day: "2016-07-14", value: 55 },
{ day: "2016-07-15", value: 60 },
{ day: "2016-07-16", value: 88 }
],
    // The name of the data record attribute that contains x-values.
    xkey: 'day',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['销量'],
    parseTime:false
});

new Morris.Bar({
    element: 'saleproduct',
    data: [{
        y: '西瓜',
        a: 1000
    }, {
        y: '西1',
        a: 200
    }, {
        y: '2008',
        a: 500
    }, {
        y: '2009',
        a: 75
    }, {
        y: '2010',
        a: 50
    }, {
        y: '2011',
        a: 75
    }, {
        y: '2019',
        a: 100
    }],
    xkey: 'y',
    ykeys: ['a'],
    labels: ['Series A'],
	barColors: [
'#e96562','#414e63',
'#A8E9DC' 
],
    hideHover: 'auto',
    resize: true
});

new Morris.Bar({
    element: 'salecategory',
    data: [{
        y: '水果',
        a: 1000
    }, {
        y: '蔬菜',
        a: 700
    }, {
        y: '水产',
        a: 400
    }],
    xkey: 'y',
    ykeys: ['a'],
    labels: ['销量'],
    hideHover: 'auto',
    resize: true
});
</script>
</body>
</html>