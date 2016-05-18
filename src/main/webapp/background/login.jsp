<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>后台管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${job}/images/icon.ico" />
	<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${job}/css/background.css">
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="/logo.jsp"/>

	<div class="container" class="border:1px solid #ccc">
		<div class="loginBar">
			<h3 class="col-sm-offset-5">大学生实习网&nbsp;<small>后台管理系统</small> </h3>      
			<form class="form-horizontal" action="${job}/backGroundAction!login.action" method="post">
				  <div class="form-group">
				    <label for=username class="col-sm-4 control-label">用户名</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" name="user.username" id="username" value="${user.username }" placeholder="Username" required="required">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;码</label>
				    <div class="col-sm-5">
				      <input type="password" class="form-control" name="user.password" id="password" value="${user.password }" placeholder="Password" required="required" />
				      <input type="hidden" name="user.role.id" value="3"/>
			 	   </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-4 col-sm-8">
				      <button type="submit" class="btn btn-default">登录</button>
				      <button type="reset" class="btn btn-default">重设</button>
				      <font color="red"> ${errorMsg}</font>
				    </div>
				  </div>
			</form>
		</div>
	</div>
	
</body>
</html>