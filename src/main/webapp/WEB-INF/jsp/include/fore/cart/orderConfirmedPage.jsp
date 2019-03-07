<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div class="confirmPayImageDiv">
	<img src="img/site/orderConfirmed.png">
	<div class="confirmPayTime1">
		<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss" />
	</div>
	<div class="confirmPayTime2">
		<fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss" />
	</div>
	<div class="confirmPayTime3">
		<fmt:formatDate value="${o.deliveryDate}"
			pattern="yyyy-MM-dd HH:mm:ss" />
	</div>
	<div class="confirmPayTime4">
		<fmt:formatDate value="${o.confirmDate}"
			pattern="yyyy-MM-dd HH:mm:ss" />
	</div>


</div>
<div class="orderFinishDiv">
	<div class="orderFinishTextDiv">
		<img src="img/site/orderFinish.png"> <span>交易已经成功，卖家将收到您的货款。</span>
	</div>
</div>