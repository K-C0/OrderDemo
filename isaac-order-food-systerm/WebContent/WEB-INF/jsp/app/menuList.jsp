<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>菜单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
</head>
<script type="text/javascript">
	let flag = false
	window.onload = function(){
		if (sessionStorage.getItem("isReload")){
			flag = true
		}else{
			sessionStorage.setItem("isReload",true)
			flag = false
		}

		let elements = document.getElementsByClassName("sys_name_menu");
		elements.item(0).setAttribute("style","background-color: white;opacity: 0.7;color: black;transition: .5s;");
		document.onkeydown = function(){
			// firefox没有window.event对象
			let event = arguments[0] ? arguments[0] : window.event;
			if (event.keyCode === 13){
				submitTable();
			}
		};
	};


	//选定后颜色固定
	function colorRemain(elem)
	{
		if (elem.tagName === "H4")
		{
			$(".menu_first h4").css({"color":"white"})
			$(".menu_first li").css({"color":"white"})
			elem.style.cssText = "color: transparent;background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%); -webkit-background-clip: text;"
		}else if(elem.tagName === "LI"){
			$(".menu_first li").css({"color":"white"})
			// console.log(elem.dataset.customdata)
			// let json = JSON.parse(elem.dataset.customdata)
			// console.log(json)
			//开始对图片进行修改
			// json.img

			elem.style.cssText = "color: transparent;background-image: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%); -webkit-background-clip: text;"
		}

	}

	//展示菜系下的所有菜名
	function meFiAction(id,fid,len){
		/*如果当前的foods的type，就直接显示就行*/
		if (fid === id){
			let height = len * 2.7
			$(".menu_first ul").css({"height":"0","transition":"0.4s"})
			$("#food"+id).css({"height":height+"rem","transition":"0.4s"});
		}else{
			let item = eval(localStorage.getItem("food"+id))
			/*如果storage中的item是空的，那就访问服务器；如果是首次访问网页那也访问服务器*/
			if ((item === null || item === undefined || item === "") && flag === false)   /*问题false出现在这里*/
			{
				jQuery.ajax({
					type: "POST",
					url: "${ctx}/app/menuList.do",
					method:"post",
					data: "foodTypeId="+id,
					dataType:"text",
					async:false,
					success: function(msg){
						let target = "food"+id
						let jsonArray = eval(msg)
						localStorage.setItem(target,msg)
						let height
						let elem = document.getElementById(target)
						let ele
						while ((ele = elem.firstChild)) {
							ele.remove();
						}
						if (jsonArray.length > 0)
						{
							for(let i=0;i<jsonArray.length;i++)
							{
								let li = document.createElement("li")
								li.onclick = function () {colorRemain(this)}
								li.value = jsonArray[i]
								li.dataset.customdata = JSON.stringify(jsonArray[i])
								// console.log(JSON.stringify(jsonArray[i]))
								li.innerText = jsonArray[i].foodName
								elem.appendChild(li)
							}
							height = jsonArray.length * 2.7
						}else{
							let li = document.createElement("li")
							li.innerText = "暂无此类菜品"
							elem.appendChild(li)
							height = 2.7
						}

						// console.log(htmlStr)
						$(".menu_first ul").css({"height":"0","transition":"0.4s"})
						$("#food"+id).css({"height":height+"rem","transition":"0.4s"});
					}
				})
			}else{
				let target = "food"+id
				let height = 0
				let elem = document.getElementById(target)
				// console.log(elem.innerText)
				if (elem.innerText === ""||elem.innerText === null)
				{
					let ele
					while ((ele = elem.firstChild)) {
						ele.remove();
					}
					if (item.length > 0) {
						for (let i = 0; i < item.length; i++) {
							let li = document.createElement("li")
							li.onclick = function () {colorRemain(this)}
							li.dataset.customdata = JSON.stringify(item[i])
							// console.log(JSON.stringify(item[i]))
							li.innerText = item[i].foodName
							elem.appendChild(li)
						}
					} else {
						let li = document.createElement("li")
						li.innerText = "暂无此类菜品"
						elem.appendChild(li)
					}
				}
				// console.log(htmlStr)
				height = item.length===0?2.7:(item.length * 2.7);
				if (item.length === 0) {
					let li = document.createElement("li")
					li.innerText = "暂无此类菜品"
					elem.appendChild(li)
				}
				$(".menu_first ul").css({"height":"0","transition":"0.4s"});
				$("#food"+id).css({"height":height+"rem","transition":"0.4s"});
			}
		}
	}
</script>
<body> 
	<!-- banner -->
	<div class="banner about-w3bnr">
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
			<!-- products -->

			<div class="menu_container">
				<div class="rsidebar-top">
					<div class="sidebar-row">
						<h1>菜单</h1>
						<div>
							<ul class="foodslist">
								<c:forEach items="${foodTypes}" var="foodType">
									<li class="menu_first" onclick="meFiAction(${foodType.id},${foods[1].foodTypeId},${foods.size()})">
										<h4 onclick="colorRemain(this)">${foodType.typeName }</h4>
										<ul id="food${foodType.id}">
											<c:if test="${not empty foods }">
												<c:forEach items="${foods}"  var="food">
													<c:if test="${foodType.id == food.foodTypeId}">
													<li onclick="colorRemain(this)" data-customdata="${food}">
															${food.foodName}
													</li>
													</c:if>
												</c:forEach>
											</c:if>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>


			<div class="show_panel">
				<div class="products-row">
					<div class="card">
						<img class="foodImg" src="${pageContext.request.contextPath}/images/app/food/7.jpg" alt="img">
						<div class="content">
							<h2>ISAAC</h2>
							<h3>水煮鱼</h3>
							<p>
								宫廷玉液酒，一百八一杯，这酒怎么样？听我给你吹。一杯你开胃，两杯肾不亏，三杯四杯下了肚...
							</p>
							<a href="#">登录后订菜</a>
						</div>
					</div>
							<!-- <center><font color="red"> 当前类别暂未有食品</font></center>  -->
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


</body>
</html>