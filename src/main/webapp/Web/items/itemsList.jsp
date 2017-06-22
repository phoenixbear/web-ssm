<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>查询商品列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<LINK href="${pageContext.request.contextPath}/style/css/style.css" type=text/css rel=stylesheet>
	<link href="${pageContext.request.contextPath}/style/css/style2.css" type=text/css rel=stylesheet>
	<link href="${pageContext.request.contextPath}/jqueryUI/css/start/jquery-ui-1.10.4.custom.min.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/jqueryUI/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jqueryUI/js/jquery-ui-1.10.4.custom.js"></script> 
	<script type="text/javascript">
		var JUI = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery/jqueryValidate/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/web/items/itemsList.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/web/checkbox.js"></script>
	
</head>
<body> 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">商品管理</a></li>
    <li><a href="#">商品查询</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    	<div class="tools">
    		<div style="position: absolute;left: 0;">
	       	 	<ul class="seachform">
	       	 		<li>
		   		 		<input name="${pageContext.request.contextPath }/items/ajaxRequestItems.action" id="createItem" type="button" class="delbtn" value="新增"/>
		   		 	</li>
		   		 	<li>
		   		 		<input name="${pageContext.request.contextPath }/items/deleteItemsBatch.action" id="deleteItemsBatch" type="button" class="delbtn" value="批量删除"/>
		   		 	</li>
		   	 	</ul>
	        </div> 
	        <div style="position: absolute;right: 0;">
		        <form action="${pageContext.request.contextPath}/items/queryItems.action" method="post" >
		       	 	<ul class="seachform">
		        		<li><label>商品名称</label><input name="name" type="text" class="scinput" /></li>
			   		 	<li><label>&nbsp;</label><input name="search" type="submit" class="scbtn" value="查询"/></li>
			   		 	
			   	 	</ul>
		        </form>
	        </div> 
    	</div>
    </div>
    
    <table class="tablelist">
    	<thead>
    		<tr>
			<th><input name="" type="checkbox" value="" checked="checked" id="selectAllItems"/></th>
        	<th>商品名称</th>
        	<th>商品价格</th>
        	<th>管理人</th>
        	<th>生产日期</th>
       	 	<th>商品描述</th>
        	<th>操作</th>
        	</tr>
        </thead>
        <tbody>
         	<c:if test="${empty itemsList }">
        		<tr>
					<td colspan="7" align="center">
						<span style="font-weight: bold;color: red;">暂无数据</span>
					</td>
				</tr>
        	</c:if>
			<c:forEach items="${itemsList}" var="item">
				<tr>
					<td><input type="checkbox" name="checkboxBtnNew" value="${item.id}"></td>
					<td>${item.name }</td>
					<td>${item.price }</td>
					<td>${item.user.userName }</td>
					<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${item.detail }</td>
<%-- 					<td><a href="${pageContext.request.contextPath }/items/ajaxRequestItems.action?id=${item.id}" class="tablelink1" onclick="return false">修改</a></td> --%>
					<td>
						<a href="${pageContext.request.contextPath}/items/ajaxRequestItems.action?id=${item.id}" class="tablelink1" onclick="return false">修改</a>
						<a href="${pageContext.request.contextPath}/items/deleteItemsById.action?id=${item.id}" class="deleteItemsById" onclick="return false">删除</a>
					</td>
			   </tr>
			</c:forEach>
       </tbody>
    </table>

	<input type="button" name="hehehe" class="text" id="button_id"  title="" value="ddd">

  	<div id="editDiv" title="修改商品信息" style="display: none;padding-left: 5px;">
    	<form action="${pageContext.request.contextPath}/items/editItems.action" method="post" id="editdivForm">
    		<div>
    			<p>
	  			<label for="">商品名：</label>
	  			<input type="text" name="items.name" class="text" id="Name1"  title="" value="">
	  			</p>
				<p>
	  			<label for="">价格：</label>
	  			<input type="text" name="items.price" class="text" id="price1"  title="" value="">
	  			</p>
	  			<p>
	  			<label for="">图片：</label>
	  			<input type="text" name="items.pic" class="text" id="pic1"  title="" value="">
	  			</p>
	  			<p>
	  			<label for="">管理人：</label>
	  			<input type="text" name="items.user.userName" class="text" id="userName1"  title="" value="">
	  			</p>
	  			<p>
	  			<label for="">商品简介：</label>
	  			<input type="text" name="items.detail" class="text" id="detail1"  title="" value="">
	  			</p>
  			</div>
  		</form>
    </div>
  	
</body>
</html>