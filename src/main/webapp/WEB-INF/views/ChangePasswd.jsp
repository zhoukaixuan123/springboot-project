<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
        学生信息管理平台
    </title>
    <link href="<%=basePath%>/style/StudentStyle.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>/script/jbox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>/style/ks.css" rel="stylesheet" type="text/css"/>
    <script src="<%=basePath%>/script/jbox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jbox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jbox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/Common.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/Data.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/changeOption.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/rl.js" type="text/javascript"></script>
    <script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        //我的信息头部选项卡
        function setStudMsgHeadTabCheck() {
            var currentUrl = window.location.href;
            currentUrl = currentUrl.toLowerCase();
            var asmhm = "";
            $("#ulStudMsgHeadTab li").each(function () {
                asmhm = $(this).find('a').attr("href").toLowerCase();
                if (currentUrl.indexOf(asmhm) > 0) {
                    $(this).find('a').attr("class", "tab1");
                    return;
                }
            });
        }

        //显示未读系统信息
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                window.location = "<%=basePath%>/login/getLogin";
            }
        }

        //更改报考类别
        function changeCateory(thisObj, id) {
            var oldCateoryId = $("#cateoryId").val();
            var cateoryId = "";
            if (id != null) {
                cateoryId = id;
            }
            else {
                cateoryId = thisObj.val();
            }
            var studentId = $("#studentId").val();
            if (cateoryId.length <= 0) {
                jBox.tip("报考类别不能为空！");
                if (id == null) {
                    thisObj.val(oldCateoryId);
                }
            }
            else {
                studentInfo.changeStudentCateory(cateoryId, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        window.location.href = "/Index.aspx";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>

    <script type="text/javascript" language="javascript">
        function changePassword() {
            var oldPwd = $("#txtOldPwd").val();
            var newPwd = $("#txtNewPwd").val();
            var confirmNewPwd = $("#txtConfirmNewPwd").val();

            if (oldPwd == "" || newPwd == "" || confirmNewPwd == "") {
                $.jBox.tip("旧密码或新密码或确认新密码不能为空！", 'error');
                return false;
            }
            if (oldPwd.length < 6 || oldPwd.length > 16) {
                $.jBox.tip("旧密码为6~16个字符，区分大小写！", 'error');
                return false;
            }
            if (newPwd.length < 6 || newPwd.length > 16) {
                $.jBox.tip("新密码为6~16个字符，区分大小写！", 'error');
                return false;
            }
            if (newPwd != confirmNewPwd) {
                $.jBox.tip("新密码两次输入不一致！", 'error');
                return false;
            }
            $.ajax({
                url: "<%=basePath%>/update/updatePassword",
                data:$("#from1").serialize(),
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                success: function () {

                    window.location.href ="<%=basePath%>/index/getIndex";
                },
                error: function (result) {
                    $.jBox.tip("修改密码失败！", 'error');
                }
            });
        }
    </script>
    <style type="text/css">
        .txtinput1 {
            width: 180px;
        }
    </style>
</head>
<body>

<div class="banner">
    <div class="bgh">
        <div class="page">
            <div id="logo">
            <a href="<%=basePath%>/index/getIndex">
                <img src="<%=basePath%>/images/student/logo.gif" alt="" width="165" height="48"/>
            </a>
        </div>
        <div class="topxx">
            <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                        color: #fff;">

                <option
                        value="4">
                    远程
                </option>

                <option selected='selected'
                        value="1">
                    自考
                </option>

            </select>

            ${user.study_id}学员： ${user.user_name}，欢迎您！
            <a href="<%=basePath%>/index/getIndex">我的信息</a>
            <a href="<%=basePath%>/index/getClassAspk">通知</a>
            <a href="<%=basePath%>/index/getChangePasswd">密码修改</a>
            <a onclick="loginOut()" href="javascript:">安全退出</a>
        </div>
        <div class="blog_nav">
            <ul>
                <li><a href="<%=basePath%>/index/getIndex">我的信息</a></li>
                <li><a href="<%=basePath%>/index/getScore">教务中心</a></li>
                <li><a href="<%=basePath%>/index/getWdcw">我的学费</a></li>
                <li><a href="<%=basePath%>/index/getStudentMaterial">资料中心</a></li>
            </ul>
        </div>
    </div>
</div>
</div>
<div class="page">
    <div class="box mtop">
        <div class="leftbox">
            <div class="l_nav2">
                <div class="ta1">
                    <strong>个人中心</strong>
                    <div class="leftbgbt">
                    </div>
                </div>
                <div class="cdlist">
                    <div>
                        <a href="<%=basePath%>/index/getStudyMessage">我的信息</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getClassAspk">班级信息 </a>
                    </div>
                    <div>
                        <a href="<%=basePath%>/index/getShortmessage">短信息</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getClassAspk">学院通知</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getObjectionAspx">我的异议</a></div>
                </div>
                <div class="ta1">
                    <strong>教务中心</strong>
                    <div class="leftbgbt2">
                    </div>
                </div>
                <div class="cdlist">
                    <div>
                        <a href="<%=basePath%>/index/getApplication">我的报考</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getScore">我的成绩</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getBook">我的书籍</a></div>
                </div>
                <div class="ta1">
                    <strong>学习中心</strong>
                    <div class="leftbgbt2">
                    </div>
                </div>
                <div class="cdlist">
                    <div>
                        <a href="<%=basePath%>/index/getStudentMaterial">资料下载</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getStudentStudyRecordList">学习历程</a></div>
                </div>

                <div class="ta1">
                    <strong>财务中心</strong>
                    <div class="leftbgbt2">
                    </div>
                </div>
                <div class="cdlist">
                    <div>
                        <a href="<%=basePath%>/index/getWdcw">我的财务</a></div>
                </div>
                <div class="ta1">
                    <strong>教学系统</strong>
                    <div class="leftbgbt2">
                    </div>
                </div>
            </div>
        </div>
        <div class="rightbox">

            <h2 class="mbx">我的信息 &gt; 密码修改</h2>
            <div class="cztable">
                <form id="from1"  method="post">
                <table border="0" cellspacing="0" cellpadding="0" width="500px" style="margin:30px auto 0px auto;">
                    <tr align="center">
                        <input type="hidden" name="study_id" value ="${user.study_id}">
                        <th style="width:20%; text-align:left;">旧密码：</th>
                        <td style="width:70%; text-align:left;"><input id="txtOldPwd" value="" type="password"
                                                                       class="input_2 txtinput1" name="oldPassword"/></td>
                    </tr>
                    <tr align="center">
                        <th style="width:20%; text-align:left;">新密码：</th>
                        <td style="width:70%; text-align:left;"><input id="txtNewPwd" value="" type="password"
                                                                       class="input_2 txtinput1" name="newPasswordOne"/>&nbsp;&nbsp;6~16个字符，区分大小写
                        </td>
                    </tr>
                    <tr align="center">
                        <th style="width:20%; text-align:left;">确认新密码：</th>
                        <td style="width:70%; text-align:left;"><input id="txtConfirmNewPwd" value="" type="password"
                                                                       class="input_2 txtinput1" name="newPassword"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;"><input type="submit" id="btnSubmit" value="确认修改"
                                                                          onclick="changePassword()" class="input2"/>
                        </td>
                    </tr>
                </table>
                </form>
            </div>

        </div>
    </div>
    <div class="footer">
        <p>
            &copy;copyright 2012 广博教育 csgb.net 版权所有 站长统计</p>
    </div>
</div>
</body>
</html>
