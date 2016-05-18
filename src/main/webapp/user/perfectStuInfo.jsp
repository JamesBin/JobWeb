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
						<h4>信息完善</h4>
					</div>
					<div class="line-bg">
						 <form class="form-horizontal" action="${job}/userAction!updateStudentInfo.action" method="post">
				  <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-7">
				      <input type="text"  class="form-control" name="student.username" id="username" value="${student.username}" placeholder="Username" readonly="readonly">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="realName" class="col-sm-2 control-label">真实姓名</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control" name="student.realName"  id="realName" value="${student.realName}" placeholder="realName" required="required">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="sex" class="col-sm-2 control-label">性别</label>
				    <div class="col-sm-7">
				    	<select class="form-control" name="student.sex">   <!-- 可利用js，jquery设置值 -->
			    	        <c:choose>
						  		<c:when test="${student.sex=='0'}">
							  		<option value="0" >男</option>
					    		    <option value="1" >女</option>
						  		</c:when>
						  		<c:otherwise>
							  		<option value="1" >女</option>
							  		<option value="0" >男</option>				    		    
				    		    </c:otherwise>
					        </c:choose>				    		
				    	</select>
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">E-mail</label>
				    <div class="col-sm-7">
				      <input type="email" class="form-control" name="student.email" id="inputEmail3" value="${student.email }" placeholder="Email" required="required">
				    </div>
				  </div>
				  
				  
				  <div class="form-group">
				    <label for="phone" class="col-sm-2 control-label">手机号码</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control" name="student.phone" id="phone" value="${student.phone }" placeholder="phone" required="required">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="school" class="col-sm-2 control-label">就读学校</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control" name="student.school" id="school" value="${student.school }" placeholder="school" required="required">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input type="hidden"  value="${student.id }" name="student.id"/>
				      <button type="submit" class="btn btn-info">确定</button>
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
</html>