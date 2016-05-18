<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
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
			
		<div id="content" class="clearfix">
			<div class="right">
				<div class="progress-box">
					<h4>公司资料完整度</h4>
					<div class="progress">
					  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
					    80%
					  </div>
					</div>
				</div>
				<ul class="outline">
					<li class="active">
						<span class="glyphicon glyphicon-user"></span>
						<a href="#">基本信息</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-signal"></span>
						<a href="#">招聘岗位</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-calendar"></span>
						<a href="#">公司评价</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-list-alt"></span>
						<a href="#">薪资福利</a>
					</li>				
				</ul>
			</div>
			<div class="left">
				<!-- 个人信息 -->
				<div class="left-box">
					<div class="hb-head">
					
					</div>
					<div class="hb-info">
						<h2 class="hb-info-name">${company.companyName }</h2>
			
						<div class="hb-info-h">
							<span class="glyphicon glyphicon-user"></span>
							<span class="hb-info-t">基本信息</span>
							<span class="hb-info-c">${company.description }</span>
						</div>
						<div class="hb-info-h">
							<span class="hb-info-t">联系方式</span>
							<span class="glyphicon glyphicon-phone"></span>
							<span class="hb-info-c">${company.phone }</span><br/>
							<span class="glyphicon glyphicon-envelope" style="margin-left:60px;"></span>
							<span class="hb-info-c">邮箱：${company.username }@shixisheng.com</span>
						</div>
						<div class="hb-info-h">
							<span class="hb-info-t">公司地址</span>
							<span class="glyphicon glyphicon-briefcase"></span>
							<span class="hb-info-c">${company.address }</span>
						</div>
						
						<div class="button-box">
							<a href='${job}/userAction!perfectUserInfo.action' class="btn btn-info">编辑基本信息</a>
						</div>
						
					</div>
				</div>

				<!-- 发布信息 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-signal"></span>
						<h4>招聘信息</h4>
					</div>
					<div class="line-bg">
						<label>在招职位：</label><br/>
					<!-- 	1、Java开发工程师（10名），工作年限1~3年 <br/>
						2、Php开发工程师（15名），工作年限1~2年<br/>
						3、产品经理（5名），工作年限5~7年<br/> -->
			           <c:forEach var="interns" items="${internLists}"> 					
						  <div class="record-content">					
							 <p class="com">${interns.jobTitle},${interns.salary}元 ,${interns.description}</p>							
						  </div>					
					   </c:forEach>
						 <a href="#" class="edit" data-toggle="modal" data-target="#internshipModal">发布新岗位</a>
					</div>
				</div>

				<!-- 公司评价 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-calendar"></span>
						<h4>公司评价</h4>
						<a href="#" class="button btn-info">
							<span class="glyphicon glyphicon-plus"></span>
							添加
						</a>
					</div>
					<div class="record-bg">
						<div class="date">
						
						</div>
						<div class="record-content">
						
							<div class="edit-box">
								<a href="#" class="edit">编辑</a>
								<a href="#" class="delete">删除</a>
							</div>
						</div>
					</div>
				</div>

				<!-- 薪资福利 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-list-alt"></span>
						<h4>薪资福利</h4>
						<a href="#" class="button btn-info">
							<span class="glyphicon glyphicon-plus"></span>
							添加
						</a>
					</div>
					<div class="record-bg">
						<div class="date">
						
						</div>
						<div class="record-content">
						
							<div class="edit-box">
								<a href="#" class="edit">编辑</a>
								<a href="#" class="delete">删除</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>			
		
	<div class="modal fade" id="internshipModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content modal-md-10">
	       <div class="modal-header ">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	         <h3 class="modal-title">实习信息</h3>
	       </div>
	       <div class="modal-body" style="margin:0px 20px;">
	         <form class="form-horizontal form-group-lg" role="form" action="${job}/internshipAction!addInternship.action" method="post">
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>职称</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="jobTitle" required="true" placeholder="公司职位">
	              </div>
	           </div>
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>薪水</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="salary" required="true" placeholder="职责">
	              </div>
	           </div>
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>职责描述</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="description" required="true" placeholder="职责">
	              </div>
	           </div>  
	           <div class="form-group">
		           <div class="col-sm-offset-4 col-lg-8">
		               <input type="text" name="company.id" value="${company.id}">
		               <input type="text" name="internshipType.id" value="1">
		               <button type="submit" class="btn btn-default">录入</button>
		               <button type="reset" class="btn btn-default">重置</button>
		           </div>
	           </div>
	         </form>
	       </div>     
	    </div>
	  </div>
	</div>       
		
	</body>
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${job}/js/myResume.js"></script>
	<script type="text/javascript" src="${job}/js/index.js"></script>
	
	<script>
			$(document).ready(function() {
				$("#pushNewJob").siblings().removeClass("active");
				$("#pushNewJob").addClass("active");
			});
	</script>
</html>
