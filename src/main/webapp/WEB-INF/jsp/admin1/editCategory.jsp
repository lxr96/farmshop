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
				<li class="active">编辑分类</li>
			</ol>

		</div>

		<div id="page-inner">

			<div class="row">
				<div class="col-md-12">
					<!-- 编辑分类 Tables -->
					<div class="card">
						<div class="card-action">编辑分类</div>
						<div class="card-content">
							<div class="row">
								<div class="col-md-4 col-md-offset-4">
									<div class="panel panel-warning editDiv">
										<div class="panel-heading">编辑分类</div>
										<div class="panel-body">
											<form method="post" id="editForm"
												action="admin_category_update" enctype="multipart/form-data">
												<table class="editTable">
													<tr>
														<td>分类名称</td>
														<td><input id="name" name="name" value="${c.name}"
															type="text" class="form-control"></td>
													</tr>
													<tr class="submitTR">
														<td colspan="2" align="center"><input type="hidden"
															name="id" value="${c.id}">
															<button type="submit" class="btn btn-success">提
																交</button></td>
													</tr>
												</table>
											</form>
										</div>
									</div>

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
<script>
    $(function(){

        $("#editForm").submit(function(){
            if(!checkEmpty("name","分类名称"))
                return false;

            return true;
        });
    });

</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
