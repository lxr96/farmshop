<!-- 搜索界面-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="searchProducts">

	<c:forEach items="${page.list}" var="p">
	<div class="productUnit" price="${p.promotePrice}">
		<a href="foreproduct?pid=${p.id}">
			<img class="productImage" src="img/productSingle/${p.firstProductImage.id}.jpg">
		</a>
		<span class="productPrice">¥<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/></span>
		<a class="productLink" href="foreproduct?pid=${p.id}">
				${fn:substring(p.name, 0, 50)}
		</a>
		<div class="show1 productInfo">
			<span class="monthDeal ">月成交 <span class="productDealNumber">${p.saleCount}笔</span></span>
			<span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>
			<span class="wangwang"><img src="img/site/wangwang.png"></span>
		</div>

	</div>
	</c:forEach>
	<c:if test="${empty ps}">
	<div class="noMatch">没有满足条件的产品<div>
		</c:if>

		<div style="clear:both"></div>
	</div>
	
	<script>
$(function(){
    $("ul.pagination li.disabled a").click(function(){
        return false;
    });
});
 
</script>
 <c:if test="${!empty page.list}">
<nav>
  <ul class="pagination">
    <li <c:if test="${!page.hasPreviousPage}">class="disabled"</c:if>>
      <a  href="?pn=1&&keyword=${keyword }" aria-label="Previous" >
        <span aria-hidden="true">«</span>
      </a>
    </li>
 
    <li <c:if test="${!page.hasPreviousPage}">class="disabled"</c:if>>
      <a  href="?pn=${page.pageNum-1 }&&keyword=${keyword }" aria-label="Previous" >
        <span aria-hidden="true">‹</span>
      </a>
    </li>   
 
    <c:forEach items="${page.navigatepageNums }" var="pn">    
	                <li>
	                <a
	                href="?pn=${pn }&&keyword=${keyword }">${pn }
	                </a>
	          </li>
    </c:forEach>
 
    <li <c:if test="${!page.hasNextPage}">class="disabled"</c:if>>
      <a href="?pn=${page.pageNum+1 }&&keyword=${keyword }" aria-label="Next">
        <span aria-hidden="true">›</span>
      </a>
    </li>
    <li <c:if test="${!page.hasNextPage}">class="disabled"</c:if>>
      <a href="?pn=${page.pages }&&keyword=${keyword }" aria-label="Next">
        <span aria-hidden="true">»</span>
      </a>
    </li>
  </ul>
</nav>
</c:if>