<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${pageContext.request.contextPath}/style/css/style2.css" type=text/css rel=stylesheet>
	<link href="${pageContext.request.contextPath}/style/css/style.css" type=text/css rel=stylesheet>
 	<link href="${pageContext.request.contextPath}/jqueryUI/css/start/jquery-ui-1.10.4.custom.min.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/jqueryUI/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jqueryUI/js/jquery-ui-1.10.4.custom.js"></script> 
	<script type="text/javascript">
		var JUI = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery/jqueryValidate/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/web/user/userList.js"></script>
	</head>
	
  	<body>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>首页</li>
    <li>用户管理</li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
        <li class="" id="add"><span><img src="images/t01.png" /></span>添加</li>
        <li class="" id="delete"><span><img src="images/t03.png" /></span>删除</li>
        </ul>
        <div style="position: absolute;right: 0;">
	        <form action="${pageContext.request.contextPath}/user/userList.action" method="post" >
	       	 	<ul class="seachform">
	        		<li><label>用户名</label><input name="userName" type="text" class="scinput" /></li>
		   		 	<li><label>&nbsp;</label><input name="search" type="submit" class="scbtn" value="查询"/></li>
		   	 	</ul>
	        </form>
        </div>
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked" id="selectAll"/></th>
        <th>用户名</th>
        <th>创建时间</th>
        <th>最近登录时间</th>
        <th>用户描述</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
        	<c:if test="${empty userlist }">
        		<tr>
					<td colspan="5" align="center">
						<span style="font-weight: bold;color: red;">暂无数据</span>
					</td>
				</tr>
        	</c:if>
			<c:forEach items="${userlist}" var="user">
				<tr>
					<td><input type="checkbox" name="checkboxBtn" value="${user.id}"></td>
					<td>${user.userName }</td>
					<td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${user.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${user.description }</td>
					<td>
						<a href="${pageContext.request.contextPath}/user/ajaxRequestUser.action?id=${user.id}" class="tablelink1" onclick="return false" id="">查看</a> 
						<a href="${pageContext.request.contextPath}/user/ajaxRequestUser.action?id=${user.id}" class="tablelink2" onclick="return false" id="">修改</a>
						<a href="${pageContext.request.contextPath}/user/deleteUser.action?id=${user.id}" class="tablelink3" onclick="return false" id=""> 删除</a>
					</td>
				</tr>
			</c:forEach>
        </tbody>
    </table>
    
    </div>
    
     <div id="seeDiv" title="查看用户信息" style="display: none;">
    	<p id="userName">
  			<label></label><br>
  		</p>
		<p id="createTime">
  			<label></label><br>
  		</p>
  		<p id="description">
  			<label></label><br>
  		</p>
    </div>
    
    <div id="editDiv" title="修改用户信息" style="display: none;padding-left: 5px;">
    	<form action="${pageContext.request.contextPath}/user/editUser.action" method="post" id="editdivForm">
    		<div>
    			<p>
	  			<label for="">用户名：</label>
	  			<input type="text" name="userName" class="text" id="userName1"  title="" value="">
	  			</p>
				<p>
	  			<label for="">密码：</label>
	  			<input type="password" name="password" class="text" id="password1"  title="" value="">
	  			</p>
	  			<p>
	  			<label for="">用户描述：</label>
	  			<input type="text" name="description" class="text" id="description1"  title="" value="">
	  			</p>
  			</div>	
  		</form>
    </div>
    
    <div id="addDiv" title="添加用户" style="display: none">
		<form action="${pageContext.request.contextPath}/user/addUser.action" method="post" id="addForm">
			 <p>
	  			<label for="yhm">用户名：</label>
	  			<input type="text" name="userName" class="text" id="yhm"  title="请输入用户名！">
	  		</p>
	  		<p>
	  			<label for="mm">密码：</label>
	  			<input type="password" name="password" class="text" id="mm" title="请输入密码，密码长度不少于6位数！">
	  		</p>
			<p>
				<label for="">用户描述:</label>
				<textarea rows="2" cols="30" class="textarea" name="description"></textarea>
			</p>
		</form>
    </div>
    
    <div class="tip" style="display: none;">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      	<div class="tipinfo">
        	<span><img src="images/ticon.png" /></span>
        	<div class="tipright">
        		<p>是否确认对信息的删除 ？</p>
        		<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        	</div>
        </div>
        
        <div class="tipbtn">
        	<input name="" type="button"  class="sure" value="确定" />&nbsp;
        	<input name="" type="button"  class="cancel" value="取消" />
        </div>
   </div>
    
  </body>
</html>
