<%@ include file="/common/taglibs.jsp" %>
<%@ page pageEncoding="UTF-8" %>
<script type="text/javascript">
	function setDateTime(){
			var date=new Date();
			var day=date.getDay();
			var week;
			switch(day){
			case 0:week="星期日";break;
			case 1:week="星期一";break;
			case 2:week="星期二";break;
			case 3:week="星期三";break;
			case 4:week="星期四";break;
			case 5:week="星期五";break;
			case 6:week="星期六";break;
			}
			var minute;
			var second;
			if(date.getMinutes()<10) {
				minute = "0" + date.getMinutes();
			}else{
				minute =  date.getMinutes();
			}
			if(date.getSeconds()<10) {
				second = "0"+ date.getSeconds();
			}else{
				second = date.getSeconds();
			}
			
			var today=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日  "+week+" "+date.getHours()+":"+minute+":"+second;
			document.getElementById("today").innerHTML=today;
		}
		
		window.setInterval("setDateTime()", 1000);
		
		function logout(){
			if(confirm('您确定要退出系统吗？')){
				window.location.href='${job}/userAction!logout.action';
			}
		}
</script>

	<div class="container" style="height:50px;margin-top:10px;">
			<div class="col-xs-12 col-sm-3">
				<h4><b style="color:#00a9E0;">大学生实习网-后台管理</b></h4>
			</div>
			<div class="col-xs-12 col-sm-6 responseFont" style="margin-top:20px;">
				欢迎管理员：
				<font color="red">
						<font color="#00a9E0">${currentUser.username }</font>
				</font>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:logout()">[&nbsp;安全退出&nbsp;]</a>
			</div>
			
			<div class="col-xs-12 col-sm-3" style="margin-top:20px;">
				<font id="today" class="currentDateTime"></font>
			</div>
	</div>
