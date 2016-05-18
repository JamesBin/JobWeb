<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${job}/images/icon.ico" />
	<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${job}/css/background.css">
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	
	<style>
		@media screen and (max-width: 300px){
		  .responseFont{
		    font-size:13px;
		    white-space:nowrap;
		  }
		}
	</style>
</head>
<body>
	<jsp:include page="/background/common/head.jsp"/>
	
	<div class="container">
		<div class="col-xs-12 col-sm-3">
			<div class="list-group" id="menuBar">
				  <a href="#" class="list-group-item"><strong>主页</strong></a>
				  <a href="#" class="list-group-item"><strong>公司管理</strong></a>
				  <a href="${job}/backGroundAction!checkCompanyStatus.action" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;公司审批</a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;公司信息维护</a>
				  <a href="#" class="list-group-item"><strong>学生管理</strong></a>
				  <a href="${job}/backGroundAction!findStudentInfo.action" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;学生信息维护</a>
				  <a href="#" class="list-group-item"><strong>实习类别管理</strong></a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;实习类别维护</a>
				  <a href="${job}/backgroundAction!preSaveIsType.action" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;实习类别添加</a>
				  <a href="#" class="list-group-item"><strong>实习项管理</strong></a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;实习项维护</a>
				 <!-- 
				  <a href="#" class="list-group-item"><strong>菜单栏管理</strong></a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;菜单项维护</a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;菜单项添加</a>
				  <a href="#" class="list-group-item"><strong>系统管理</strong></a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;网站数据统计</a>
				  <a href="#" class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;刷新服务器缓存</a>
				 --> 
			</div>
		</div>
		
		<div class="col-sm-9">
			<div class="col-xs-12">
				<c:choose>
					<c:when test="${empty mainPage}">
						<ol class="breadcrumb responseFont">
							 <li><a href="#">主页</a></li>
						</ol>
					
						<div class="col-md-offset-3 col-md-9" style="margin-top:100px;">
							<h1 class="responseFont"><font color="#00a9E0">欢迎使用 ,后台管理系统！</font></h1>
						</div>
					</c:when>
					<c:otherwise>
						<jsp:include page="${mainPage }"></jsp:include>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		</div>
		
	
	<jsp:include page="/common/foot.jsp"/>
</body>
</html>