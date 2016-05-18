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
					<h4>简历完整度</h4>
					<div class="progress">
					  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
					    60%
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
						<a href="#">我的专长</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-calendar"></span>
						<a href="#">实习经历</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-list-alt"></span>
						<a href="#">教育经历</a>
					</li>				
				</ul>
			</div>
			<div class="left">
				<!-- 个人信息 -->
				<div class="left-box">
					<div class="hb-head">
						<div class="update-head">
							<span class="glyphicon glyphicon-picture"></span>
							修改头像
						</div>
					</div>
					<div class="hb-info">
						<h2 class="hb-info-name">黄泳珊</h2>
						<div class="hb-info-h">
							<span class="hb-info-t">教育背景</span>
							<span class="glyphicon glyphicon-briefcase"></span>
							<span class="hb-info-c">华南农业大学 · 信息管理与信息系统</span>
						</div>
						<div class="hb-info-h">
							<span class="glyphicon glyphicon-user"></span>
							<span class="hb-info-t">基本信息</span>
							<span class="hb-info-c">女 21岁 本科 广州</span>
						</div>
						<div class="hb-info-h">
							<span class="hb-info-t">联系方式</span>
							<span class="glyphicon glyphicon-phone"></span>
							<span class="hb-info-c">15818130372</span>
							<span class="glyphicon glyphicon-envelope"></span>
							<span class="hb-info-c">770302485@qq.com</span>
						</div>
						<div class="button-box">
							<button class="btn btn-info">编辑基本信息</a>
						</div>
						
					</div>
				</div>

				<!-- 我的专长 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-signal"></span>
						<h4>我的专长</h4>
					</div>
					<div class="line-bg">
						1.掌握网络通信原理，网络拓扑结构，TCP/IP协议。2.熟悉java编程语言。3.掌握mvc模式，会使用ssh框架和play框架编写网站后台 。4.掌握html,css语言。5.在大一大二分别获得三等奖学金和二等奖学金。
						<a href="#" class="edit">编辑</a>
					</div>
				</div>

				<!-- 实习经历 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-calendar"></span>
						<h4>实习经历</h4>
						<a href="#" class="button">
							<span class="glyphicon glyphicon-plus"></span>
							添加
						</a>
					</div>
					<div class="record-bg">
						<div class="date">
							2015年7月&nbsp;至<br>2015年11月
						</div>
						<div class="record-content">
							<h4>前端开发工程师</h4>
							<p class="com">广州天维信息技术有限公司·产品部</p>
							<p class="dec">主要做UI界面升级改造的前端工作。</p>
							<div class="edit-box">
								<a href="#" class="edit">编辑</a>
								<a href="#" class="delete">删除</a>
							</div>
						</div>
					</div>
				</div>

				<!-- 教育经历 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-list-alt"></span>
						<h4>教育经历</h4>
						<a href="#" class="button">
							<span class="glyphicon glyphicon-plus"></span>
							添加
						</a>
					</div>
					<div class="record-bg">
						<div class="date">
							2012年9月&nbsp;至<br>2016年7月
						</div>
						<div class="record-content">
							<h4>信息管理与信息系统</h4>
							<p class="com">华南农业大学·信息学院</p>
							<p class="dec">连续三年获得校级奖学金。</p>
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
	</body>
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${job}/js/myResume.js"></script>
	<script type="text/javascript" src="${job}/js/index.js"></script>
</html>