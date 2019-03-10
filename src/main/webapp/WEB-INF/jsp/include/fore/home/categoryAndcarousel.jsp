<!-- 主页分类条-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
<div class="col-md-12" style="margin-left: -1px;">
    	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="forehotproduct">热销商品</a></li>
				<li class="interval">|</li>
				<li><a href="foresearch">最新商品</a></li>
			</ul>
		</div>
	</div>
</div>
</div>
<div class="center_con clearfix">
	<ul class="subnav fl">
	    <c:forEach items="${cs}" var="c">
	    <li><a href="foresearch?cid=${c.id}" class="fruit">${c.name }</a></li>
	    </c:forEach>
	</ul>
	<div class="slide fl">
		<ul class="slide_pics">
			<li><img src="index/images/slide.jpg" alt="幻灯片"></li>
			<li><img src="index/images/slide02.jpg" alt="幻灯片"></li>
			<li><img src="index/images/slide03.jpg" alt="幻灯片"></li>
			<li><img src="index/images/slide04.jpg" alt="幻灯片"></li>
		</ul>
		<div class="prev"></div>
		<div class="next"></div>
		<ul class="points"></ul>
	</div>
	<div class="adv fl">
	<a href="#"><img src="index/images/adv01.jpg"></a> <a href="#"><img
			src="index/images/adv02.jpg"></a>
	<!--  
		<a href="#"><img src="index/images/adv01.jpg"></a> <a href="#"><img
			src="index/images/adv02.jpg"></a>-->
	</div>
</div>



