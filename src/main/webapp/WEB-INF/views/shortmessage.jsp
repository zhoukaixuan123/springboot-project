<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
    学生信息管理平台
</title>
    <link href="<%=basePath%>/style/StudentStyle.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>//script/jbox/skins/blue/jbox.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>//style/ks.css" rel="stylesheet" type="text/css"/>
    <script src="<%=basePath%>/script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/Common.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/Data.js" type="text/javascript"></script>
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
                StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("退出失败！", "提示", new { buttons: { "确定": true} });
                    }
                });
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

    <script type="text/javascript">
        function returnIndex() {
            window.location = "/Index.aspx";
        }
        function showMsg(msg, obj) {
            jBox.tip(msg);
            $("#" + obj).focus();
        }
        function saveClick(studentId) {
            var Ctitle = $("#Ctitle").val();   //消息标题
            if (Ctitle == "" || Ctitle.length>20) {
                showMsg("请您输入消息标题,且不超过20个字！", "Ctitle");
                return false;
            }
            var Ctype = $("#Ctype").val();  //消息类型
            if (Ctype == ("Unselected")) {
                showMsg("请您选择投诉类型！", "Ctype");
                return false;
            }
            var Ccontent = $("#Ccontent").val(); //消息内容
            if (Ccontent == "" || Ccontent.length>80) {
                showMsg("请您输入消息内容，且不超过80个字！", "Ccontent");
                return false;
            }
            StudentCompain.insertCompain(studentId, Ctitle, Ctype, Ccontent, function (data) {
                var obj = $.parseJSON(data);
                if (obj.ok == true) {
                    jBox.alert(obj.message, "提示");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500);
                }
                else {
                    jBox.tip(obj.message);
                }
            });
        }
    </script>
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
                        远程</option>

                    <option selected='selected'
                            value="1">
                        自考</option>

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
                    <strong>学习中心</strong><div class="leftbgbt2">
                </div>
                </div>
                <div class="cdlist">
                    <div>
                        <a href="<%=basePath%>/index/getStudentMaterial">资料下载</a></div>
                    <div>
                        <a href="<%=basePath%>/index/getStudentStudyRecordList">学习历程</a></div>
                </div>
                <div class="ta1">
                    <strong>财务中心</strong><div class="leftbgbt2">
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

            <h2 class="mbx">我的信息 &gt; 短信息</h2>
            <div class="morebt">


                <ul id="ulStudMsgHeadTab">
                    <li><a class="tab2" onclick="" href="#">个人资料</a></li>
                    <li><a class="tab2" onclick="" href="<%=basePath%>/index/getClassAspk">班级信息</a></li>
                    <li><a class="tab2" onclick="" href="<%=basePath%>/index/getShortmessage">短信息</a></li>
                    <li><a class="tab2" onclick="" href="<%=basePath%>/index/getClassAspk">通知<span
                            style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
                    <li><a class="tab2" onclick="" href="<%=basePath%>/index/getObjectionAspx">我的异议</a></li>
                </ul>

            </div>
            <div class="cztable">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th style="text-align:center;" width="5%">序号</th>
                        <th style="text-align:center;" width="10%">类型</th>
                        <th width="15%">标题</th>
                        <th width="20%">内容</th>
                        <th style="text-align:center;" width="18%">添加时间</th>
                        <th style="text-align:center;" width="13%">状态</th>
                    </tr>

                    <tr style="height: 28px" class="tdbg" align="center">
                        <td colspan="13" align="left" style="color: Red; font-weight:bold;">暂无信息!</td>
                    </tr>

                </table>
            </div>

            <div class="cztable">
                <h2 class="mbx">我的信息 &gt; 给班主任发短信</h2>

                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="15%" align="right"><div align="right">信息主题： </div></td>
                        <td><input id="Ctitle" size="20" name="Ctitle" class="input_2"/></td>
                    </tr>
                    <tr>
                        <td width="15%" align="right"><div align="right">信息类型： </div></td>
                        <td>
                            <select id="Ctype" name="Ctype">
                                <option value="Unselected">请选择</option>
                                <option value="1">投诉</option>
                                <option value="3">意见</option>
                                <option value="4">提问</option>
                                <option value="5">邮件</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="15%" align="right"><div align="right">信息内容： </div></td>
                        <td><textarea name="Ccontent" cols="80" rows="5" id="Ccontent" class="input_2"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <div align="center" >
                                <input type="submit" value="提交" onclick="saveClick('7c50f70a-775b-4aef-8bf2-5010ec612c0d')" class="input2" />
                                <input type="submit" value="返回" onclick="returnIndex()" class="input2" />
                            </div>
                        </td>
                    </tr>
                </table>
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
