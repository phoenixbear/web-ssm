<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head> 
  <frameset rows="100,*,25" framespacing=0 border=1 frameborder="no">
		<frame noresize name="TopMenu" scrolling="no" src="${pageContext.request.contextPath}/home/home_top.action">
		<frameset cols="180,*" id="resize">
			<frame noresize name="menu" scrolling="no" src="${pageContext.request.contextPath}/home/home_left.action">
			<frame noresize name="main" scrolling="no" src="${pageContext.request.contextPath}/home/home_right.action">
		</frameset>
		<frame noresize name="status_bar" scrolling="no" src="${pageContext.request.contextPath}/home/home_bottom.action">
  </frameset>
  <noframes>
  <body>
  		
  </body>
  </noframes>
</html>
