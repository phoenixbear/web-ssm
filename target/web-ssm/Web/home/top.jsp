<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title></title>
	<%@ include file="/public/commons.jspf"%>
	<LINK href="${pageContext.request.contextPath}/style/css/style.css" type=text/css rel=stylesheet>
	<style type="text/css">
		
	</style>
	<script type="text/javascript">
		$(function(){	
			//顶部导航切换
			$(".nav li a").click(function(){
				$(".nav li a.selected").removeClass("selected");
				$(this).addClass("selected");
			});	
		});	
	</script>
</head>

<body style="background:url(${pageContext.request.contextPath}/images/topbg.gif) repeat-x;background-color: #296289;">
	<div>
    	<span  style="text-align: center;font-size:48px;">xxxx</span>
    </div>
        
    <div class="topright">    
   		<ul>
		    <li>登录用户：${currentUser.userName}</li>
		    <li><a href="${pageContext.request.contextPath}/user/logout.action" target="_parent">退出</a></li>
	    </ul>
    </div>
    
</body>

</html>
