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



     /***
     * @Description:  返回主页  User  信息
     * @Param: []
     * @return: java.lang.String
     * @Author: zhoukx
     * @Date: 2019/3/25
     */
    @RequestMapping("/getStudyMessage")
    public String getStudyMessage(){
        return JSONStirng.getBeanToJson(SessionUtil.getSession().getAttribute("user"));
    }
}
