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
								<h4>最近公司发布的招聘岗位</h4>
							</div>
							<div class="line-bg">
								<table class="table table-bordered table-hover">
									<tr>
										<th>招聘信息</th>
										<th>工作描述</th>
										<th>薪资</th>
										<th>公司名字</th>
										<th>公司概况</th>
										<th>联系电话</th>
										<th>操作</th>
									</tr>
									
									<c:forEach items="${interns}" var="list">
										<tr>
										<td>${list.jobTitle }</td>
										<td>${list.description }</td>
										<td>${list.salary }</td>
										<td>${list.company.companyName }</td>
										<td>${list.company.description }</td>
										<td>${list.company.phone }</td>
										<td>
											<button class="btn btn-primary btn-sm">查看公司信息</button>
											<a class="btn btn-primary btn-sm" href="${job}/internshipAction!addResumeConnection.action?internid=${list.id}&stuid=${student.id}" onclick="javascript:alert('gg');">投递简历</a>
										</td>
									    </tr>
									</c:forEach>
								</table>
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
				$('#findJob').addClass("active");
			});			
			
		</script>
	</body>
</html>