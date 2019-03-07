<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
	<div id="page-wrapper" style="margin-top: -52px;margin-left: -0px">
		<div class="header">
			<h1 class="page-header">分类管理</h1>
			<ol class="breadcrumb">
				<li><a href="admin_index">主页</a></li>
				<li><a href="admin_category_list">分类管理</a></li>
				<li class="active">${c.name}</li>
				<li class="active">属性管理</li>
			</ol>

		</div>

		<div id="page-inner">

			<div class="row">
				<div class="col-md-12">
					<!-- 分类管理 Tables -->
					<div class="card">
						<div class="card-action">属性管理</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>ID</th>
											<th>属性名称</th>
											<th>编辑</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ps}" var="p">

											<tr>
												<td>${p.id}</td>
												<td>${p.name}</td>
												<td><a href="admin_property_edit?id=${p.id}"><span
														class="glyphicon glyphicon-edit"></span></a></td>
												<td><a href="admin_property_delete?id=${p.id}"><span
														class=" 	glyphicon glyphicon-trash"></span></a></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</div>

				</div>
			</div>
			<!--新增属性  -->
			<br> <br>
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-warning addDiv">
					<div class="panel-heading">新增属性</div>
					<div class="panel-body">
						<form method="post" id="addForm" action="admin_property_add">
							<table class="addTable">
								<tr>
									<td>属性名称</td>
									<td><input id="name" name="name" type="text"
										class="form-control"></td>
								</tr>
								<tr class="submitTR">
									<td colspan="2" align="center"><input type="hidden"
										name="cid" value="${c.id}">
										<button type="submit" class="btn btn-success">提 交</button></td>
								</tr>
							</table>
						</form>
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
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
<script>
	$(function() {

		$("#addForm").submit(function() {
			if (checkEmpty("name", "属性名称"))
				return true;
			return false;
		});
	});
</script>
</body>

</html>
