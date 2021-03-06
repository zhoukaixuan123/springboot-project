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
    <script src="<%=basePath%>/script/jbox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jbox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jbox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
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

    <script src="<%=basePath%>/script/jquery-1.4.1.js" type="text/javascript"></script>
    <link href="<%=basePath%>/style/history.css" rel="stylesheet" type="text/css"/>
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
                教学中心 &gt; 我的学习历程</h2>
            <div class="history">
                <div class="history-date">
                    <ul id="hData">
                    </ul>
                </div>
            </div>
            <div class="time_bm">
                2013.08.16我报考了经济法学，重新打开学习之门！
            </div>
            <input type="hidden" id="stuId" value="7c50f70a-775b-4aef-8bf2-5010ec612c0d"/>
            <script type="text/javascript">
                var pageIndex = 1; //当前加载页数
                var hasData = true; //是否还有数据可以加载
                var yearData = ""; //年份
                var monthData = ""; //月.日
                var $dt = null; //追加数据的jq对象
                function loadData() {
                    if (hasData) {
                        var stuId = $("#stuId").val();
                        if (stuId.length > 1) {
                            $.ajax({
                                url: "StudyGetData.ashx",
                                type: "post",
                                data: "stuId=" + stuId + "&pageIndex=" + pageIndex,
                                success: function (data) {
                                    pageIndex++;
                                    var s1 = data.split('$1$')[0];
                                    if (s1 == "0") {
                                        hasData = false;
                                    }
                                    var s2 = data.split('$1$')[1];
                                    showData(s2);
                                }
                            });
                        }
                    }
                }

                function showData(str) {
                    var s3 = str.split('$3$');
                    for (i = 0; i < s3.length; i++) {
                        var s4 = s3[i].split('$2$');
                        if (s4[0] != yearData) {
                            var t = "<li><h2 class='first'><a href='#nogo'>" + s4[0] + "年</a></h2></li>";
                            $("#hData").append(t);
                            yearData = s4[0];
                        }
                        if (s4[1] != monthData) {
                            var $li = $("<li class='green'><h3>" + s4[1] + "<span>" + yearData + "</span></h3></li>");
                            var $div = $("<div class='lc_right'></div>");
                            var $dl = $("<dl></dl>");
                            var $tdiv = $("<div class='time_ico'></div>");
                            $dt = $("<dt></dt>");
                            $dt.appendTo($dl);
                            $tdiv.appendTo($dl);
                            $dl.appendTo($div);
                            $div.appendTo($li);
                            $li.appendTo($("#hData"));
                            monthData = s4[1];
                        }
                        if ($dt) {
                            var pathA = s4[6];
                            var $span;
                            if (pathA.length < 1) {
                                $span = $("<span>" + s4[2] + " " + s4[3] + "<a>" + s4[4] + "</a>  " + s4[5] + "</span>");
                            } else {
                                $span = $("<span>" + s4[2] + " " + s4[3] + "<a href='" + pathA + "' target='_blank'>" + s4[4] + "</a>  " + s4[5] + "</span>");
                            }
                            $dt.append($span);
                        }
                    }
                }

                function reachBottom() {
                    var scrollTop = 0;
                    var clientHeight = 0;
                    var scrollHeight = 0;
                    if (document.documentElement && document.documentElement.scrollTop) {
                        scrollTop = document.documentElement.scrollTop;
                    } else if (document.body) {
                        scrollTop = document.body.scrollTop;
                    }
                    if (document.body.clientHeight && document.documentElement.clientHeight) {
                        clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
                    } else {
                        clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
                    }
                    scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
                    alert(scrollTop);
                    if (scrollTop + clientHeight == scrollHeight) {
                        return true;
                    } else {
                        return false;
                    }
                }

                $(function () {
                    $(window).scroll(function () {
                        var sTop = $(this).scrollTop();
                        var sHeight = $(this).height();
                        var scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
                        if (sTop + sHeight == scrollHeight) {
                            loadData();
                        }
                    });
                    loadData();
                });

            </script>

        </div>
    </div>
    <div class="footer">
        <p>
            &copy;copyright 2012 广博教育 csgb.net 版权所有 站长统计</p>
    </div>
</div>
</body>
</html>
