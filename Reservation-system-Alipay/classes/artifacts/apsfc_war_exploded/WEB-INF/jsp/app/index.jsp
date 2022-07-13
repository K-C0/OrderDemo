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
<%--	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
<%--	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

	<script >
	$(document).ready(function (){
		$("#btn").click(function () {
			$.ajax({

			})
		})
	})
</script>
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



		///////////
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
			voice.start();
		};

		// 关闭识别
		closeBtn['onclick'] = function () {
			voice.stop();
			// fixedBox.style.display = 'none';
		};

	}


	function dataChange(obj){
		//获取用户输入的餐桌名
		var tableName = $("#tableName").val();
		//餐桌的使用状态
		var tableStatus = obj.value;
		
		window.location = "${pageContext.request.contextPath}/app/index.do?method=submitTable&tableName="+tableName+"&tableStatus="+tableStatus;
	}
</script>

</head>
<body> 
	<!-- banner -->
	<div class="banner" style="height: 900px;">
		<!-- header -->
		<div class="header">
			<!-- navigation -->
			<div class="navigation agiletop-nav">
				<div class="container">
					<nav class="navbar navbar-default">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header w3l_logo">
							<h1><a href="${pageContext.request.contextPath}/app/index.do">点餐系统</a></h1>
						</div> 
						<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="${pageContext.request.contextPath}/app/index.do" class="active">主页</a></li>	
								<!-- Mega Menu -->
								<li>
									<a href="${pageContext.request.contextPath}/app/menuList.do" class="dropdown-toggle" >菜单 </a>
								</li>
								<li class="w3pages">
									<a href="${pageContext.request.contextPath}/app/order.action?method=list" class="dropdown-toggle">我的订单</a>
								</li>  
								<c:if test="${empty session_user }">
									<li class="head-dpdn">
										<a href="${pageContext.request.contextPath}/app/login.do">登录</a>
									</li>
									<li class="head-dpdn">
										<a href="${pageContext.request.contextPath}/app/register.do">免费注册</a>
									</li>
								</c:if>
								<c:if test="${not empty session_user }">
									<li class="head-dpdn">
										<a>${session_user.loginName} 您好！</a>
									</li>
									<li class="head-dpdn">
										<a href="${pageContext.request.contextPath}/app/loginout.action">退出</a>
									</li>
								</c:if>
								<li class="head-dpdn">
									<a href="${pageContext.request.contextPath}/sys/login.do">信息服务中心</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<!-- //navigation --> 
		</div>

		<!-- //header-end -->

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

		<!-- banner-text -->
		<div class="banner-text">	
			<div class="container" style="padding-left: 280px;margin-top: -100px;">
				<div class="agileits_search">
					<form action="${pageContext.request.contextPath}/app/index.do" method="post">
						<input type="hidden"  name="method"  value="submitTable">
						<div id="serchResult" cstyle="margin-top: 20px;">
							<c:if test="${not empty dinnerTables}">
								<c:forEach items="${dinnerTables}" var="dinnerTable" >
									 <a href="${pageContext.request.contextPath}/app/menu.action?id=${dinnerTable.id}" style="color: white;font-size: 20px;"">
									 	${dinnerTable.tableName}
									 </a>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
								</c:forEach>
							</c:if>
							<c:if test="${ empty dinnerTables}">
								当前没有符合条件的餐桌
							</c:if>
							 <br><br>
						</div>
						<input name="tableName" id="tableName" type="text" placeholder="餐桌名" >
						<select id="agileinfo_search" name="tableStatus" onchange="dataChange(this)">
							<option value="">全部</option>
							<option value="1">正在使用</option>
							<option value="0">未使用</option>
						</select>
						<input type=submit   value="查看餐桌">

						<input type="button" id="btn" onclick="recordVoice()" value="付款">
					</form>
				</div>

<%--				<section class="voice-box">--%>
<%--					<button id="start-btn">开始识别</button>--%>
<%--					<button id="close-btn">停止识别</button>--%>
<%--					<input type="search" name="voice" id="voice-txt" />--%>

<%--				</section>--%>

<%--				<section class="fixed-box" id="fixed-box">--%>
<%--					<div class="fixed-main">--%>
<%--						<button class="fixed-close" id="close-btn"></button>--%>
<%--						<div id="fixed-txt">Hello! 请说出你想说话。。。！</div>--%>
<%--						<div class="fixed-icon">--%>
<%--							<img src="./img/voice.png" alt="" />--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</section>--%>



			</div>
		</div>
	</div>
	
</body>
</html>