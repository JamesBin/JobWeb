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
					  <div class="progress-bar" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
					    30%
					  </div>
					</div>
				</div>
				<ul class="outline">
					<li class="active">
						<span class="glyphicon glyphicon-user"></span>
						<a href="#top" onclick="scrollTop()">基本信息</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-calendar"></span>
						<a href="#left" onclick="scrollLeft()">实习经历</a>
					</li>			
					
					
				</ul>
				<a href="#" class="btn btn-default" style="margin-left:140px;margin-bottom:10px">添加新的简历模块</a>
			</div>
			<div class="left" id="left">
				<!-- 个人信息 -->
				<div class="left-box">
					<div class="hb-head">
						<div class="update-head">
							<span class="glyphicon glyphicon-picture"></span>
							修改头像
						</div>
					</div>
					<div class="hb-info">
						<h2 class="hb-info-name">${student.realName}</h2>
						<div class="hb-info-h">
							<span class="hb-info-t">教育背景</span>
							<span class="glyphicon glyphicon-briefcase"></span>
							<span class="hb-info-c">${student.school}</span>
						</div>
						<div class="hb-info-h">
							<span class="glyphicon glyphicon-user"></span>
							<span class="hb-info-t">基本信息</span>
							<span class="hb-info-c">
								<c:choose>
						  		<c:when test="${student.sex=='0'}">男
						  		</c:when>
						  		<c:otherwise>女
						  		</c:otherwise>
						        </c:choose>
                            </span>
						</div>
						<div class="hb-info-h">
							<span class="hb-info-t">联系方式</span>
							<span class="glyphicon glyphicon-phone"></span>
							<span class="hb-info-c">${student.phone}</span>
							<span class="glyphicon glyphicon-envelope"></span>
							<span class="hb-info-c">${student.email}</span>
						</div>
						<div class="button-box">
							<a class="btn btn-info" href="${job}/userAction!perfectUserInfo.action">编辑基本信息</a>
						</div>
						
					</div>
				</div>

				<!-- 实习经历 -->
				<div class="left-box">
					<div class="record-hd">
						<span class="glyphicon glyphicon-calendar"></span>
						<h4>实习经历</h4>
						<a href="#" class="button btn-info" data-toggle="modal" data-target="#internsModal">
			                                             添加
						</a>
					</div>
					<c:forEach var="interns" items="${interns}"> 
					<div class="record-bg">
						<div class="date"> <!-- 第一次add的经历加载后日期格式不一致，需要刷新后才一致，使用标签解决问题 -->
						<fmt:formatDate value="${interns.start}" type="date" dateStyle="short"/>&nbsp;至<br><fmt:formatDate value="${interns.end}" type="date" dateStyle="short"/>
						</div>
						<div class="record-content">
							<h4>${interns.position}</h4>
							<p class="com">${interns.comname}·${interns.department}</p>
							<p class="dec">${interns.details}</p>
							<div class="edit-box">
								<a href="#" class="edit" data-toggle="modal" data-target="#updateModal${interns.id}">编辑</a>
								
					<div class="modal fade" id="updateModal${interns.id}" tabindex="-1" role="dialog">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content modal-md-10">
						       <div class="modal-header ">
						         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						         <h3 class="modal-title">实习信息</h3>
						       </div>
						       <div class="modal-body">
						         <form class="form-horizontal form-group-lg" role="form" action="${job}/resumeAction!updateInterns.action" method="post">
						           <div class="form-group">
						              <label class="col-lg-4 control-label"><h4>初始日期</h4></label>
						              <div class="col-lg-8">      
						                <input name="start" type="date" class="form-control" value="${interns.start}" required="required">
						              </div>
						           </div>
						           <div class="form-group">
						              <label class="col-lg-4 control-label"><h4>结束日期</h4></label>
						              <div class="col-lg-8">      
						                <input name="end" type="date" class="form-control" value="${interns.end}" required="required">
						              </div>
						           </div>
						           <div class="form-group">
						              <label class="col-lg-4 control-label"><h4>公司名称</h4></label>
						              <div class="col-lg-8">
						                <input type="text" class="form-control" name="comname" value="${interns.comname}" required="true" placeholder="公司名称">
						              </div>
						           </div>
						           <div class="form-group">
						              <label class="col-lg-4 control-label"><h4>公司部门</h4></label>
						              <div class="col-lg-8">
						                <input type="text" class="form-control" name="department" value="${interns.department}" required="true" placeholder="公司部门">
						              </div>
						           </div>
						            <div class="form-group">
						              <label class="col-lg-4 control-label"><h4>公司职位</h4></label>
						              <div class="col-lg-8">
						                <input type="text" class="form-control" name="position" value="${interns.position}" required="true" placeholder="公司职位">
						              </div>
						           </div>
						           <div class="form-group">
						              <label class="col-lg-4 control-label"><h4>职责</h4></label>
						              <div class="col-lg-8">
						                <input type="text" class="form-control" name="details" value="${interns.details}" required="true" placeholder="职责">
						              </div>
						           </div>  
						           <div class="form-group">
							           <div class="col-sm-offset-4 col-lg-8">
							               <input type="hidden" name="id" value="${interns.id}">
							               <input type="hidden" name="stuid" value="${student.id}">
							               <button type="submit" class="btn btn-default">录入</button>
							               <button type="reset" class="btn btn-default">重置</button>
							           </div>
						           </div>
						         </form>
						       </div>     
					    </div>
					  </div>
					</div>       								
								<a href="${job}/resumeAction!removeIntern.action?id=${interns.id}" class="delete">删除</a>
							</div>
						</div>
					</div>
					</c:forEach>					
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="internsModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content modal-md-10">
	       <div class="modal-header ">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	         <h3 class="modal-title">实习信息</h3>
	       </div>
	       <div class="modal-body" style="margin:0px 20px;">
	         <form class="form-horizontal form-group-lg" role="form" action="${job}/resumeAction!addInterns.action" method="post">
	           <div class="form-group">
	              <label class="col-lg-4 control-label" ><h4>初始日期</h4></label>
	              <div class="col-lg-8">      
	                <input name="start" type="date" class="form-control Wdate" required="required" onFocus="WdatePicker({lang:'zh-cn'})" readonly>
	              </div>
	           </div>
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>结束日期</h4></label>
	              <div class="col-lg-8">      
	                <input name="end" type="date" class="form-control Wdate" required="required" onFocus="WdatePicker({lang:'zh-cn'})" readonly> 
	              </div>
	           </div>
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>公司名称</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="comname" required="true" placeholder="公司名称">
	              </div>
	           </div>
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>公司部门</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="department" required="true" placeholder="公司部门">
	              </div>
	           </div>
	            <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>公司职位</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="position" required="true" placeholder="公司职位">
	              </div>
	           </div>
	           <div class="form-group">
	              <label class="col-lg-4 control-label"><h4>职责</h4></label>
	              <div class="col-lg-8">
	                <input type="text" class="form-control" name="details" required="true" placeholder="职责">
	              </div>
	           </div>  
	           <div class="form-group">
		           <div class="col-sm-offset-4 col-lg-8">
		               <input type="hidden" name="stuid" value="${student.id}">
		               <button type="submit" class="btn btn-default">录入</button>
		               <button type="reset" class="btn btn-default">重置</button>
		           </div>
	           </div>
	         </form>
	       </div>     
	    </div>
	  </div>
	</div>       
	
		<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript" src="${job}/js/myResume.js"></script>
		<script type="text/javascript" src="${job}/js/index.js"></script>
		<script type="text/javascript" src="${job}/My97DatePicker/WdatePicker.js" ></script>
		<script type="text/javascript">
		  function scrollTop(){
          	  $('.outline').children().first().addClass("active");
       		  $('.outline').children().last().removeClass("active");
           }
          function scrollLeft(){
              $('.outline').children().first().removeClass("active");
         	  $('.outline').children().last().addClass("active");
           }
        </script>
</body>
	
</html>