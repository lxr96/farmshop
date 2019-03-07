<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>后台管理</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="assets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
	<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<script>
	function checkEmpty(id, name) {
		var value = $("#" + id).val();
		if (value.length == 0) {
			alert(name + "不能为空");
			$("#" + id)[0].focus();
			return false;
		}
		return true;
	}
	function checkNumber(id, name) {
		var value = $("#" + id).val();
		if (value.length == 0) {
			alert(name + "不能为空");
			$("#" + id)[0].focus();
			return false;
		}
		if (isNaN(value)) {
			alert(name + "必须是数字");
			$("#" + id)[0].focus();
			return false;
		}

		return true;
	}
	function checkInt(id, name) {
		var value = $("#" + id).val();
		if (value.length == 0) {
			alert(name + "不能为空");
			$("#" + id)[0].focus();
			return false;
		}
		if (parseInt(value) != value) {
			alert(name + "必须是整数");
			$("#" + id)[0].focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>