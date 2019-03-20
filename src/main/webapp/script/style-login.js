$(document).ready(function() {
	//提示请输入用户名,点击文字消失
	var username = $("#user_account");
	username.css("color","#aaa").val("用户名");
	username.focus(function(){
		if($(this).val()=="用户名"){
			$(this).val("");
		}
		$(this).css("color","#333")
	});
	username.blur(function(){
		 if(username.val()=="") {  
			$(this).css("color","#aaa").val("用户名");
		 }else{
			$(this).css("color","#333") 
		 }
	});
	//密码的提示文字,点击消失
	var showPwd = $("#text"), pwd = $("#user_pwd");  
	showPwd.css("color","#aaa").show(); 
	pwd.hide();
	showPwd.focus(function(){  
		pwd.show().focus();  
		showPwd.hide();  
	});  
	pwd.blur(function(){  
	   if(pwd.val()=="") {  
		   showPwd.show(); 
		   showPwd.css("color","#aaa");
		   pwd.hide();  
		}  
	});
	//验证码的提示文字,点击消失
	var verify = $("#check");
	verify.css("color","#aaa").val("验证码");
	verify.focus(function(){
		if($(this).val()=="验证码"){
			$(this).val("");
		}
		$(this).css("color","#333")
	});
	verify.blur(function(){
		 if(verify.val()=="") {  
			$(this).css("color","#aaa").val("验证码");
		 }else{
			$(this).css("color","#333") 
		 }
	});

	// 令圆形背景图片不停旋转
	$('.login-circle2').rotate();

	// 选择子系统
	$('.dropdown-menu').find('li').click(function() {
		$(this).addClass('active').siblings().removeClass('active');
		var selectedName = $(this).text();
		$('#selected-system').text(selectedName);
	});
});

/*-- 旋转函数 begin--*/
var ele ;
$.fn.extend({
    rotate: function () {
        ele = this ;
        setInterval('singleRotate()',50);
    }
});
//初始角度
var degree = 0;
//单次旋转
function singleRotate() {
    //一次增加10度
    degree = degree + 10 * Math.PI / 180;
    ele.css("transform","rotate("+degree+"deg)");
}
/*-- 旋转函数 end--*/