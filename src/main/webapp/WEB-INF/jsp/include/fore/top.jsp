<!-- 顶条，检查登录-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){     
    $(".login").click(function(){
        var page = "forecheckLogin";
        $.get(
                page,
                function(result){
                    if("success"==result){
                    	alert("已经登录")
                    }
                    else{
                        $("#loginModal").modal('show');                     
                    }
                }
        );      
        return false;
    }); 
    
    $("button.loginSubmitButton").click(function(){
        var name = $("#name").val();
        var password = $("#password").val();
         
        if(0==name.length||0==password.length){
            $("span.errorMessage").html("请输入账号密码");
            $("div.loginErrorMessageDiv").show();           
            return false;
        }
         
        var page = "foreloginAjax";
        $.get(
                page,
                {"name":name,"password":password},
                function(result){
                    if("success"==result){
                        location.reload();
                    }
                    else{
                        $("span.errorMessage").html("账号密码错误");
                        $("div.loginErrorMessageDiv").show();                       
                    }
                }
        );          
         
        return true;
    });
});    
</script>

<nav class="top ">
	<a href="${contextPath}">
		<span style="color:#3c8f30;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
		首页
	</a>

	<span>您好，欢迎来到便利农场</span>

	<c:if test="${!empty user}">
		<span>${user.name}</span>
		<a href="forelogout">退出</a>
	</c:if>

	<c:if test="${empty user}">
		<a href="loginPage">请登录</a>
		<a href="registerPage">免费注册</a>
	</c:if>


	<span class="pull-right">
	<c:if test="${!empty user}">
	<div class="btn-group btn-group-sm" role="group" style="background-color: #f2f2f2;margin-top: -5px;">
    <button style="border: none;background-color: #f2f2f2" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <a>个人中心</a>
      <span class="caret"></span>
    </button>
    <ul  class="dropdown-menu" style="background-color: #f2f2f2;">
      <li><a href="fore_user_info">个人信息</a></li>
      <li><a href="foreuser">安全设置</a></li>
    </ul>
  </div>
  </c:if>
			<a href="forebought">我的订单</a>
			<a href="forecart">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart greedColor"></span>
			购物车<strong>${cartTotalItemNumber}</strong>件</a>
		</span>
</nav>



