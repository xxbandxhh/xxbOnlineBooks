<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好易购商城注册页面</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/drag.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/drag.js"></script>

</head>
<body>
<div class="wrap">
	<div class="banner-show" id="js_ban_content">
		<div class="cell bns-01">
			<div class="con">
			</div>
		</div>
		<div class="cell bns-02" style="display:none;">
			<div class="con">
				<a href="javascript:void(0);" target="_blank" class="banner-link">
				<i>好易购商城</i></a> </div>
		</div>
		<div class="cell bns-03" style="display:none;">
			<div class="con">
				<a href="javascript:void(0);" target="_blank" class="banner-link">
				<i>好易购商城</i></a> </div>
		</div>
	</div>
	<div class="banner-control" id="js_ban_button_box">
		<a href="javascript:;" class="left">左</a>
		<a href="javascript:;" class="right">右</a>
	</div>
<script type="text/javascript">
;(function(){
	
	var defaultInd = 0;
	var list = $('#js_ban_content').children();
	var count = 0;
	var change = function(newInd, callback){
		if(count) return;
		count = 2;
		$(list[defaultInd]).fadeOut(400, function(){
			count--;
			if(count <= 0){
				if(start.timer) window.clearTimeout(start.timer);
				callback && callback();
			}
		});
		$(list[newInd]).fadeIn(400, function(){
			defaultInd = newInd;
			count--;
			if(count <= 0){
				if(start.timer) window.clearTimeout(start.timer);
				callback && callback();
			}
		});
	}
	
	var next = function(callback){
		var newInd = defaultInd + 1;
		if(newInd >= list.length){
			newInd = 0;
		}
		change(newInd, callback);
	}
	
	var start = function(){
		if(start.timer) window.clearTimeout(start.timer);
		start.timer = window.setTimeout(function(){
			next(function(){
				start();
			});
		}, 8000);
	}
	
	start();
	
	$('#js_ban_button_box').on('click', 'a', function(){
		var btn = $(this);
		if(btn.hasClass('right')){
			//next
			next(function(){
				start();
			});
		}
		else{
			//prev
			var newInd = defaultInd - 1;
			if(newInd < 0){
				newInd = list.length - 1;
			}
			change(newInd, function(){
				start();
			});
		}
		return false;
	});
	
})();

function submitForm(){
	$("#registForm").submit();
}

</script>


	<form id="registForm" action="${pageContext.request.contextPath }/registServlet" method="post">
		<div class="container">
			<div class="register-box">
				<div class="reg-slogan">
					新用户注册</div>
				<div class="reg-form" id="js-form-mobile">
					<div class="cell">
						<input id="phone" type="password" value="${user.username }" placeholder="请输入手机号码" name="username" id="js-mobile_ipt" class="text" maxlength="11" />
					</div>
					<div class="cell">
						<input type="password" placeholder="请输入密码"  name="password" id="js-mobile_pwd_ipt" class="text" />
					</div>
					<div class="cell">
						<input id="email" type="text" placeholder="请输入邮箱"  value="${user.email }" name="email" id="js-mail_ipt" class="text" />
					</div>
					<div class="cell">
						<input id="name" type="text" placeholder="请输入姓名"  value="${user.name }" name="name" id="js-mail_ipt" class="text" />
					</div>
					<!-- !短信验证码 -->
					<div style="color:red">
						${registInfo}
					</div>
					<div id="vcode" class="cell vcode" style="display: none">
						<input type="text" placeholder="输入手机验证码" name="code" id="js-mobile_vcode_ipt" class="text" maxlength="6" />
						<a href="javascript:;" id="js-get_mobile_vcode" class="button btn-disabled">
							<i id="second">60</i>秒后重新获得
						</a> 
					</div>
					
					
					<!-- 滑动滑块 -->
					<div id="dragDiv" class="cell">
						<div id="drag"></div>
					</div>
					<script type="text/javascript">
						$('#drag').drag();
					</script>
					
					<div class="user-agreement" style="color:#BDBDBD;font-size: 14px">
						<input type="checkbox" id="js-mail_chk" checked="checked" />
						同意《黑马网上商城用户服务协议》
					</div>
					<div class="bottom" onclick="submitForm()">
						<a id="js-mobile_btn" href="javascript:;" class="button btn-green">
						立即注册</a></div>
				</div>
				
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	FancyForm.setup();
});
</script>

</body>
</html>
