	
	function loginFade(){
		if(!$('#login').hasClass('fade'))
			$('#login').addClass('fade');
		removeLoginInfo();
	}
	
	function registerFade(){
		if(!$('#register').hasClass('fade'))
			$('#register').addClass('fade');
	}
	
	function changeToRegister() {
		if(!$('#register').hasClass('fade')){
		$('#register').addClass('fade');
		}
		$('#login').removeClass('fade');
		$('#login').modal('hide');
		removeInfo();
	}
	
	function changeToLogin() {
		if(!$('#login').hasClass('fade')) {
		$('#login').addClass('fade');
		}
		$('#register').removeClass('fade');
		$('#register').modal('hide');
		removeLoginInfo();
	}
	
	function removeInfo() {
		$('#register_username').val('');
		$('#register_password').val('');
		$('#registerError').html('');
	}
	
	function removeLoginInfo() {
		$('#login_username').val('');
		$('#login_password').val('');
	}
	
	
	function checkName() {
		var username = $('#register_username').val();
		console.log(username+" :asd");
		if(username =='' || username ==null) {
			$("#registerError").html('<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="width:15px;height:15px;"></span><font color="#2CACD3"><b>请先填写用户名</b></font>');
		}else{
			$.ajax({
				type:"GET",
				contentType:"application/json; charset=utf-8",
				url:"checkName.action",
				data:{username:username},
				dataType: "json",
				success:function(result){
					if(parseInt(result)==1){
						$("#registerError").html('<span class="glyphicon glyphicon-remove btn-danger" aria-hidden="true" style="width:15px;height:15px;"></span><font color=red>该用户名已被注册</font>');
						$('#register_btn').attr("disabled",true);
					}
					if(parseInt(result)==0){
						$("#registerError").html('<span class="glyphicon glyphicon-ok btn-success" aria-hidden="true"></span><font color=green>恭喜，该用户名可注册</font>');
						$('#register_btn').removeAttr("disabled");
					}
				},
				error:function(){
					console.log("failure");
				}
			});
		}
	}
	
	function checkLoginState() {
		var user = $('#currentUser').val();
		if( user == '' || user == null) {
			$('#loginModal').click();
		}
	}
	
	function findJob() {
		//切换导航栏选中页面
		$('#findJob').siblings().removeClass("active");
		$('#findJob').addClass("active");
	}
	
	
	function showMenu() {
		$('#loginBar').css("visibility","visible");
	}
	
	function hiddenMenu() {
		$('#loginBar').css("visibility","hidden");
	}