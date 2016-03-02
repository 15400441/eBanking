<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>目录</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>
</head>
<body style="background:#fff3e1;">
	<div class="lefttop">
		<span></span>常用业务
	</div>
	<dl class="leftmenu">
		<dd>
			<div class="title">
				<span><img src="images/leftico01.png" />
				</span>账户
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${pageContext.request.contextPath}/account/getAccountInfo.do?cusId=${user.id}" target="rightFrame">账户总览</a>
				</li>
				<li><cite></cite><a href="${pageContext.request.contextPath}/transferSearchUI.do" target="rightFrame">账户交易明细查询</a>
				</li>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="images/leftico02.png" /> </span>转账
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${pageContext.request.contextPath }/transferUI.do" target="rightFrame">行内即时转账</a><i></i></li>
				<li><cite></cite><a href="" target="">跨行即时转账</a><i></i></li>
			</ul>
		</dd>
	</dl>
</body>
</html>
