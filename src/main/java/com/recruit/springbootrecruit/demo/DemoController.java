package com.recruit.springbootrecruit.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/1 22:43
 * @Description:
 */
@Controller
public class DemoController {

    @Autowired
    private DemoService demoService;




    /**
     *
     * 功能描述:
     *
     * @param:
     * @return:
     * @auther: kaixuan
     * @date: 2019/3/6 12:00
     */
    @RequestMapping("getUserDemo")
    public String getUser(HttpServletRequest request){
             //List<User> map = demoService.getUser();
              return "login";
    }
}
