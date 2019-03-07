<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<nav class="navbar navbar-default top-navbar" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand waves-effect waves-dark" href="admin_home" target="rightDiv"><i
			class="large material-icons">track_changes</i> <strong>&nbsp;后台管理</strong></a>

		<div id="sideNav" href="">
			<i class="material-icons dp48">toc</i>
		</div>
	</div>

	<ul class="nav navbar-top-links navbar-right">
		<i class="fa fa-tasks fa-fw"></i>
		<i class="material-icons right">arrow_drop_down</i>
		<li><a class="dropdown-button waves-effect waves-dark" href="#!"
			data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i
				class="material-icons right">arrow_drop_down</i></a></li>
		<li><a class="dropdown-button waves-effect waves-dark" href="#!"
			data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>${admin.name }</b>
				<i class="material-icons right">arrow_drop_down</i></a></li>
	</ul>
</nav>
<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
	<li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a></li>
	<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
	<li><a href="adminlogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
</ul>
<ul id="dropdown2" class="dropdown-content w250">
	<li><a href="#">
			<div>
				<i class="fa fa-comment fa-fw"></i> New Comment <span
					class="pull-right text-muted small">4 min</span>
			</div>
	</a></li>
	<li class="divider"></li>
	<li><a href="#">
			<div>
				<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
					class="pull-right text-muted small">12 min</span>
			</div>
	</a></li>
	<li class="divider"></li>
	<li><a href="#">
			<div>
				<i class="fa fa-envelope fa-fw"></i> Message Sent <span
					class="pull-right text-muted small">4 min</span>
			</div>
	</a></li>
	<li class="divider"></li>
	<li><a href="#">
			<div>
				<i class="fa fa-tasks fa-fw"></i> New Task <span
					class="pull-right text-muted small">4 min</span>
			</div>
	</a></li>
	<li class="divider"></li>
	<li><a href="#">
			<div>
				<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
					class="pull-right text-muted small">4 min</span>
			</div>
	</a></li>
	<li class="divider"></li>
	<li><a class="text-center" href="#"> <strong>See All
				Alerts</strong> <i class="fa fa-angle-right"></i>
	</a></li>
</ul>