<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>后台登录界面</title>
<link rel="stylesheet" type="text/css" href="css/login/style.css" />
<link rel="stylesheet" type="text/css" href="css/login/body.css"/> 
</head>
<body>
<div class="container">
	<section id="content">
		<form class="loginForm" action="adminlogin" method="post">
			<h1>管理员登录</h1>
			<div>
				<input type="text" placeholder="用户名" required="" id="name" name="name" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="" name="password" type="password" />
			</div>
			 <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div> 
			<div>

            <div class="loginErrorMessageDiv">
				<div class="alert alert-danger" >
					<span class="errorMessage"></span>
				</div>
			</div>
            
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登录" class="btn btn-primary" id="js-btn-login"/>
				<a href="#">忘记密码</a>
				<a href="#">免费注册</a>
			</div>
		</form><!-- form -->
	</section><!-- content -->
</div>
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>

<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });
    })
</script>
<!-- container -->
</body>
</html>