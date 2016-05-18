<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" isErrorPage="true" %>
    
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Not found</title>
	<style  type="text/css"> 
		.errorPage {margin-left:auto;margin-right:auto;margin-top:80px;width:960px;}
	</style>
</head>
<body>
		<div class="errorPage">
			<h2 style="margin-left:100px;"><font color="blue">404 :抱歉!没找到指定页面，请先欣赏一张漂亮的图片(～￣▽￣)～</font></h2>
			<a href="${job}/index.jsp">
				<img alt="slow down .. " title="点我返回首页" src="${job}/images/error.jpg" width=960 height=490>
			</a>
		</div>
</body>
</html>