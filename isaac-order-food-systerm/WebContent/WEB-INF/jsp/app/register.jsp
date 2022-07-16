<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<!-- Custom Theme files -->
<!-- regex.js是正则表达式的一系列判断 -->
	<script type=text/javascript src="${pageContext.request.contextPath}/js/regex.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
	window.onload = function(){

		var elements = document.getElementsByClassName("sys_name_register");
		elements.item(0).setAttribute("style","background-color: white;opacity: 0.7;color: black;transition: .5s;");
		document.onkeydown = function(){
			// firefox没有window.event对象
			var event = arguments[0] ? arguments[0] : window.event;
			if (event.keyCode === 13){
				submitTable();
			}
		};
	};

	$(function(){
		//不同意协议  注册提交按钮为灰无法使用
	    var regBtn = jQuery("#register");
	    $("#readme").change(function(){
	    	//选中已同意，返回true
	        var checkedValue = jQuery("#readme").prop("checked");
	        if(checkedValue){
	            regBtn.prop("disabled",false);
	            regBtn.css("background-image","linear-gradient(-225deg, #22E1FF 0%, #1D8FE1 48%, #625EB1 100%");
	        }else{
	            regBtn.prop("disabled",true);
	            regBtn.css("background","#909090");
	        }
	    });
	});


	$().ready(function (){
		// 在键盘按下并释放及提交后验证提交表单
		$("#registerform").validate({
			debug: true,
			onkeyup:false,
			errorLabel:"color=red",
			rules: {
				phone: "required",
				loginName: {
					required: true,
					remote: {
						url:"${pageContext.request.contextPath}/app/register.do",
						type:"post",
						data: {
							"method": "ajaxLoginName",
							"loginName": $("#loginName").value
						},
					}
				},
				passWord: "required",
				okPassWord: {
					required: true,
					equalTo: "#password"
				},
				email: {
					required: true,
					email: true
				},
			},
			messages: {
				phone: "请输入手机号码",
				loginName: {
					required: "请输入用户名!",
					remote: "该用户名已存在!"
				},
				passWord:"请输入密码",
				okPassWord: {
					required: "请输入密码",
					equalTo: "两次密码输入不一致"
				},
				email: "请输入一个正确的邮箱",
			},
			wrapper:"div"
		})
	});

	function focusLP(){
		if ( !$("#registerform").valid()){
			$("#loginName-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#passWord-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#okPassWord-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#phone-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#email-error").css({"height":"1.8rem","transition":"0.3s"})
		}
	}

	function outLP(){
			$("#loginName-error").css({"height":"0","transition":"0.3s"})
			$("#passWord-error").css({"height":"0","transition":"0.3s"})
			$("#okPassWord-error").css({"height":"0","transition":"0.3s"})
			$("#phone-error").css({"height":"0","transition":"0.3s"})
			$("#email-error").css({"height":"0","transition":"0.3s"})
	}

	function onRegister(){
		// console.log($("#loginName").val())
		if ( !$("#registerform").valid()){
			$("#loginName-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#passWord-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#okPassWord-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#phone-error").css({"height":"1.8rem","transition":"0.3s"})
			$("#email-error").css({"height":"1.8rem","transition":"0.3s"})
			return;
		}
		//提交表单
		document.getElementById("registerform").submit();
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
	<!-- sign up-page -->
		<div class="container">
			<div class="login-page about">

			<h3 class="w3ls-title w3ls-title1">注册您的帐号</h3>  
			<div class="login-agileinfo" style="top: 12rem" tabindex="0" hidefocus="true" onfocus='focusLP()' onblur='outLP()'>
				<form action="${pageContext.request.contextPath}/app/register.do" method="post" id="registerform"  onsubmit="return  onRegister()"> 
					<div id="function_panel">
						<input type="hidden" name="method"  value="submitTable">
						<input class="agile-ltext" type="text" style="margin-top: 2rem" id="loginName" name="loginName"  autocomplete="off" placeholder="请输入登录名">
						<input class="agile-ltext" type="text" id="phone" name="phone"  placeholder="请输入电话号码">
						<input class="agile-ltext" type="email" id="email" name="email"  placeholder="请输入邮箱">
						<input class="agile-ltext" type="password"  id="passWord" name="passWord"   placeholder="请输入密码">
						<input class="agile-ltext" type="password"  id="okPassWord" name="okPassWord"  placeholder="再次输入密码">
					</div>
					<div class="wthreelogin-text">
								<label>
									<input type="checkbox" name="readme" id="readme"  checked="checked"><i></i> 
									<span>我已认真阅读并同意《点餐系统服务条款》</span>
								</label>
						<!-- <div class="clearfix"> </div> -->
					</div>
					<div>
					<input type="submit" id="register" onclick="onRegister()" value="注册"> </div>
				</form>
				<p>已有帐号?  <a href="${pageContext.request.contextPath}/app/login.do"> 现在登录!</a></p> 
			</div>
				<div class="copyright">
					<p>版权归 &copy; 2022.艾萨克科技有限公司 所有.</p>
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
</body>
</html>