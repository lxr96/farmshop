<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
<div id="page-wrapper" style="margin-top: -52px; margin-left: -0px">
	<div class="header">
		<h1 class="page-header">分类管理</h1>
		<ol class="breadcrumb">
			<li><a href="admin_index">主页</a></li>
			<li class="active">分类管理</li>
		</ol>
	</div>

	<div id="page-inner">

		<div class="row">
			<div class="col-md-12">
				<!-- 分类管理 Tables -->
				<div class="card">
					<div class="card-action">分类管理</div>
					<div class="card-content">
						<div class="table-responsive">
							<div id="console" style="margin-bottom: 2%">
								<a class="waves-effect waves-light btn" data-toggle="modal"
									data-target="#addCategory"> <span
									class="glyphicon glyphicon-plus" aria-hidden="true"></span>
									新增分类
								</a> <a class="waves-effect waves-light btn"> <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</a> <a class="waves-effect waves-light btn"> <span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
								</a>
							</div>
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>ID</th>
										<th>分类名称</th>
										<th>属性管理</th>
										<th>产品管理</th>
										<th>编辑</th>
										<th>删除</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cs}" var="c">

										<tr class="gradeA">
											<td>${c.id}</td>
											<td>${c.name}</td>

											<td><a href="admin_property_list?cid=${c.id}"><span
													class="glyphicon glyphicon-th-list"></span></a></td>
											<td><a href="admin_product_list?cid=${c.id}"><span
													class="glyphicon glyphicon-shopping-cart"></span></a></td>
											<td><a href="admin_category_edit?id=${c.id}"><span
													class="glyphicon glyphicon-edit"></span></a></td>
											<td><a deleteLink="true"
												href="admin_category_delete?id=${c.id}"><span
													class="glyphicon glyphicon-trash"></span></a></td>

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
<!--新增分类 modal -->
<form method="post" id="addForm" action="admin_category_add"
						enctype="multipart/form-data">
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">新增分类</h4>
			</div>
			<div class="modal-body">
						<table class="addTable">
							<tr>
								<td>分类名称</td>
								<td><input id="name" name="name" type="text"
									class="form-control" required="required" placeholder="分类名称"></td>
							</tr>
						</table>		
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">新增</button>
			</div>
		</div>
	</div>
</div></form>
<!-- /. ROW  -->
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
	$(document).ready(function() {

		$("#main-menu li a").each(function() {
			$this = $(this);
			if ($this[0].href == String(window.location.href)) {
				$this.addClass("active-menu");
			}
		});
	});

	$(function() {
		$("a").click(function() {
			var deleteLink = $(this).attr("deleteLink");
			console.log(deleteLink);
			if ("true" == deleteLink) {
				var confirmDelete = confirm("确认要删除吗?");
				if (confirmDelete)
					return true;
				return false;

			}
		});
	})
	$(function() {

		$("#addForm").submit(function() {
			if (!checkEmpty("name", "分类名称"))
				return false;
			return true;
		});
	});
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
