



<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<div >
	<a href="${contextPath}">
		<img id="simpleLogo" class="simpleLogo" src="img/site/simpleLogo.png">
	</a>

	<form action="foresearch" method="post" >
		<div class="simpleSearchDiv pull-right">
			<input type="text" placeholder="请输入关键词"  value="${param.keyword}" name="keyword">
			<button class="searchButton" type="submit">搜索</button>
			<div class="searchBelow">
				<c:forEach items="${cs}" var="c" varStatus="st">
					<c:if test="${st.count>=8 and st.count<=11}">
					<span>
						<a href="forecategory?cid=${c.id}">
								${c.name}
						</a>
						<c:if test="${st.count!=11}">
							<span>|</span>
						</c:if>
					</span>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</form>
	<div style="clear:both"></div>
</div>