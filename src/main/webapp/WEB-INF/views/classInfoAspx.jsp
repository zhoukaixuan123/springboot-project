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

    <script type="text/javascript">
        //学生投诉异议
        function onSaveProblem() {
            var studentId = $("#studentId").val();
            var workAssess = $('input[name="workAssess"]:checked').val();
            var problemContent = $("#problemContent").val();
            var problemType = $('input[name="problemType"]:checked').val();
            var problemTypeStr = "学生";
            switch (problemType) {
                case "4":
                    problemTypeStr += "提问";
                    break;
                case "3":
                    problemTypeStr += "意见";
                    break;
                case "1":
                    problemTypeStr += "投诉";
                    break;
                default:
                    break;
            }

            if (problemContent.length <= 0) {
                jBox.tip("请填写问题反馈的内容！");
                return false;
            }
            else {
                problemContent = "工作评价：" + workAssess + "，" + problemContent;
                StudentCompain.insertCompain(studentId, problemTypeStr, problemType, problemContent, function (data) {
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
                    <strong>教学系统</strong></a>
                </div>
            </div>
        </div>
        <div class="rightbox">


            <h2 class="mbx">我的信息 &gt; 班级信息&nbsp;&nbsp;&nbsp;自考</h2>
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
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td width="91" align="right">班级名称：</td>
                        <td colspan="5">2013秋经济法学&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">班级QQ群：</td>
                        <td colspan="5">57197804 &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">班级宣传语：</td>
                        <td colspan="5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">学校名称：</td>
                        <td colspan="5">湖南大学&nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right">
                            <div align="right">班主任老师：</div>&nbsp;
                        </td>
                        <td>
                            <div align="left">王娟</div>
                        </td>
                        <td>
                            <div align="right">电话：</div>&nbsp;
                        </td>
                        <td>
                            <div align="left">15388088011</div>&nbsp;
                        </td>
                        <td align="right">
                            <div align="right">在线交流：</div>&nbsp;
                        </td>
                        <td align="right">
                            <div align="left"><a target="_blank"
                                                 href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img
                                    border="0" src="http://wpa.qq.com/pa?p=2::41" alt="点击这里给我发消息"/></a></div>&nbsp;
                        </td>
                    </tr>

                    <tr>
                        <td align="right">工作评价：</td>
                        <td colspan="5">
                            <input value="满意" checked="checked" type="radio" name="workAssess"/>满意
                            <input value="一般" type="radio" name="workAssess"/>一般
                            <input value="差" type="radio" name="workAssess"/>差
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" align="right">问题反馈：</td>
                        <td colspan="5">
                            <input value="4" checked="checked" type="radio" name="problemType"/>提问

                            <input value="1" type="radio" name="problemType"/>投诉
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <textarea name="problemContent" id="problemContent" cols="80" rows="6"
                                      class="input_2"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" align="left" valign="middle">
                            <input type="button" name="button2" id="button2" value="点击提交" class="input2"
                                   onclick="onSaveProblem()"/>
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
