<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头导航</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>
<body style="background:url(images/topbg.gif) repeat-x;">
	<div class="topleft">
		<a href="${pageContext.request.contextPath}/frame.do?tag=index" target="rightFrame"><img src="images/logo.png" title="系统首页" />
		</a>
	</div>
	<ul class="nav">
		<li><a href="${pageContext.request.contextPath}/account/getAccountInfo.do?cusId=${user.id}" target="rightFrame" class="selected"><img src="images/1.png" title="我的账户" />
			<h2>我的账户</h2>
		</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/transferUI.do" target="rightFrame"><img src="images/2.png" title="网上转账" />
			<h2>网上转账</h2>
		</a>
		</li>
		<li><a href="" target=""><img src="images/3.png" title="投资理财" />
			<h2>投资理财</h2>
		</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/stockUI.do" target="rightFrame"><img src="images/4.png" title="股票信息" />
			<h2>股票信息</h2>
		</a>
		</li>
	</ul>
	<div class="topright">
		<ul>
			<li><span><img src="images/help.png" title="帮助" class="helpimg" />
			</span><a href="#">帮助</a>
			</li>
			<li><a href="#">关于</a>
			</li>
			<li><a href="${pageContext.request.contextPath}/user/logout.do" target="_parent">退出</a>
			</li>
		</ul>
		<div class="user">
			<span>${customer.name}</span>
		</div>
	</div>
</body>
</html>
