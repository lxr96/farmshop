<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>便利农场-注册界面</title>
<link rel="stylesheet" type="text/css" href="css/login/style.css" />
<link rel="stylesheet" type="text/css" href="css/login/body.css" />
</head>
<body>
	<div id="registerDiv" class="container">
		<section id="content">
			<form action="foreregister" class="registerForm" method="post">
				<h1>用户注册</h1>
				<div>
					<input id="registerName" type="text" placeholder="登陆名" required=""
						name="name" />
				</div>
				<span id="error"></span>
				<div>
					<input id="password" type="password" placeholder="登陆密码" required=""
						name="password" />
				</div>
				<div>
					<input id="repeatpassword" type="password" placeholder="密码确认"
						required="" />
				</div>
				<div class="">
					<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
				</div>
				<div>

					<div class="registerErrorMessageDiv">
						<div class="alert alert-danger">
							<span class="errorMessage"></span>
						</div>
					</div>

					<!-- <input type="submit" value="Log in" /> -->
					<input type="submit" value="注册" class="btn btn-primary"
						id="js-btn-login" /> <a href="#">忘记密码</a> <a href="loginPage"
						id="login">用户登录</a>
				</div>
			</form>
			<!-- form -->
		</section>
		<!-- content -->
	</div>
	<!-- jQuery Js -->
	<script src="assets/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			$(".registerForm").submit(function() {
				if ($("#password").val() != $("#repeatpassword").val()) {
					$("span.errorMessage").html("重复密码不一致");
					return false;
				}
				var rname = $("#registerName").val();
				$.ajax({
					url : "adminisExist",
					data : {
						"name" : rname
					},
					type : "GET",
					success : function(result) {
						if (result) {
							$("span.errorMessage").html("账号已注册");
							alert("用户已存在，注册失败");
							history.go(0);
						} else {
							alert("注册成功!");
							$('#error').html("账号可以注册");
						}
					}
				});
			});

			$("#registerName").keyup(function() {
				var rname = $("#registerName").val();
				$.ajax({
					url : "adminisExist",
					data : {
						"name" : rname
					},
					type : "GET",
					success : function(result) {
						if (result) {
							$('#error').html("账号已被注册");
							rnameisExist = false;
						} else {
							$('#error').html("账号可以注册");
						}
					}
				});
			});

		})
	</script>
	<!-- container -->
</body>
</html>