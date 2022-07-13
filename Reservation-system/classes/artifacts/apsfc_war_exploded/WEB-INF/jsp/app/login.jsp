<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- Custom Theme files -->
<script type="text/javascript">
	//在页面完成加载时调用
	window.onload = function(){

		var elements = document.getElementsByClassName("sys_name_login");
		elements.item(0).setAttribute("style","background-color: white;opacity: 0.7;color: black;transition: .5s;");
		document.onkeydown = function(){
			// firefox没有window.event对象
			var event = arguments[0] ? arguments[0] : window.event;
			if (event.keyCode === 13){
				submitTable();
			}
		};
	};

	function submitTable(){
		//先判断用户是否输入用户名和密码，如其中一个未输入，则不需要提交表单中的内容到数据库
		var loginname = document.getElementById("loginname").value;
		var password = document.getElementById("password").value;
		
		if(loginname == null || loginname == ""){
			document.getElementById("message").innerHTML="请输入用户名";
			//用户名的输入框获取焦点
			document.getElementById("loginname").focus;
			//阻止默认行为
			return false;
		}
		
		if(password == null || password == ""){
			document.getElementById("message").innerHTML="请输入密码";
			//用户名的输入框获取焦点
			document.getElementById("password").focus;
			return false;
		}
		//提交表单
		document.getElementById("loginform").submit(); 
		
	}
	
</script>
</head>
<body> 
	<!-- banner -->
	<div class="banner">
		<!-- header -->
		<div class="header">
			<img src="${pageContext.request.contextPath}/images/app/logo.jpg"/>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="sys_name">
				<h1><a href="${pageContext.request.contextPath}/app/index.do">ISAAC</a></h1>
			</div>
			<div class="sys_name_login">
				<h1><a href="${pageContext.request.contextPath}/app/login.do">登录</a></h1>
			</div>
			<div class="sys_name_register">
				<h1><a href="${pageContext.request.contextPath}/app/register.do">免费注册</a></h1>
			</div>
			<div class="sys_name_cargo">
				<h1><a href="${pageContext.request.contextPath}/app/order.action?method=list" class="dropdown-toggle">我的订单</a></h1>
			</div>
			<div class="sys_name_menu">
				<h1><a href="${pageContext.request.contextPath}/app/menuList.do" class="dropdown-toggle" >菜单 </a></h1>
			</div>
			<div class="sys_name_manage">
				<h1><a href="${pageContext.request.contextPath}/sys/login.do">信息服务中心</a></h1>
			</div>
			<!-- //navigation -->
		</div>
		<!-- //header-end -->

		<div class="container">

			<!-- //breadcrumb -->
			<!-- login-page -->
			<div class="login-page about">
				<div>
					<h3 class="w3ls-title w3ls-title1">登录您的账户</h3>
					<div class="login-agileinfo">
						<center> <div style="color: red;margin-top: 3rem" id="message">${message}</div></center>
						<form action="${pageContext.request.contextPath}/app/login.do" method="post" id="loginform"  onsubmit=" return submitTable()">
							<input type="hidden"  name="method" value="submitTable">

							<input type="text" id="loginname" name="loginname" placeholder="请输入用户名" value="" >
							<input  type="password" id="password" name="password" placeholder="请输入密码"  >
							<div class="wthreelogin-text">
								<label>
									<input type="checkbox" id="remenber" name="remenber" value="reme">
									<span>记住我 ?</span></label>
								<div class="clearfix"> </div>
							</div>
							<input type="submit" id="log_butt" onclick="submitTable()"  value="登录">
						</form>
						<p style="margin-bottom: 2rem;margin-top: 1rem">没有帐号? <a href="${pageContext.request.contextPath}/app/register.do"> 现在注册!</a></p>
					</div>
				</div>
			</div>


			<div  class="nav_tabs">
				<div class="img_wrapper">
					<img class="tab_img" src="${pageContext.request.contextPath}/images/app/menu_bar_black.png"/>
					<nav class="shell">
						<div class="slide_nav_bar">
							<ul class="slide_child">
								<c:if test="${empty session_user }">
									<div class="avatar">
										<img src="${pageContext.request.contextPath}/images/app/avatar.png"/>
									</div>
									<li><a href="${pageContext.request.contextPath}/app/login.do">登录</a></li>
									<li><a href="${pageContext.request.contextPath}/app/register.do">免费注册</a></li>
								</c:if>
								<c:if test="${not empty sesssion_user}">
									<div class="avatar">
										<img src="${pageContext.request.contextPath}/images/app/logged.png"/>
									</div>
									<li>${session_user.loginName} 您好！</li>
									<li><a href="${pageContext.request.contextPath}/app/loginout.action">退出</a></li>
								</c:if>
								<li><a href="${pageContext.request.contextPath}/app/order.action?method=list" class="dropdown-toggle">我的订单</a></li>
								<li><a href="${pageContext.request.contextPath}/app/menuList.do" class="dropdown-toggle" >菜单 </a></li>
								<li><a href="${pageContext.request.contextPath}/sys/login.do">信息服务中心</a></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->    
	<!-- breadcrumb -->  


</body>
</html>