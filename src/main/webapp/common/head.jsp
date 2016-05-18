<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>

    <header class="navbar navvar-static-top header" role="banner">
		<div class="container common">
			<div class="row">
				<div class="col-sm-6">
					<ul class="nav nav-pills nav-justified">
					  <li class="active headerFontSize firstPage"><a href="${job}/index.jsp">首页</a></li>
					  
					  <c:if test="${currentUser == null}">
						  <li class="headerFontSize" id="findJob2"><a href="javascript:checkLoginState();">找实习 </a></li>
					  </c:if>
					  
					  <c:if test="${currentUser.role.id == 1}">
						  <li class="headerFontSize" id="findJob"><a href="${job}/internshipAction!findAllIntern.action">找实习 </a></li>
					  </c:if>
					  
					  <c:choose>
				  		<c:when test="${currentUser.role.id == 1}">
					 	   <li class="headerFontSize"  id="myResume"><a href="${job}/resumeAction!getInternsExp.action">我的简历</a></li>
				  		</c:when>
				  		<c:when test="${currentUser == null }">
				  		   <li class="headerFontSize"><a href="javascript:checkLoginState();">我的简历</a></li>		
				  		</c:when>
				  		<c:otherwise>
						   <li class="headerFontSize"><a href="javascript:checkLoginState();">简历管理</a></li>  		    
		    		    </c:otherwise>
					  </c:choose>					  
					  				  		
				  	<c:if test="${currentUser.role.id == 2}">
					  <li class="headerFontSize" id="pushNewJob"><a href="${job}/internshipAction!getAllInternshipByCompanyId.action?id=1">发布职位</a></li>
				  	</c:if>
				  	<c:if test="${currentUser == null}">
					  <li class="headerFontSize" id="publishResume"><a href="javascript:checkLoginState();">发布职位</a></li>
				  	</c:if>
				  	
					  <li class="headerFontSize" id="gasStation"><a href="javascript:checkLoginState();">加油站 </a></li>
					</ul>
				</div>
				
				<div class="col-sm-6">
					<div class="col-sm-9 searchdialog">
					 	<form action="${job}/jobAction!search.action" method="post" class="navbar-form " role="search">
						  <div class="input-group">
							  <input type="text" name="searchInfo" class="form-control" style="width:300px" placeholder="请输入期望的 实习岗位 或公司名 或城市.." required="required">
							  <span class="input-group-btn">
								  <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索实习</button>
							  </span>
						  </div>					 	
						</form>
					</div>	
					
					 <div class="col-sm-3 loginAndRegister">
					 	   <c:choose>
					 	   			<c:when test="${empty currentUser}">
					 	   				<span class="beforeLogin">
						 	   				<a id="loginModal" style="margin-left:12px;" href="#login" data-toggle="modal" onclick="loginFade()"><font color="white">登录</font></a> <font color="white">|</font> <a href="#register"  data-toggle="modal" onclick="registerFade()"><font color="white">注册</font></a>
					 	   				</span>
					 	   			</c:when>
					 	   			<c:otherwise>
					 	   				<span class="afterLogin" onmouseover="showMenu()" onmouseout="hiddenMenu()">
						 	   							<font color="white">${currentUser.username }</font>
						 	   			</span>
						 	   			
						 	   			<div class="loginBar" id="loginBar" onmouseover="showMenu()" onmouseout="hiddenMenu()">
						 	   				 <ul>
						 	   				 	<li><a href="${job}/userAction!perfectUserInfo.action"><font color="white">完善信息</font></a></li>
						 	   				 <c:if test="${currentUser.role.id == 1}">
						 	   				 	<li><a href="${job}/resumeAction!getInternsExp.action"><font color="white">创建简历</font></a></li>
						 	   				 	<li><a href="${job }/user/myPushJob.jsp"><font color="white">我的投递</font></a></li>
						 	   				 </c:if>
						 	   				 
						 	   				  <c:if test="${currentUser.role.id == 2}">
						 	   				 	<li><a href="#"><font color="white">公司认证</font></a></li>
						 	   				 	<li><a href="#"><font color="white">发布管理</font></a></li>
						 	   				 	<li><a href="#"><font color="white">投递信箱</font></a></li>
						 	   				 </c:if>
						 	   				 	
						 	   				 	<li><a href="${job}/userAction!logout.action"><font color="white">退出登录</font></a></li>
						 	   				 </ul>
						 	   			</div>
					 	   			</c:otherwise>
					 	   </c:choose>
					  </div>
					    <!-- Login -->
							<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content" style="margin-left:auto;margin-right:auto;margin-top:150px;width:450px;height:300px;">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">用户登录</h4>
							      </div>
							      <div class="modal-body">
							           <form action="${job}/userAction!login.action" method="post" class="form-horizontal" id="loginForm" name="loginForm">
											  <div class="form-group">
											    <div class="col-md-8 col-md-offset-2">
											      <input type="text" name="user.username" id="login_username" value="${user.username }" class="form-control" placeholder="邮箱/用户名" required>
											    </div>
											  </div>
											  
											  <div class="form-group">
											    <div  class="col-md-8 col-md-offset-2">
											      <input type="password" name="user.password" id="login_password" value="${user.password }" class="form-control icon-lock"  placeholder="密码" required>
											    </div>
											  </div>
											  
											  <div class="form-group">
											    <div  class="col-md-8 col-md-offset-2">
											      <div class="checkbox">
											        <label  class="fontstyle">
											          <input type="checkbox">记住我
											        </label>
											        <label class="fontstyle">忘记密码？ </label><font color=red id="error">${errorMsg }</font>
											      </div>
										
											    </div>
											  </div>
											  <input type="hidden" value="${currenUser}" id="currentUser"/>
										</form>
								
									      <c:if test="${not empty errorMsg}">
									      		<script>
									      				$('#login').modal('show');
									      				setTimeout("$('#error').html('')",1000);
									      		</script>
									      </c:if>
							      </div>
							      <div class="modal-footer">
							       	<button class="btn btn-info"  type="submit" form="loginForm">登录</button>
							       	<button class="btn btn-default" type="button" data-toggle="modal" data-target="#register" onclick="changeToRegister()" >没有帐号？快速注册</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="removeLoginInfo()">关闭</button>
							      </div>
							    </div>
							  </div>
							</div>
					  
					    <!-- Register -->
							<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content" style="margin-left:auto;margin-right:auto;margin-top:150px;width:450px;height:300px;">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">用户注册</h4>
							      </div>
							      <div class="modal-body">
							           <form action="${job}/userAction!register.action" method="post" class="form-horizontal" id="registerForm">
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="text" class="form-control" id="register_username" name="user.username" placeholder="邮箱/用户名" required  onblur="checkName()">
										    </div>
										  </div>
										  
										  <div class="form-group">
										    <div class="col-md-8 col-md-offset-2">
										      <input type="password" class="form-control" id="register_password" name="user.password"  placeholder="密码" required>
										    </div>
										  </div>
										  
									      <div class="form-group">
											    <div class="col-md-10 col-md-offset-2">
											    	<input type="radio" checked="checked" name="user.role.id" value="1">学生 &nbsp;&nbsp;
											    	<input type="radio" name="user.role.id" value="2">公司
											    	<span id="registerError" style="margin-left:5px;"></span>
											    </div>
										  </div>
									</form>
							      </div>
							      <div class="modal-footer">
							      	<button id="register_btn" class="btn btn-info" type="submit" form="registerForm">注册</button>
								    <button class="btn btn-default" type="button"  data-toggle="modal" data-target="#login" onclick="changeToLogin()" >已有帐号？直接登录</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="removeInfo()">关闭</button>
							      </div>
							    </div>
							  </div>
							</div>
					  </div>
				</div>
			</div>
	</header>
    
   										