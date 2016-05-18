<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
 
 
	<ol class="breadcrumb responseFont">
		<li><a href="#">主页</a></li>
		<li><a href="#">公司审批</a></li>
	</ol>
	

	<table class="table table-bordered table-hover">
		<tr class="info">
			<td>公司名</td>
			<td>地址</td>
			<td>联系电话</td>
			<td>描述</td>
			<td>申请状态</td>
			<td>管理员操作</td>
		</tr>
		
		<c:forEach items="${applyCompanyLists }" var="list">
			<tr>
				<td>${list.companyName }</td>
				<td>${list.address }</td>
				<td>${list.phone }</td>
				<td>${list.description }</td>
				<td>
					<c:if test="${list.status == 0}">待审核</c:if>
				</td>
				<td>
					<button class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#myModal">审核</button>
					<button class="btn btn-danger btn-sm" onclick="javascript:confirmDel(${list.id})">删除</button>
				</td>
			</tr>
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
