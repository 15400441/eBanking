<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>转账查询</title>

<link href="${pageContext.request.contextPath }/css/page.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.1.1/css/bootstrap.min.css" />
<link href="${pageContext.request.contextPath }/ligerUILib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/select.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/ligerUILib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/ligerUILib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jqPaginator.js"></script>
<script src="${pageContext.request.contextPath }/ligerUILib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/select-ui.min.js"></script>
</head>
<body>
   <div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a>
			</li>
			<li><a href="#">交易查询</a>
			</li>
			
		</ul>
	</div>

	<div class="formbody">
		<div class="formtitle">
			<span>交易明细</span>
		</div>
		<form target="rightFrame" action="${pageContext.request.contextPath}/transfer/transferSearch.do" id="searchForm">
			<input name="accNo" value="${loginAccount.accNo }" type="hidden"> 
			<input name="pageNum" id="pageNum" type="hidden" value="${page.currentPageNum }">
			<input  id="totalPages" type="hidden" value="${page.totalPageSize }">
			<table width="70%">
				<tr>
					<td>账号: ${loginAccount.accNo }</td>
					<td></td>
					<td>开始日期:</td>
					<td><input name="startDate" type="text" id="startTime" value="${startDate }" />
					</td>
					<td>截止日期:</td>
					<td><input name="endDate" type="text" id="endTime" value="${endDate }" />
					</td>
					<td><input type="submit" class="scbtn" value="查询" onclick="d()" style="width: 60px; height:28px" />
					</td>
					<td></td>
				</tr>
			</table>
		</form>
		<div class="formtitle"></div>
		<table class="tablelist">
			<thead>
				<tr>
					<th>交易日期</th>
					<th>币种</th>
					<th>转入额</th>
					<th>转出额</th>
					<th>对方账户</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ page.records}" var="t">
					<tr>
						<td>${t.tranDate }</td>
						<td>${ t.currType}</td>
						<td>${t.tranInAmount }</td>
						<td>${t.tranOutAmount }</td>
						<td>${t.oppoAcc }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="demo customBootstrap">
			<ul id="pagination" class="pagination"></ul>
		</div>
	</div>
</body>
<script type="text/javascript">

 
	 
	  $("#startTime").ligerDateEditor(
              {

                  format: "yyyy-MM-dd",
                 
                  labelWidth: 100,
                             
                  cancelable : false
          });
   
	  $("#endTime").ligerDateEditor(
              {

                  format: "yyyy-MM-dd",
                   
                  labelWidth: 100,
                
                  cancelable : false
          });

	  
	   current=$('#pageNum').val();
	   totalPage=$('#totalPages').val();
	  
	   
	  $.jqPaginator('#pagination', {
	        totalPages: eval(totalPage),
	        visiblePages: 6,
	        currentPage:  eval(current),
	        prev: '<li class="prev"><a href="javascript:;">上一页</a></li>',
	        next: '<li class="next"><a href="javascript:;">下一页</a></li>',
	        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
	        onPageChange: function (num, type) {
	            $('#pageNum').val(num);
	            
	            if(type=="change"){
                                        
	            $('#searchForm').submit()
	            }
	            
	        }  
	    });
      
   function d(){
	   $('#pageNum').val(1);
   }
  
 
 </script>
</html>
