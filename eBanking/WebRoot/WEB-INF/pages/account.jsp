<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账号信息总览</title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/select-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a>
			</li>
			<li><a href="#">账户</a>
			</li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>我的存款</span>
		</div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>账户</th>
					<th>卡/存折号</th>
					<th>币种</th>
					<th>账户类型</th>
					<th>账户状态</th>
					<th>账户别名</th>
					<th>余额</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${ cards != null}">
					<c:forEach items="${ cards}" var="card">
						<tr>
							<td>${a.accNo }</td>
							<td>${card.cardNo }</td>
							<td>${a.currType }</td>
							<td>${a.accTypeView }</td>
							<td>${a.accStatusView}</td>
							<td>${a.accAlias }</td>
							<td>${a.balance }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ cards==null }">
					<tr>
						<td>${a.accNo }</td>
						<td></td>
						<td>${a.currType }</td>
						<td>${a.accTypeView }</td>
						<td>${a.accStatusView}</td>
						<td>${a.accAlias }</td>
						<td>${a.balance }</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		</br> </br>
		<div class="formtitle">
			<span>我的贷款</span>
		</div>
		</br> </br>
		<div class="formtitle">
			<span>我的信用卡</span>
		</div>
	</div>
</body>
</html>
