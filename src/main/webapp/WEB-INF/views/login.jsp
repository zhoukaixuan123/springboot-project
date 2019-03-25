<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--title  上添加图片--%>
    <link href="<%=basePath%>/images/icon.ico" rel="shortcut icon">
    <title>系统登录</title>
    <link href="<%=basePath%>/style/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <link href="<%=basePath%>/style/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=basePath%>/script/jquery1.42.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.SuperSlide.js"></script>

    <script>
        $(function(){

            $(".i-text").focus(function(){
                $(this).addClass('h-light');
            });

            $(".i-text").focusout(function(){
                $(this).removeClass('h-light');
            });

            $("#username").focus(function(){
                var username = $(this).val();
                if(username=='输入账号'){
                    $(this).val('');
                }
            });

            $("#username").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入账号');
                }
            });


            $("#password").focus(function(){
                var username = $(this).val();
                if(username=='输入密码'){
                    $(this).val('');
                }
            });


            $("#yzm").focus(function(){
                var username = $(this).val();
                if(username=='输入验证码'){
                    $(this).val('');
                }
            });

            $("#yzm").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入验证码');
                }
            });



            $(".registerform").Validform({
                tiptype:function(msg,o,cssctl){
                    var objtip=$(".error-box");
                    cssctl(objtip,o.type);
                    objtip.text(msg);
                },
                ajaxPost:true
            });

        });


        //登录方法
        function getLogin() {

            $.ajax({
                type: "POST",//方法类型
                dataType: "TEXT",//预期服务器返回的数据类型
                url: "<%=basePath%>/login/verificationLogin" ,//url
                data: $('#from1').serialize(),
                success: function (result) {
                    if(result  == "Y"){
                     window.location.href = "<%=basePath%>/index/getIndex";
                        return;
                    }if(result == "YZM"){
                        document.getElementById("yzm").value ='';
                       alert("验证码错误！");
                       return;

                    }if(result == "USERNAME"){
                        alert("账号错误！");
                        return;

                    }if(result == "PASSWORD"){
                        alert("密码错误！");
                        return;
                    }

                },
            });

        }


        $(function(){
            getImg();
        })

        //获取验证码
        function  getImg(){

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "<%=basePath%>/login/getImage" ,//url
                success: function (result) {

                },
                error : function(result) {
                    if(result == "N"){
                        alert("验证码错误");

                    }

                }
            });
        }
        //刷新验证码 30秒一次
        setTimeout(function(){
            shx();  //第一个参数为函数 你可以传入函数名 或一个匿名函数
        },30000);
        //刷新验证码
        function shx() {
            document.getElementById("validateCodeImg").src="${pageContext.request.contextPath}/login/getImage?"+Math.random();
        }
    </script>


</head>

<body>


<div class="header">
    <h1 class="headerLogo"><a title="后台管理系统" target="_blank" href="#"><img alt="logo" src="<%=basePath%>images/logo.gif"></a></h1>
    <div class="headerNav">
        <a target="_blank" href="#">企业官网</a>
        <a target="_blank" href="#">关于我们</a>
        <a target="_blank" href="#">开发团队</a>
        <a target="_blank" href="#">意见反馈</a>
        <a target="_blank" href="#">帮助</a>
    </div>
</div>

<div class="banner">

    <div class="login-aside">
        <div id="o-box-up"></div>
        <div id="o-box-down"  style="table-layout:fixed;">
            <div class="error-box"></div>

            <form class="registerform"  id="from1">
                <div class="fm-item">
                    <label for="studyid" class="form-label">学生管理：</label>
                    <input type="text"  name = "studyid" placeholder="输入账号" maxlength="100" id="studyid" class="i-text"  value="" ajaxurl="<%=basePath%>images/valid.jsp">
                    <div class="ui-form-explain" id="tsy"> </div>
                </div>

                <div class="fm-item">
                    <label for="password" class="form-label">登陆密码：</label>
                    <input type="password" placeholder="输入密码"   name = "password" maxlength="100" id="password" class="i-text"  >
                    <div class="ui-form-explain" id="tsy1"></div>
                </div>

                <div class="fm-item pos-r">
                    <label for="yzm" class="form-label">验证码</label>
                    <input type="text" value="" maxlength="100" id="yzm" name="yzm" class="i-text yzm" placeholder="请输入验证码！" >
                    <div class="ui-form-explain"><img src="${pageContext.request.contextPath}/login/getImage" onclick="shx()" id ="validateCodeImg" class="yzm-img" /></div>

                </div>

                <div class="fm-item">
                    <label for="send-btn" class="form-label"></label>
                    <input type="button"   id="send-btn"  onclick="getLogin()" class="btn-login">
                    <div class="ui-form-explain"></div>
                </div>

            </form>

        </div>

    </div>

    <div class="bd">
            <li style="background:url(<%=basePath%>images/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;"><a target="_blank" href="#"></a></li>
            <li style="background:url(<%=basePath%>images/theme-pic2.jpg) #BCE0FF center 0 no-repeat;"><a target="_blank" href="#"></a></li>
        </ul>
    </div>

    <div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>


<div class="banner-shadow"></div>

<div class="footer">
    <p>Copyright &copy; 2014.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="周凯旋">周凯旋</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank"></a></p>
</div>

</body>
</html>
