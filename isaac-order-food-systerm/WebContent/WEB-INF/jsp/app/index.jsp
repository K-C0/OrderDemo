<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>主页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />

	<%--引入语音识别的js--%>
	<script src="../../../js/crypto-js.min.js"></script>
	<script src="../../../js/voice.js"></script>

	<script type="application/x-javascript">
		/* 页面加载的时候添加一个定时器，0秒之后执行hideURLbar函数。hideURLbar函数将页面滚动至坐标（0,1）
         因为chrome等浏览器会有滚动缓存功能，比如你在A页面滚动后跳转到B页面，点击返回键回到A页面，会发现滚动条位置仍然保持 */
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar(){
			window.scrollTo(0,1);
		}

		window.onload = function(){
			//获取用户选中的物品类型
			var tableStatus = "${tableStatus}";
			var agileinfo_search = document.getElementById("agileinfo_search");

			//获取下拉框中所有的option
			var options = agileinfo_search.options;

			$.each(options,function(i,item){
				//如果option的value值等于用户选择的tableStatus就被选中
				$(item).attr("selected",item.value == tableStatus);
			})



			//   增加《语音识别》功能
			const voiceTxt = document.querySelector('#voice-txt');
			const startBtn = document.querySelector('#start-btn');
			const closeBtn = document.querySelector('#close-btn');

			let times = null;

			// 实例化迅飞语音听写（流式版）WebAPI
			const voice = new Voice({


				// 服务接口认证信息 注：apiKey 和 apiSecret 的长度都差不多，请要填错哦，！
				appId: '8459d875',
				apiSecret: 'YmZiNjc3ZmYyYTIzZTFiZDdiZDgxNTUz',
				apiKey: 'd6114973fb729fef80931b13eb916fc8',
				// 注：要获取以上3个参数，请到迅飞开放平台：https://www.xfyun.cn/services/voicedictation 【注：这是我的迅飞语音听写（流式版）每天服务量500（也就是调500次），如果你需求里大请购买服务量：https://www.xfyun.cn/services/voicedictation?target=price】


				onTextChange: function (text) {
					//监听识别结果的变化
					voiceTxt.value = text;
					// fixedTxt.innerText = text;
					console.log(text);

					// 3秒钟内没有说话，就自动关闭
					if (text) {
						clearTimeout(times);
						times = setTimeout(() => {
							this.stop(); // voice.stop();
							// fixedBox.style.display = 'none';
						}, 3000);
					};
				}
			});

			// 开始识别
			startBtn['onclick'] = function () {
				console.log("  begin ")
				voice.start();
			};

			// 关闭识别
			closeBtn['onclick'] = function () {
				console.log("  stopped ")
				voice.stop();
				// fixedBox.style.display = 'none';
			};

		}


		function dataChange(obj){
			//获取用户输入的餐桌名
			// let tableName = $("#tableName").val();
			//餐桌的使用状态
			let tableStatus = obj.value;
			jQuery.ajax({
				type: "POST",
				url: "${ctx}/app/index.do?method=submitTable",
				method:"post",
				data: {
					"tableName":"",
					"tableStatus":tableStatus
				},
				dataType:"text",
				async:false,
				success:function (res){
					let tabInfo = eval(res)
					let elem = document.getElementById("serchResult")
					if (tabInfo === "" || tabInfo === undefined || tabInfo.length === 0)
					{
						elem.innerText = "当前没有符合条件的餐桌"
					}else {
						let ele
						while ((ele = elem.firstChild)) {
							ele.remove();
						}
						let ul = document.createElement("ul");
						for (let i = 0; i < tabInfo.length; i++) {
							var li = document.createElement("li");
							li.innerText = tabInfo[i].tableName
							li.onclick=function (){fillInput(this.innerText)}
							ul.appendChild(li)
						}
						elem.appendChild(ul)
					}
					elem.setAttribute("style","height:12rem;transition:.6s");
					$("#tableName").focus()
				}
			})
			<%--window.location = "${pageContext.request.contextPath}/app/index.do?method=submitTable&tableName="+tableName+"&tableStatus="+tableStatus;--%>
		}

		function stretchResult() {
			// console.log("触发")
			let elem = document.getElementById("serchResult")
			elem.setAttribute("style","height:0;transition:.6s");
		}

		function fillInput(tableName){
			console.log(tableName)
			document.getElementById("tableName").setAttribute("value",tableName)
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

	<%--侧边栏--%>
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



	<!-- banner-text -->
	<div class="banner-text">
		<div class="container">
			<div class="slogan">
				<div>
					<t>美好人生</t>
				</div>
				<div class="typing">
					<t>从一日三餐开始</t>
				</div>
			</div>

			<section class="voice-box" >
				<button type="button" class="btn btn-primary" id="start-btn" data-toggle="button">开始识别</button>
				<button type="button" class="btn btn-primary" id="close-btn" data-toggle="button">停止识别</button>

				<div class="col-lg-6">
					<div class="input-group">
						<input type="search" name="voice" id="voice-txt" class="form-control">
						<span class="input-group-btn">
                        <button class="btn btn-default" type="button">-搜索餐桌-</button>
                    </span>
					</div><!-- /input-group -->
				</div><!-- /.col-lg-6 -->

				<%--			<input type="search" name="voice" id="voice-txt" />--%>

			</section>


			<div class="agileits_search">
				<div id="promt">立即订座</div>
				<form action="${pageContext.request.contextPath}/app/index.do" method="get">   <%--待修改--%>
					<input type="hidden"   name="method"  value="submitTable">
					<div id="wrapper4Rs">
						<div id="wrapper_nth">
							<input name="tableName" id="tableName" autocomplete="off"
								   onblur="stretchResult()" type="text" placeholder="餐桌名">
							<div id="serchResult">
								<c:if test="${not empty dinnerTables}">
									<ul>
										<c:forEach items="${dinnerTables}" var="dinnerTable" >
											<li onclick="fillInput(this.innerText)">
													${dinnerTable.tableName}
											</li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${ empty dinnerTables}">
									当前没有符合条件的餐桌
								</c:if>
								<br><br>
							</div>
						</div>
						<select id="agileinfo_search" name="tableStatus" onchange="dataChange(this)">
							<option value="">全部</option>
							<option value="1">正在使用</option>
							<option value="0">未使用</option>
						</select>
						<input type=submit  id="sub_butt" value="即刻订座">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



</body>
</html>