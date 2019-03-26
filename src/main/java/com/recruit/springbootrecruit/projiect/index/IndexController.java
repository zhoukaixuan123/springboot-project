package com.recruit.springbootrecruit.projiect.index;

import com.recruit.springbootrecruit.projiect.util.JSONStirng;
import com.recruit.springbootrecruit.projiect.util.SessionUtil;
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
        request.setAttribute("user",SessionUtil.getSession().getAttribute("user"));
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

}
