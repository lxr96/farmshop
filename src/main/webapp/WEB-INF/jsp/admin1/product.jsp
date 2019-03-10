<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/header.jsp"%>
<div id="page-wrapper" style="margin-top: -52px; margin-left: -0px">
	<div class="header">
		<h1 class="page-header">产品管理</h1>
		<ol class="breadcrumb">
			<li><a href="admin_index">主页</a></li>
			<li class="active">产品管理</li>
		</ol>
	</div>
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<!-- 产品管理Tables -->
				<div class="card">
					<div class="card-action">产品管理</div>
					<div class="card-content">
						<div class="table-responsive">
							<div id="console" style="margin-bottom: 2%">
								<a class="waves-effect waves-light btn" data-toggle="modal"
									data-target="#addProduct"> <span
									class="glyphicon glyphicon-plus" aria-hidden="true"></span>
									新增产品
								</a> 
								<!-- <a class="waves-effect waves-light btn"> <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</a>-->								
								 <a class="waves-effect waves-light btn" id="del"> <span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
								</a>
							</div>
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th width="4%">
											<p>
												<input type="checkbox" class="filled-in" id="checkAll" /> <label
													for="checkAll"></label>
											</p>
										</th>
										<th>ID</th>
										<th>图片</th>
										<th>类型</th>
										<th>产品名称</th>				
										<th>产品小标题</th>
										<th>原价格</th>
										<th>优惠价格</th>
										<th>库存数量</th>
										<th>产品状态</th>
										<th>图片管理</th>
										<th>设置属性</th>
										<th>编辑</th>
										<th>删除</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ps}" var="p">
										<tr>
											<td><input type="checkbox" class="filled-in"
												id="box_${p.id}" value="${p.id}" /> <label
												for="box_${p.id}"></label></td>
											<td>${p.id}</td>
											<td><c:if test="${!empty p.firstProductImage}">
													<img width="40px"
														src="img/productSingle/${p.firstProductImage.id}.jpg">
												</c:if></td>
											<td>${p.category.name}</td>
											<td>${p.name}</td>
											<td>${p.subTitle}</td>
											<td>${p.originalPrice}</td>
											<td>${p.promotePrice}</td>
											<td>${p.stock}</td>
											<td><c:if test="${p.status==1}">上架</c:if>
											<c:if test="${p.status==0}">下架</c:if>
											
											</td>
											<td><a href="admin_productImage_list?pid=${p.id}"><span
													class="glyphicon glyphicon-picture"></span></a></td>
											<td><a href="admin_propertyValue_edit?pid=${p.id}"><span
													class="glyphicon glyphicon-th-list"></span></a></td>

											<td><a href="admin_product_edit?id=${p.id}"><span
													class="glyphicon glyphicon-edit"></span></a></td>
											<td><a deleteLink="true"
												href="admin1_product_delete?id=${p.id}""><span
													class="     glyphicon glyphicon-trash"></span></a></td>

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

<!--新增产品 modal -->
<form method="post" id="addForm" action="admin_product_all_add">
	<div class="modal fade" id="addProduct" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">新增产品</h4>
				</div>
				<div class="modal-body">
					<table class="addTable">
						<tr>
							<td>选择类别</td>
							<td>
							<select name="cid" class="form-control">
							<c:forEach items="${cs }" var="c">
									<option value="${c.id }">${c.name }</option>
							</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>产品名称</td>
							<td><input id="name" name="name" type="text" required="required"
								class="form-control"></td>
						</tr>
						<tr>
							<td>产品小标题</td>
							<td><input id="subTitle" name="subTitle" type="text"
								class="form-control"></td>
						</tr>
						<tr>
							<td>原价格</td>
							<td><input id="originalPrice" value="99.98" required="required"
								name="originalPrice" type="text" class="form-control"></td>
						</tr>
						<tr>
							<td>优惠价格</td>
							<td><input id="promotePrice" value="19.98" required="required"
								name="promotePrice" type="text" class="form-control"></td>
						</tr>
						<tr>
							<td>库存</td>
							<td><input id="stock" value="99" name="stock" type="text" required="required"
								class="form-control"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary">新增</button>
				</div>
			</div>
		</div>
	</div>
</form>
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
<script>
	$(function() {
		/**为全选绑定点击事件*/
		$("#checkAll").click(function() {
			/**获取其下面的所有checkbox  
			 * 注意这里的input[id^='box_']表示
			    获取input标签，它的id都是以box_开头的，的这一系列的节点
			    这里的^表示的就是开头的意思.
			    这里的attr("checked",this.checked)还需要解释一下，特别是
			    this.checked，这里的this表示的是全选的那个checkbox(#checkAll)的dom元素，
			    也就是拿到这个全选的checkAll的checkbox的checked属性给它就好了
			    $("input[id^='box_']").attr("checked", this.checked);
			 */
			$("input[id^='box_']").prop("checked", this.checked);

		});

		/**还需要为每一个子checkbox绑定事件呢 
		   ，当下面的子checkbox全部都选中的时候，上面的全选按扭
		   也应该要全部选中
		 */
		$("input[id*='box_']").click(function() {//点击每一个子checkbox，都会触发这个事件
			/**获取到下面所有checkbox*/
			var boxs = $("input[id^='box_']");
			if (boxs.length == boxs.filter(":checked").length) {
				$("#checkAll").prop("checked", true);
			} else {
				$("#checkAll").prop("checked", false);
			}

		});

		/**为删除按钮绑定事件*/
		$("#del").click(function() {
			/**获取下面选中的checkbox*/
			var checkedbox = $("input[id^='box_']:checked");
			if (checkedbox.length == 0) {
				alert("请选择要删除的数据！");
			} else {
				if (confirm("你确定要删除吗？")) {
					/**
					                               如下面，如果调用map方法，
					                                会把函数里面的返回值作为jquery对象--res返回
					                               注意，这里的res.toArray()等同于res.toArray().join(",");
					                             它默认就是这样做的呢，这个需要记住嘛
					 */
					var res = checkedbox.map(function() {
						return this.value;
					});
					$.ajax({
						url : "admin_product_delete_list",
						data : {
							"ids" : res.toArray().join(",")
						},
						type : "GET",
						success : function(result) {
							if (result) {
								alert("删除成功！");
								history.go(0);
							} else {
								alert("删除失败！");
								history.go(0);
							}
						}
					});
				}
			}
		});

	});
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>
</body>

</html>
