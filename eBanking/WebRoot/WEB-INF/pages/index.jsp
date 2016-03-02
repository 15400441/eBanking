<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a>
			</li>
		</ul>
	</div>
	<div class="mainindex">
		<div class="welinfo">
			<span></span> <b>${customer.name}，欢迎使用腾龙银行网银系统</b>
		</div>
		<div class="welinfo">
			<span><img src="images/time.png" alt="时间" />
			</span> <i>您上次登录的时间：${user.lastLoginTime }</i>
		</div>
		
		<div class="xline"></div>
		<div class="welinfo">
			<span></span> <b>收支图</b>
			<input id="accNo" value="${loginAccount.accNo }" type="hidden">
		</div>
		<div id="chart" style="height:350px;width:600px;margin-left:20px"></div>
		
		
		
		<div class="xline"></div>
		<div class="box"></div>
		<div class="welinfo">
			<span><img src="images/dp.png" alt="提醒" />
			</span> <b>腾龙银行网银系统使用指南</b>
		</div>
		<ul class="infolist">
			<li><span>您可以快速转账</span><a class="ibtn">快速转账演示</a>
			</li>
			<li><span>您可以快速查看股票信息</span><a class="ibtn">股票信息查询演示</a>
			</li>
			<li><span>您可以进行账户信息设置等操作</span><a class="ibtn">账户管理演示</a>
			</li>
		</ul>
		
		
		
		<div class="xline"></div>
		<div class="uimakerinfo">
			<b>网银系统介绍</b>
		</div>
		<div style="margin-left:20px">腾龙银行网银系统.....</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts-all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
</html>
