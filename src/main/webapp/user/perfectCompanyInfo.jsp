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
		<div class="col-md-offset-2 col-md-6">
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-signal"></span>
						<h4>公司信息完善</h4>
					</div>
					<div class="line-bg">
						<form class="form-horizontal" action="${job}/userAction!updateCompanyInfo.action" method="post">
						  <div class="form-group">
						    <label for="username" class="col-sm-2 control-label">用户名</label>
						    <div class="col-sm-7">
						      <input type="text"  class="form-control" name="company.username" value="${company.username}" placeholder="Username" readonly="readonly" >
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="companyName" class="col-sm-2 control-label">公司名称</label>
						    <div class="col-sm-7">
						      <input type="text" class="form-control" name="company.companyName"  id="companyName" value="${company.companyName}" placeholder="companyName" required="required">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="address" class="col-sm-2 control-label">公司地址</label>
						    <div class="col-sm-7">
						       <input type="text" class="form-control" name="company.address" id="address" value="${company.address}" placeholder="Address" required="required">
						    </div>
						  </div>
						  
						   <div class="form-group">
						    <label for="phone" class="col-sm-2 control-label">联系电话</label>
						    <div class="col-sm-7">
						      <input type="text" class="form-control" name="company.phone" id="phone" value="${company.phone }" placeholder="phone" required="required">
						    </div>
						  </div>
						  
						  
						  <div class="form-group">
						    <label for="description" class="col-sm-2 control-label">备注</label>
						    <div class="col-sm-7">
						     <textarea class="form-control" name="company.description" id="description"  placeholder="description" required="required" rows="8" cols="20">${company.description}</textarea>
						    
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <input type="hidden" name="company.id" value="${company.id }"/>
						      <input type="hidden" name="company.status"  value="${company.status}"/>
						      <button type="submit" class="btn btn-info" >确定</button>
						      <button type="button" class="btn btn-default" onclick="javascript:history.back()">返回</button>
						    </div>
						  </div>
						</form>
					</div>
				</div>
			</div>
		
		<div class="col-md-3">
			<div class="right">
				<div class="progress-box">
					<h4><span class="glyphicon glyphicon-calendar"></span>&nbsp;实习工作推荐</h4>
				</div>
				<jsp:include page="/common/jobRecommend.jsp"></jsp:include>
			</div>
		</div>
		
		
			
		</div>
	</body>
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${job}/js/myResume.js"></script>
	<script type="text/javascript" src="${job}/js/index.js"></script>
	</body>
</html>