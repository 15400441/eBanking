<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>股票搜索</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		    <li><a href="#">首页</a>
			</li>
			<li><a href="#">股票</a>
			</li>
			
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>股票信息示例</span>
		</div>
		<div class="toolsli">
			<ul class="toollist">
				<li style="height:340px;width:520px">
					<h2>日k线图</h2>
					<img src="http://image.sinajs.cn/newchart/daily/n/sh601398.gif" alt="股票不存在" />
				</li>
				<li style="height:340px;width:520px"><h2>分时线</h2>
					<img src="http://image.sinajs.cn/newchart/min/n/sh601398.gif" alt="股票不存在" />
				</li>
			</ul>
		</div>
		<div class="formtitle">
			<span>股票查询</span>
		</div>
		<div class="toolsli">
			<form target="rightFrame" action="${pageContext.request.contextPath}/stock/getStockDeatil.do">
				<label>股票代号：<input name="stockCode" type="text" class="dfinput" /> <input type="submit" class="scbtn" value="查询" /> </label>
			</form>
		</div>
	</div>
</body>
</html>
