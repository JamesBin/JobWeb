<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>大学生实习网</title>
	<link rel="icon" href="${job}/images/icon.ico" />
	<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${job}/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${job}/css/index.css">
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${job}/js/index.js"></script>
</head>
<script>  
function IsExistCompany(){
		$.ajax({
			type:"GET",
			url:"${job}/companyAction!findIsExistCompany.action",
			data:{companyName:$('#registerForm input[name=companyName]').val()},
			dataType: "json",
			success:function(r){
				console.info(r);
				if(r.success){
					$("#regCompanyError").html('<span class="glyphicon glyphicon-remove btn-danger" aria-hidden="true" style="width:15px;height:15px;"></span><font color=red>该公司已被注册</font>');
					$('#regCompany_btn').attr("disabled",true);	
				}
				else{
					 /* 空值仍可显示该公司可注册的信息，待修改 */
					$("#regCompanyError").html('<span class="glyphicon glyphicon-ok btn-success" aria-hidden="true"></span><font color=green>恭喜，该公司可注册</font>');
					$('#regCompany_btn').removeAttr("disabled");						
				}
			},
			error:function(){
				console.log("failure");
			}
		});
}
</script>
<body>
		<div class="container logoPicture"></div>
	
			<div class="container">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#regCompany">注册</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#logCompany">登陆</button>
				 <!-- Register -->
							<div class="modal fade" id="regCompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content" style="margin:100px 100px;width:450px;height:400px;">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">公司注册</h4>
							      </div>
							      <div class="modal-body">
							           <form action="${job}/companyAction!saveCompany.action" method="post" class="form-horizontal" id="registerForm">
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="text" class="form-control" name="companyName" placeholder="公司名称" required onblur="IsExistCompany()">
										      <span id="regCompanyError" style="margin-left:5px;"></span>
	 									    </div>
										  </div>								  
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="password" class="form-control" name="password"  placeholder="密码" required>
										    </div>
										  </div>
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="text" class="form-control" name="telephone" placeholder="联系电话" required>
										    </div>
										  </div>
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="text" class="form-control" name="address" placeholder="总部地址" required>
										    </div>
										  </div>
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="text" class="form-control" name="description" placeholder="公司描述" required>
										    </div>
										  </div>				     
									</form>
							      </div>
							      <div class="modal-footer">
							      	<button id="regCompany_btn" class="btn btn-info" type="submit" form="registerForm">注册</button>
							      	<button class="btn btn-info" class="btn btn-info" type="reset" form="registerForm">重置</button>	
							      </div>
							    </div>
							  </div>
							</div>
			
 
 	                <div class="modal fade" id="logCompany" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">公司登陆</h4>
							      </div>
							      <div class="modal-body">
							           <form action="${job}/companyAction!login.action" method="post" class="form-horizontal" id="logForm">
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="text" class="form-control" name="companyName" placeholder="公司名称" required>
										    </div>
										  </div>								  
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="password" class="form-control" name="password"  placeholder="密码" required>
										    </div>
										  </div>				     
									   </form>
							      </div>
							      <div class="modal-footer">
							      	<button id="register_btn" class="btn btn-info" type="submit" form="logForm">登陆</button>
							      	<button class="btn btn-info" class="btn btn-info" type="reset" form="logForm">重置</button>	
							      </div>
							    </div>
							  </div>
						</div>
		  </div>	
 
  <div class="container">	 
	  <c:choose>
		<c:when test="${empty company}">
			 Not Login
		</c:when>
  		<c:otherwise>
  			HelloWorld,${company.companyName}<br>
            <a href="${job}/companyAction!logout.action">退出登录</a>
            
            
         <div class="panel panel-default">
		     <div class="panel-heading"><h3>实习发布</h3></div>
		     <form class="form-horizontal form-group-lg" role="form" action="internshipAction!saveInternship.action" method="post">
		           <div class="form-group">
		             <label class="col-lg-4 control-label"><h4>职称</h4></label>
		             <div class="col-lg-8">
		               <input type="text" class="form-control" name="jobTitle" required placeholder="职称">
		             </div>
		           </div>
		           <div class="form-group">
		             <label class="col-lg-4 control-label"><h4>职责描述</h4></label>
		             <div class="col-lg-8">
		               <textarea class="" name="description" rows="5" cols="104" required placeholder="职责描述"></textarea>
		             </div>
		           </div>
		            <div class="form-group">
		             <label class="col-lg-4 control-label"><h4>薪水</h4></label>
		             <div class="col-lg-8">
			             <div class="input-group">
			               <div class="input-group-addon">￥</div>		               
			               <input type="text" class="form-control" name="salary" required placeholder="薪水">
			             </div>
		             </div>
		           </div>
		            <div class="form-group hidden">
		             <label class="col-lg-4 control-label"><h4>企业id</h4></label>
		             <div class="col-lg-8">
		               <input type="text" class="form-control" name="company.id" value="${company.id}">
		             </div>
		           </div>
		           <div class="form-group">
		             <div class="col-sm-offset-4 col-lg-8">
		                <button type="submit" class="btn btn-default">发布</button>
		                <button type="reset" class="btn btn-default">重置</button>
		             </div>
		           </div>
               </form>
         </div>
            
            
  		</c:otherwise>
	    </c:choose>
  </div>
 
 
 
		<jsp:include page="/common/foot.jsp"/>	
</body>
</html>