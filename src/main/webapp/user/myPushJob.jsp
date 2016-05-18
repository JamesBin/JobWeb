<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>大学生实习网</title>
		<link rel="icon" href="${job}/images/icon.ico" />	
		<link rel="stylesheet" href="${job}/css/index.css">
		<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="${job}/css/header.css">
		<link rel="stylesheet" href="${job}/css/myResume.css">
	</head>
	
	<body>
			<div class="container-fluid">
				<jsp:include page="/common/head.jsp"/>
				<div class="col-md-offset-2 col-md-8">
						<div class="left-box">
							<div class="record-hd">
								<span class="glyphicon glyphicon-signal"></span>
								<h4>最近投递的简历</h4>
							</div>
							<div class="line-bg">
									${currentUser.username }，您好！目前尚未投递过简历，请投递后再查看反馈，谢谢
							</div>
						</div>
					</div>
			</div>
	</body>
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${job}/js/index.js"></script>
		<script>
			$(document).ready(function() {
				$('#findJob').siblings().removeClass("active");
				$('.firstPage').siblings().removeClass("active");
			});
		</script>
	
	</body>
</html>