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
</head>

<body>
			<jsp:include page="/common/head.jsp"/>
			<jsp:include page="/logo.jsp"/>
			
		
			<div class="container">
				<div class="row">
					<div class="page-header">
					  <h1>Find a good job in here &nbsp;<small>Try your best!</small> </h1>
					</div>
				</div>
			
				<div class="row content" >
					  <div class="col-md-3"> 
					  		 <jsp:include page="/common/meau.jsp"/>
					  </div>
					 
					  <c:choose>
					  		<c:when test="${empty mainPage }">
					  				<jsp:include page="/common/content.jsp"/>	
					  		</c:when>
					  		<c:otherwise>
					  			 <jsp:include page="${mainPage}"/>
					  		</c:otherwise>
					  </c:choose>
				</div>
			</div>
	 		
			<jsp:include page="/common/foot.jsp"/>	
			
			
	<script type="text/javascript" src="${job}/bootstrap/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${job}/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${job}/js/index.js"></script>
	<script type="text/javascript">
		function getData() {
			$.ajax({
				type :"GET",
				url : "${job}/userAction!getData.action",
				dataType : "json",
				success:function(r) {
				}
			});
		}
	</script>
</body>
</html>