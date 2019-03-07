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
					<li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
					<li class="active">${p.name}</li>
					<li class="active">产品图片管理</li>
				</ol>

			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<!-- 分类管理 Tables -->
						<div class="card">
							<div class="card-action">产品图片管理</div>
							<div class="card-content">
								<div class="table-responsive">

									<!--新增产品图片  -->
									<div class="row">
										<!--新增产品单个图片  -->
										<div class="col-md-4 col-md-offset-2">
											<div class="panel panel-warning addPictureDiv">
												<div class="panel-heading">
													新增产品<b class="text-primary"> 单个 </b>图片
												</div>
												<div class="panel-body">
													<form method="post" class="addFormSingle"
														action="admin_productImage_add"
														enctype="multipart/form-data">
														<table class="addTable">
															<tr>
																<td>请选择本地图片 尺寸400X400 为佳</td>
															</tr>
															<tr>
																<td><input id="filepathSingle" type="file"
																	name="image" /></td>
															</tr>
															<tr class="submitTR">
																<td align="center"><input type="hidden" name="type"
																	value="type_single" /> <input type="hidden" name="pid"
																	value="${p.id}" />
																	<button type="submit" class="btn btn-success">提
																		交</button></td>
															</tr>
														</table>
													</form>
												</div>
											</div>
											<table
												class="table table-striped table-bordered table-hover  table-condensed">
												<thead>
													<tr class="success">
														<th>ID</th>
														<th>产品单个图片缩略图</th>
														<th>删除</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${pisSingle}" var="pi">
														<tr>
															<td>${pi.id}</td>
															<td><a title="点击查看原图"
																href="img/productSingle/${pi.id}.jpg"><img
																	height="50px" src="img/productSingle/${pi.id}.jpg"></a>
															</td>
															<td><a href="admin_productImage_delete?id=${pi.id}" onclick="del()"><span
																	class=" 	glyphicon glyphicon-trash"></span></a></td>

														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- 多图片 -->
										<div class="col-md-4">
											<div class="panel panel-warning addPictureDiv">
												<div class="panel-heading">
													新增产品<b class="text-primary"> 详情 </b>图片
												</div>
												<div class="panel-body">
													<form method="post" class="addFormDetail"
														action="admin_productImage_add"
														enctype="multipart/form-data">
														<table class="addTable">
															<tr>
																<td>请选择本地图片 宽度790 为佳</td>
															</tr>
															<tr>
																<td><input id="filepathDetail" type="file"
																	name="image" /></td>
															</tr>
															<tr class="submitTR">
																<td align="center"><input type="hidden" name="type"
																	value="type_detail" /> <input type="hidden" name="pid"
																	value="${p.id}" />
																	<button type="submit" class="btn btn-success">提
																		交</button></td>
															</tr>
														</table>
													</form>
												</div>
											</div>
											<table
												class="table table-striped table-bordered table-hover  table-condensed">
												<thead>
													<tr class="success">
														<th>ID</th>
														<th>产品详情图片缩略图</th>
														<th>删除</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${pisDetail}" var="pi">
														<tr>
															<td>${pi.id}</td>
															<td><a title="点击查看原图"
																href="img/productDetail/${pi.id}.jpg"><img
																	height="50px" src="img/productDetail/${pi.id}.jpg"></a>
															</td>
															<td><a href="admin_productImage_delete?id=${pi.id}" onclick="del()"><span
																	class=" 	glyphicon glyphicon-trash"></span></a></td>

														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- end产品图片 -->
									</div>
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
	<!-- Custom Js -->
	<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
