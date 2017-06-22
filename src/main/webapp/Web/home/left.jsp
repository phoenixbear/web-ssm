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
    
    <title>导航菜单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%@ include file="/public/commons.jspf"%>
	<LINK href="${pageContext.request.contextPath}/style/css/style1.css" type=text/css rel=stylesheet>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ztree/zTreeStyle.css" type="text/css">
	
	<script type="text/javascript">
	var setting = {
			view: {
				showLine: false,
				showIcon: false
				
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		$(function(){	
			//导航切换
			$(".menuson .header").click(function(){
				var $parent = $(this).parent();
				$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
				$(".ztree>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
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
		        	$(this).next('.ztree').slideUp();
				}else{
					$(this).next('.menuson').slideDown();
				    $(this).next('.ztree').slideDown();
				}
			});
		});
	
	</script>
	<style type="text/css">
	#zygl li cite{width: 26px;}
	.ztree{display: none; }
	</style>
  </head>
  
  <body>
	<div class="lefttop" style="background:url(${pageContext.request.contextPath}/images/lefttop.gif) repeat-x;"><span></span>菜单栏</div>
    <dl class="leftmenu" style="border-left: 1px gray solid;">
        
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/images/leftico01.png" /></span>商品管理
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="${pageContext.request.contextPath}/items/itemsIndex.action" target="main">商品信息</a>
            <i></i>
            </div>
        </li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/images/leftico01.png" /></span>用户管理
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="${pageContext.request.contextPath}/user/userIndex.action" target="main">用户信息</a>
            <i></i>
            </div>
        </li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/images/leftico01.png" /></span>权限管理
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="" target="main">权限信息</a>
            <i></i>
            </div>
        </li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/images/leftico01.png" /></span>统计管理
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="" target="main">统计信息</a>
            <i></i>
            </div>
        </li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/images/leftico01.png" /></span>日志管理
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="" target="main">日志信息</a>
            <i></i>
            </div>
        </li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/images/leftico01.png" /></span>回收站管理
    </div>
    	<ul class="menuson">
        <li>
            <div class="header">
            <cite></cite>
            <a href="" target="main">回收站信息</a>
            <i></i>
            </div>
        </li>
        </ul>    
    </dd>
    
    </dl>
  </body>
</html>