package com.recruit.springbootrecruit.projiect.index;

import com.recruit.springbootrecruit.projiect.editPassword.EditPasswordService;
import com.recruit.springbootrecruit.projiect.login.User;
import com.recruit.springbootrecruit.projiect.util.JSONStirng;
import com.recruit.springbootrecruit.projiect.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/17 21:52
 * @Description:
 *
 *    主页
 */
@RequestMapping("/index")
@Controller
public class IndexController {


    @Autowired
    private IndexService indexService;


    /*** 
    * @Description: 返回主页  带出信息 
    * @Param: [request] 
    * @return: java.lang.String 
    * @Author: zhoukx
    * @Date: 2019/3/25 
    */ 
    @RequestMapping("/getIndex")
    public String getIndex(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return  "index";
    }


    /**
     *
     * 功能描述:
     *           我的信息
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/26 17:42
     */
    @RequestMapping("/getStudyMessage")
    public String getStudyMessage(HttpServletRequest request){
       User user =  (User) SessionUtil.getSession().getAttribute("user");
       String  study_id = user.getStudy_id();
       User user1s =  indexService.selectUser(study_id);
       request.setAttribute("user",user1s);
        return "indexStudyMessage" ;
    }


    /**
     *
     * 功能描述:
     *           班级页面
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/26 17:56
     */
    @RequestMapping("/getClassAspk")
    public String  getClassAspk(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "classInfoAspx";
    }
    /**
     *
     * 功能描述:
     *          短信通知页面
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/26 18:00
     */
    @RequestMapping("getShortmessage")
    public String  getShortmessage(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return  "shortmessage";
    }

    
    /*** 
    * @Description:   我的异议页面
    * @Param: [] 
    * @return: java.lang.String 
    * @Author: zhoukx
    * @Date: 2019/3/26 
    */ 
    @RequestMapping("/getObjectionAspx")
    public String  getObjectionAspx(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "objectionAspx";
    }



    /*** 
    * @Description:  我的报考
    * @Param: [request] 
    * @return: java.lang.String 
    * @Author: zhoukx
    * @Date: 2019/3/26 
    */ 
    @RequestMapping("/getApplication")
    public String getAppliaction(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "Application";
    }

    /***
     * @Description:  我的成绩
     * @Param: [request]
     * @return: java.lang.String
     * @Author: zhoukx
     * @Date: 2019/3/26
     */
    @RequestMapping("/getScore")
    public String getScore(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "Score";
    }

    /***
     * @Description:  我的书籍
     * @Param: [request]
     * @return: java.lang.String
     * @Author: zhoukx
     * @Date: 2019/3/26
     */
    @RequestMapping("/getBook")
    public String getBook(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "Book";
    }


    /***
     * @Description:  资料下载
     *
     * @Param: [request]
     * @return: java.lang.String
     * @Author: zhoukx
     * @Date: 2019/3/26
     */
    @RequestMapping("/getStudentMaterial")
    public String getStudentMaterial(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "StudentMaterial";
    }

    /***
     * @Description:  学习历程
     * @Param: [request]
     * @return: java.lang.String
     * @Author: zhoukx
     * @Date: 2019/3/26
     */
    @RequestMapping("/getStudentStudyRecordList")
    public String getStudentStudyRecordList(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "StudentStudyRecordList";
    }



    /***
     * @Description:  我的财务
     * @Param: [request]
     * @return: java.lang.String
     * @Author: zhoukx
     * @Date: 2019/3/26
     */
    @RequestMapping("/getWdcw")
    public String getWdcw(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return "wdcw";
    }



    
    /*** 
    * @Description:   返回密码修改页面
    * @Param: [request] 
    * @return: java.lang.String 
    * @Author: zhoukx
    * @Date: 2019/3/27 
    */ 
    @RequestMapping("/getChangePasswd")
    public String getChangePasswd(HttpServletRequest request){
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
        return  "ChangePasswd";
    }

}
