<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>

  <div class="col-md-9 contentStyle"> 
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3>Lucene <small>寻找到的工作信息</small></h3>
			</div>
			
				<div class="searchResult">
					<c:choose>
						<c:when test="${ empty searchResult}">
							<label class="page-header"><font color="#37B1D5">抱歉，目前找不到符合的查询内容，您可以选择更换关键词再次查询</font></label>
						</c:when>
						
						<c:otherwise>
							<ol>
								<c:forEach items="${searchResult }" var="list">
									${list}
								</c:forEach>	
							</ol>
							<jsp:include page="/common/page.jsp"/>
						</c:otherwise>
					</c:choose>
		    	</div>	
		</div>
  </div>
  
