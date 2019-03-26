<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	学生信息管理系统模板 - 源码之家
</title><link href="<%=basePath%>/style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="<%=basePath%>//script/jbox/skins/blue/jbox.css" rel="stylesheet" type="text/css" /><link href="<%=basePath%>//style/ks.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>/script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/Common.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/Data.js" type="text/javascript"></script>
    <script type="text/javascript">
         $(function(){

         })

         //个人消息加载
         //初始化是完成架子啊
        function  getMessage() {
/*
            $.ajax({
                url: '<%=basePath%>/index/getStudyMessage',
                dataType: "json",
                success: function (result) {

                },
            })*/

        }

    </script>
    
    <script src="<%=basePath%>/script/changeOption.js" type="text/javascript"></script>
    <script src="<%=basePath%>/script/rl.js" type="text/javascript"></script>
</head>
<body>



    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="Index.aspx.html">
                        <img src="<%=basePath%>/images/student/logo.gif" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topxx">
                    <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                        color: #fff;">
                        <option value="1"> 远程</option>
                        <option selected='selected'value="2">  自考</option>
                    </select>
                   ${user.study_id}学员： ${user.user_name}，欢迎您！ <a href="MyInfo/Index.aspx.html">我的信息</a> <a href="User/StudentInfor/systemMsge.aspx.html">
                        通知</a> <a href="User/Account/ChangePasswd.aspx.html">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="Index.aspx.html">我的信息</a></li>
                        <li><a href="EducationCenter/Score.aspx.html">教务中心</a></li>
                        <li><a href="../../MyAccount/wdcw.aspx.html">我的学费</a></li>
                        <li><a href="OnlineTeaching/StudentMaterial.aspx.html">资料中心</a></li>
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
                            <a href="MyInfo/ClassInfo.aspx.html">班级信息 </a>
                        </div>
                        <div>
                            <a href="User/StudentInfor/Letter.aspx.html">短信息</a></div>
                        <div>
                            <a href="User/StudentInfor/systemMsge.aspx.html">学院通知</a></div>
                        <div>
                            <a href="MyInfo/Objection.aspx.html">我的异议</a></div>
                    </div>
                    <div class="ta1">
                        <strong>教务中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="EducationCenter/Application.aspx.html">我的报考</a></div>
                        <div>
                            <a href="EducationCenter/Score.aspx.html">我的成绩</a></div>
                        <div>
                            <a href="EducationCenter/Book.aspx.html">我的书籍</a></div>
                    </div>
                    <div class="ta1">
                        <strong>学习中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="OnlineTeaching/StudentMaterial.aspx.html">资料下载</a></div>
                        <div>
                            <a href="OnlineTeaching/StudentStudyRecordList.aspx.html">学习历程</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>财务中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../../MyAccount/wdcw.aspx.html">我的财务</a></div>
                    </div>
<div class="ta1">
                        <a href="http://www.csgb.net/login.aspx?userLoginName=2014&userName=邹智&professionId=F40C998A-D9AC-421F-99C9-C024C1DC53AD&flag=sm" target="_blank"><strong>教学系统</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
    <h2 class="mbx">
        我的学习中心&nbsp;&nbsp;&nbsp;&nbsp;</h2>

    <div class="dhbg">
        <div class="dh1" style="margin: 0 27px 15px 0;">
            <div class="dhwz">
                <p>
                    您共有 <span class="red">0</span>条通知信息 <span class="red">0 </span>条未读
                </p>
                <p>
                    共有 <span class="red">0 </span>条短信息、 <span class="red">0</span>个投诉、 <span class="red">
                        0 </span>个异议
                </p>
                <p>
                    有 <span class="red">0</span>个投诉、<span class="red">0
                    </span>个异议、<span class="red">0</span>条短信息未处理</p>
                <div class="btright">
                    <a href="User/studentinfor/Letter.aspx.html">
                        <img src="<%=basePath%>/images/student/default/bt_bzr.jpg" alt="给班主任发消息" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh2">
            <div class="dhwz">
                <p>
                    你有 <span class="red">0</span> 门课程要考 <a href="EducationCenter/Application.aspx.html" class="red">查看报考计划</a></p>
                <p>
                    你已经通过 <span class="red">0 </span>门课程&nbsp;共有 <span class="red">13</span> 门 <a href="EducationCenter/Score.aspx.html" class="red">查看成绩</a>
                </p>
                <p>
                    已经发放了 <span class="red">0 </span>本书籍 <a href="EducationCenter/Book.aspx.html" class="red">查看书籍情况</a></p>
                <div class="btright">
                    <a href="EducationCenter/Application.aspx.html">
                        <img src="<%=basePath%>images/student/default/bt_jw.jpg" alt="进入教务中心" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="dhwz">
                <p>
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExam.aspx?ptid=1">模拟考试</a></p>
                <p>
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExercise.aspx?ptid=3">章节练习</a>
                </p>
                <p>
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExercise.aspx?ptid=2">网上作业</a></p>
                <div class="btright">
                    <a href="http://sm.zk0731.com/User/ExamCenter/ExamPractice/ListExam.aspx?ptid=1">
                        <img src="<%=basePath%>images/student/default/bt_ks.jpg" alt="进入考试中心" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh4">
            <div class="dhwz">
                <p>
                    你应交<span class="blue">7800.00</span> 元，实缴 <span class="green">3700.00</span>元</p>
                    <p>
                    欠费 <span class="red">4100.00</span> 元</p>
                <p>
                    你总共有<span class="red">3</span> 条财务记录需要确定</p>
                
                <div class="btright">
                    <a href="../../MyAccount/wdcw.aspx.html">
                        <img src="<%=basePath%>images/student/default/bt_cw.jpg" alt="进入财务中心" width="121" height="25" /></a></div>
            </div>
        </div>
    </div>

    <div class="xxlc">
        <strong class="lcbt">学历历程</strong>
    </div>
    <div class="lcbiao">
        <div class="lctime">
            2014-05-01</div>
        <div class="lctime">
            2014-05-02</div>
        <div class="lctime">
             2014-05-03</div>
        <div class="lctime2">
            2014-05-04</div>
        <div class="lctime">
             2014-05-05</div>
        <div class="lctime">
             2014-05-06</div>
        <div class="lctime">
             2014-05-07</div>
    </div>
    <div class="xxjl">
    
        <div align="center">
        <span>
            18:10 登陆系统
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            18:09 登陆系统
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            18:06 登陆系统
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            11:19 登陆系统
            
              <a></a>
             
              </span>
            </div>
           
           
    </div>

            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2012 广博教育 csgb.net 版权所有 </p>
        </div>
    </div>
	<div style="text-align:center;">
</div>
</body>
</html>
