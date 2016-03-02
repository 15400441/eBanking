<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>转账</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/select.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/ligerUILib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/ligerUILib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/ligerUILib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/ligerUILib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/ligerUILib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/select-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/transfer.js"></script>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});


</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">网上转账</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">行内及时转账</a></li>
					<li><a href="#tab2" class="">行内预约转账</a></li>
					<li><a href="#tab3" class="">跨行即时转账</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<div class="formtext">
					<b>收款人信息 </b>
					<hr width=100% size=3 color=black style="FILTER: alpha(opacity=100,finishopacity=0)">
				</div>
				<div style="margin-left:100px">
					<form id="transferForm" target="rightFrame" action="${pageContext.request.contextPath}/transfer/transfer.do" >
						<ul class="forminfo">
							<li><label>收款人：<b>*</b> <input name="validCode" type="hidden" id="validCode" /> </label><input id="inName" name="name" type="text" class="dfinput" required="required" /></li>
							<li><label>账号：<b>*</b> </label><input id="accInNo" name="accInNo" type="text" class="dfinput" /></li>
							<li><label>收款银行：<b>*</b> </label>
								<div class="vocation">
								    
									<select class="select1" name="inBankNo" style="width: 345px;" id="inBankNo">
										<option value="">--请选择--</option>
										<c:forEach items="${bankList }" var="item">
											<option value="${item.bankNo }">${item.bankName }</option>
										</c:forEach>
									</select>
									
								</div></li>
							<li><label>金额：<b>*</b> </label><input id="tranAmount" name="tranAmount" type="text" class="dfinput" /></li>
						</ul>
				</div>
				<div class="formtext">
					<b>付款人信息 </b>
					<hr width=100% size=3 color=black style="FILTER: alpha(opacity=100,finishopacity=0)">
				</div>
				<div style="margin-left:100px">
					<ul class="forminfo">
						<li><label>付款卡账号：<b>*</b> </label>
							<div class="vocation">
							    <input id="accOutNo" type="hidden" name="accOutNo" type="text" class="dfinput" value="${loginAccount.accNo}" />
								<select class="select1" id="selectAccOutNo" name="test" style="width: 345px;">
									<option value="${loginAccount.accNo}"> ${loginAccount.accNo }</option>
								</select>
							</div></li>
						<li><label>认证方式：<b>*</b> </label><input type="radio" name="certifyWay" value="message" style="margin-top:7px" /> 短信验证 <input type="radio" name="certifyWay" value="email" style="margin-top:7px" /> 邮件验证</li>
					</ul>
				</div>
				<div class="formtext">
					<b>更多设置 </b>
					<hr width=100% size=3 color=black style="FILTER: alpha(opacity=100,finishopacity=0)">
				</div>
				<div style="margin-left:100px">
					<ul class="forminfo">
						<li><label>给收款人留言：<b></b> </label><input name="message" type="text" class="dfinput" /></li>
						<li><label>邮件通知：<b></b> </label><input name="noticeEmail" type="text" class="dfinput"  id="noticeEmail"/></li>
						<li><label>&nbsp;</label> <input type="button" class="btn" value="转账" onclick="return sendAjax()"></li>
					</ul>
					</form>
				</div>
			</div>
			<div id="tab2" class="tabson">未实现</div>
			<div id="tab3" class="tabson">未实现</div>
			<div id="pop" style="width:240px; margin:3px; display:none; ">
				<div style="margin-left:40px">
					验证消息：<br />
					<br />
					<div>
						<input name="txtName" type="text" id="d1" />
					</div>
				</div>
			</div>
			<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
			<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
		</div>
</body>
</html>
