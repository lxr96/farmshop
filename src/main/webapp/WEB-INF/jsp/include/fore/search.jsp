<!-- 主页搜索模块-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	<div class="search_bar clearfix">
		<a href="${contextPath}" class="logo fl"><img
			src="img/site/logo.png" style="width: 240px; height: 60px;"></a>		
		<div class="search_con fl">
		     
			 <input type="text" class="input_text fl" name="keyword"
				value="${param.keyword}" placeholder="搜索商品"> <input
				type="submit" class="input_btn fr" value="搜索">
		</div>
		<select name="cid" class="form-control" style="width: 120px;margin-top: 40px;">
			       <option value="0" >全部</option>
				<c:forEach items="${cs }" var="c">
					<option value="${c.id }" <c:if test="${cid==c.id }">selected = "selected"</c:if>>${c.name }</option>
				</c:forEach>
			</select>
		</div>
-->

<form action="foresearch" method="post">	
	<div class="search_bar clearfix">
	<div>
		<a href="${contextPath}" class="logo fl"><img
			src="img/site/logo.png" style="width: 240px; height: 60px;"></a>	</div>
		<div style="margin-left: 25%;">
		
		<select name="cid" class="form-control" style="width: 120px;margin-top: 40px;">
			       <option value="0" >全部</option>
				<c:forEach items="${cs }" var="c">
					<option value="${c.id }" <c:if test="${cid==c.id }">selected = "selected"</c:if>>${c.name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="search_con fl" style="margin-left: 38%;margin-top:-4%">
			 <input type="text" class="input_text fl" name="keyword"
				value="${param.keyword}" placeholder="搜索商品"> <input
				type="submit" class="input_btn fr" value="搜索">
		</div>
	
		</div>
		
	</form>	
