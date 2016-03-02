<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录腾龙网银系统</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/cloud.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
	
	function change()
	{
		var $img=$("#checkImage");
		$img.attr("src","${pageContext.request.contextPath }/valid/checkImage.do?"+new Date().getTime());
	}
	
	function checkForm(){
		// 校验用户名:
		// 获得用户名文本框的值:
		
		var username = document.getElementById("username").value;
		if(username == null || username == ''){
			alert("用户名不能为空");
			return false;
		}
		// 校验密码:
		// 获得密码框的值: 
		var password = document.getElementById("password").value;
		if(password == null || password == ''){
			alert("密码不能为空");
			return false;
		}
	}
	
	var msg="${msg}";
	if(msg!=null && msg!="")
		alert(msg);
	    
</script>
</head>
<body style="background-color:#df7611; background-image:url(${pageContext.request.contextPath}/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<div class="logintop">
		<span>欢迎登录腾龙网银系统</span>
		<ul>
			<li><a href="#">帮助</a>
			</li>
			<li><a href="#">关于</a>
			</li>
		</ul>
	</div>
	<div class="loginbody">
		<span class="systemlogo" style="margin-top: 80px"></span>
		<div class="loginbox loginbox3">
			<form action="${pageContext.request.contextPath}/user/login.do" method="post" onsubmit="return checkForm();">
				<ul>
					<li><input id="username" name="username" type="text" class="loginuser" value="" onclick="JavaScript:this.value=''" />
					</li>
					<li><input id="password" type="password" name="password" type="text" class="loginpwd" value="" onclick="JavaScript:this.value=''" />
					</li>
					<li class="yzm"><span><input name="checkcode" type="text" value="验证码" onclick="JavaScript:this.value=''" />
					</span><cite><img id="checkImage" src="${pageContext.request.contextPath }/valid/checkImage.do" onclick="change()" title="点击更换验证码" />
					</cite></li>
					<li><input type="submit" class="loginbtn" value="登录" />
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>