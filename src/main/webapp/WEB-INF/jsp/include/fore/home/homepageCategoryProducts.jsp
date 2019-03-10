<!-- 商品显示-->


<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${empty param.categorycount}">
	<c:set var="categorycount" scope="page" value="100" />
</c:if>

<c:if test="${!empty param.categorycount}">
	<c:set var="categorycount" scope="page" value="${param.categorycount}" />
</c:if>



<c:forEach items="${cs}" var="c" varStatus="stc">
<div class="row">
<div class="col-md-12">
	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model01">${c.name}</h3>
			<a href="foresearch?cid=${c.id}" class="goods_more fr" id="fruit_more">查看更多 ></a>
		</div>
		<c:forEach items="${c.products}" var="p" varStatus="st">
					<c:if test="${st.count<=12}">
						<div class="productItem">
							<a href="foreproduct?pid=${p.id}"><img width="100px"
								src="img/productSingle_middle/${p.firstProductImage.id}.jpg"></a>
							<a class="productItemDescLink" href="foreproduct?pid=${p.id}">
								<span class="productItemDesc">[热销] ${fn:substring(p.name, 0, 20)}
							</span>
							</a> <span class="productPrice"> ￥<fmt:formatNumber
									type="number" value="${p.promotePrice}" minFractionDigits="2" />
							</span>
						</div>
					</c:if>
				</c:forEach>
	</div>
</div>
</div>

</c:forEach>
