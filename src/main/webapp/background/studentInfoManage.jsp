<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
 
 
	<ol class="breadcrumb responseFont">
		<li><a href="#">主页</a></li>
		<li><a href="#">学生信息管理</a></li>
	</ol>
	

	<table class="table table-bordered table-hover">
		<tr class="info">
			<td>用户名</td>
			<td>真实姓名</td>
			<td>联系电话</td>
			<td>学校</td>
			<td>性别</td>
			<td>邮箱</td>
			<td>管理员操作</td>
		</tr>
		
		
		<c:forEach items="${studentLists}" var="list">
			<td>${list.username }</td>
			<td>${list.realName }</td>
			<td>${list.phone }</td>
			<td>${list.school }</td>
			<td><c:if test="${list.sex == 0}">男</c:if></td>
			<td>${list.email }</td>
			<td>
				<button class="btn btn-sm btn-primary">修改</button>
				<button class="btn btn-sm btn-primary">重置密码</button>
				<button class="btn btn-sm btn-danger">删除</button>
			</td>
		</c:forEach>
	</table>
	
	
	<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">公司审核</h4>
		      </div>
		      <div class="modal-body">
				      <form>
						  <div class="form-group">
						    <label for="exampleInputEmail1">申请情况：</label>
						     <select class="form-control" id="status">
				             	<option value="1">通过</option>
				             	<option value="-1">不通过</option>
				             	<option value="0">待审核</option>
			           		  </select>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">反馈信息：</label>
						    <textarea class="form-control" id="exampleInputPassword1" placeholder="Password" cols="20" rows="8">...</textarea>
						  </div>
						</form>
	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary">保存</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<script>
			function confirmDel(id) {
				if(confirm("是否确定删除此公司信息")) {
					 window.location.href='${job}/backGroundAction!deleteCompany.action?id='+id;
				}
			}
		</script>
