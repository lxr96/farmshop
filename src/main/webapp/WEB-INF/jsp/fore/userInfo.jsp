<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/fore/header.jsp"%>
<%@include file="../include/fore/top.jsp"%>
<%@include file="../include/fore/search.jsp"%>

<div class="row" style="margin-bottom: 50px;">
	<div class="col-md-4 col-md-offset-4">
		<h3>个人信息</h3>
	</div>
</div>

<!-- 个人信息 -->
<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<form class="form-horizontal" action="update_usedetail_info" method="post">
		<c:if test="${!empty user.userDetail.uid }">
		<input type="hidden" class="form-control" name="id" value="${user.userDetail.id }">
		</c:if>
		<input type="hidden" class="form-control" name="uid" value="${user.id }">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">真实姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name" required="required" value="${user.userDetail.name }"
						placeholder="真实姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">性别&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<div class="col-sm-10">

					<div class="input-group input-group-lg">
						<label class="radio-inline"> <input type="radio"
							name="sex" id="inlineRadio1" value="male" <c:if test="${user.userDetail.sex=='male' }">checked="checked"</c:if>  > 男
						</label> <label class="radio-inline"> <input type="radio"
							name="sex" id="inlineRadio2" value="female" <c:if test="${user.userDetail.sex=='female' }">checked="checked"</c:if>  > 女
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">手机号码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone" name="phone" value="${user.userDetail.phone }"
						placeholder="手机号码" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">收货地址</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="address" required="required" placeholder="收货地址">${user.userDetail.address }</textarea>
				</div>
			</div>
			<div class="form-group" style="margin-bottom: 100px;">
				<div class="col-sm-offset-2 col-sm-10" style="margin-left: 50%;">
					<button type="submit" class="btn btn-success"  id="submit">修改提交</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<%@include file="../include/fore/footer.jsp"%>
