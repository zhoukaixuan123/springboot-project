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
                        jBox.alert("退出失败！", "提示", new {buttons: {"确定": true}});
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

    <script src="../Script/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function searchData(ctype, type) {
            if (type == "t") {
                var c = $("#cValue").val();
                window.location = 'StudentMaterial.aspx?ctype=' + ctype + "&cid=" + c;
            } else if (type == "c") {
                var t = $("#tValue").val();
                window.location = 'StudentMaterial.aspx?cid=' + ctype + "&ctype=" + t;
            }
        }

        //查询的填充
        $().ready(function () {
            var ctype = Request.QueryString("ctype");
            var cid = Request.QueryString("cid");
            if (ctype != null && ctype != "") {
                $("#tValue").val(ctype);
                $("#" + ctype).addClass("hover");
            } else {
                $("#tAll").addClass("hover");
            }
            if (cid != null && cid != "") {
                $("#cValue").val(cid);
                $("#" + cid).addClass("hover");
            } else {
                $("#cAll").addClass("hover");
            }
        });
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

            <h2 class="mbx">
                学习中心 &gt; <a href="#">资料中心</a></h2>
            <div class="feilei">
                <a href="#"><strong>资料中心</strong></a></div>
            <input type="hidden" id="cValue" value=""/>
            <input type="hidden" id="tValue" value=""/>
            <div class="fllist">
                <ul>
                    <li><strong>科目：</strong><a href="#" id="cAll" onclick='searchData("","c")'>全部</a>

                        <a href="#" id="8c7743e8-0818-41fa-bc86-44407ca2f773"
                           onclick="searchData('8c7743e8-0818-41fa-bc86-44407ca2f773','c')">
                            英语（二）</a>

                        <a href="#" id="e3d9b090-9465-44a1-887c-90d74f7f7899"
                           onclick="searchData('e3d9b090-9465-44a1-887c-90d74f7f7899','c')">
                            中国近现代史纲要</a>

                        <a href="#" id="f3b98347-fe96-49fc-b076-93bd5855341f"
                           onclick="searchData('f3b98347-fe96-49fc-b076-93bd5855341f','c')">
                            马克思主义基本原理概论</a>

                        <a href="#" id="30cfc816-fbc4-4b62-b688-9be0d7b29401"
                           onclick="searchData('30cfc816-fbc4-4b62-b688-9be0d7b29401','c')">
                            房地产法</a>

                        <a href="#" id="8757ba5a-64eb-4a4d-83f6-aa3740cf1a6f"
                           onclick="searchData('8757ba5a-64eb-4a4d-83f6-aa3740cf1a6f','c')">
                            行政法学</a>

                        <a href="#" id="989d8840-4db1-4081-8c2c-6374d26e5940"
                           onclick="searchData('989d8840-4db1-4081-8c2c-6374d26e5940','c')">
                            劳动法</a>

                        <a href="#" id="e8d53554-c58d-4362-a02d-3fb0aab793c1"
                           onclick="searchData('e8d53554-c58d-4362-a02d-3fb0aab793c1','c')">
                            企业与公司法学</a>

                        <a href="#" id="69154904-33f8-4d29-8e03-61519ac50197"
                           onclick="searchData('69154904-33f8-4d29-8e03-61519ac50197','c')">
                            税法原理</a>

                        <a href="#" id="c003fd05-4c88-45cf-9197-95b3015ee51b"
                           onclick="searchData('c003fd05-4c88-45cf-9197-95b3015ee51b','c')">
                            金融法概论</a>

                        <a href="#" id="93d8e17a-4482-4129-b980-b66e9c465015"
                           onclick="searchData('93d8e17a-4482-4129-b980-b66e9c465015','c')">
                            行政诉讼法</a>

                        <a href="#" id="09bd4563-2f40-4894-a83d-c33607f3c6ba"
                           onclick="searchData('09bd4563-2f40-4894-a83d-c33607f3c6ba','c')">
                            经济法学原理</a>

                        <a href="#" id="3fdc1c15-a181-4caf-a119-e7c5ee636269"
                           onclick="searchData('3fdc1c15-a181-4caf-a119-e7c5ee636269','c')">
                            环境法学</a>

                        <a href="#" id="0024e13d-a2b5-46a1-bfda-aefe803aca21"
                           onclick="searchData('0024e13d-a2b5-46a1-bfda-aefe803aca21','c')">
                            经济法毕业论文</a>

                    </li>
                    <li><strong>类型：</strong><a href="#" id="tAll" onclick="searchData('','t')">全部</a>

                        <a href="#" id="1" onclick="searchData('1','t')">
                            复习资料</a>

                        <a href="#" id="2" onclick="searchData('2','t')">
                            练习题</a>

                        <a href="#" id="3" onclick="searchData('3','t')">
                            内部资料</a>

                        <a href="#" id="4" onclick="searchData('4','t')">
                            真题</a>

                    </li>
                </ul>
                <div class="cztable">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
                        <tr>
                            <th width="6%">格式</th>
                            <th style="padding-left: 20px;">
                                资料名称
                            </th>
                            <th style="width: 15%; text-align: center;">
                                资料类型
                            </th>
                            <th style="width: 15%; text-align: center;">
                                更新时间
                            </th>
                            <th style="width: 15%; text-align: center;">
                                操作
                            </th>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                英语二
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2014-04-11
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/19b4ca24-e7a2-48f0-9ee6-7808631b5c23.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/default.jpg'/></td>
                            <td class="xxleft">

                                环境法学
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-30
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/fe3218c5-855f-4d7f-a073-5f2c713bea26.xls"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/default.jpg'/></td>
                            <td class="xxleft">

                                行政诉讼法
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-30
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/47fd23d7-b9be-4d32-8e90-8ee291758ba3.xls"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/default.jpg'/></td>
                            <td class="xxleft">

                                行政诉讼法
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-30
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/cdb01c24-8893-4722-b3a7-7ba094db9c18.xls"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                税法原理
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-30
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/c8da4780-4813-4f4e-bc2e-3fa9c7ad8b98.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                税法原理
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-30
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/446a67aa-53b5-4b17-87dc-d458b769b382.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                企业与公司法
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-30
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/9638b66a-1591-46b7-9115-874d2c072a00.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                行政诉讼法
                            </td>
                            <td>
                                练习题
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/5d7dc4d4-02c0-4702-86b7-4ccb1d39735b.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                环境法学
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/a6c6912d-eb68-4e3b-8fd1-02d773b46f0c.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                房地产法
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/78914634-6280-4962-b878-62d9101db368.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                房地产法
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/d08d2755-4429-4034-a083-89c62c0f665f.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                房地产法
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/d6292a5c-2d0d-4065-ae6e-0d0fa541568d.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                中国近现代史纲要
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/8ac28be9-5178-4c13-b39d-d5a242577fe0.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                中国近现代史纲要
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/a97d11e6-ac3d-44fe-aefe-263a5b7b957d.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                中国近现代史纲要
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/6b246260-a817-4f56-91cf-61936d5a3f0c.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                英语2
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/88db3182-6abd-4ead-8ce7-732b2d5ce2c1.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                英语2
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/5e093a1c-68ea-446b-8e0e-0eb6f8e6978b.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                英语2
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/f854d888-3225-4d1b-b6db-602aa7166971.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                英语2
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/85a262b0-ee1d-4d24-a427-1924516db646.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                        <tr>
                            <td><img src='../Images/FileIco/doc.gif'/></td>
                            <td class="xxleft">

                                英语2
                            </td>
                            <td>
                                复习资料
                            </td>
                            <td>
                                2013-09-29
                            </td>
                            <td>
                                <a href="http://admin.zk0731.com/StudentData/201309/e026512a-6c44-4dad-a2f7-b517079ce2b8.doc"
                                   target="_blank">
                                    <img src="../Images/down.gif" alt="点击下载"/></a>
                            </td>
                        </tr>

                    </table>
                    <div class='MainStyle'>
                        <div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=1'
                                         target='_self'>首页</a></div>
                        <div class=''><a href='javascript:void(0)' target='_self'>上一页</a></div>
                        <div class='NowItemStyle'><a href='javascript:void(0)' target='_self'>1</a></div>
                        <div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2'
                                         target='_self'>2</a></div>
                        <div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3'
                                         target='_self'>3</a></div>
                        <div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2'
                                         target='_self'>下一页</a></div>
                        <div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3'
                                         target='_self'>尾页</a></div>
                        <div class=''>总共<b>44</b>条数据</div>
                        <div class=''>每页<b>20</b>条数据</div>
                        <div class=''><b>1</b>/3</div>
                        <div class='SearchStyle'><input type='text' id='john_Page_Search'
                                                        onkeydown="if(event.keyCode == 13){page_searchIndex();}"/></div>
                        <div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div>
                    </div>
                    <script>    function page_searchIndex() {
                        var searchText = document.getElementById('john_Page_Search');
                        var searchIndex = searchText != null && searchText.value != '' ? parseInt(searchText.value) : 0;
                        if (searchIndex > 0 && searchIndex <= 3) {
                            window.location = 'StudentMaterial.aspx?page=' + searchIndex;
                        } else {
                            alert('需要跳转的页码不能超出范围！');
                        }
                    }</script>
                </div>
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
