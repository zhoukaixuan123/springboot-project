package com.recruit.springbootrecruit.projiect.index;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/17 21:52
 * @Description:
 *
 *    主页  免
 */
@RequestMapping("/index")
public class IndexController {


    @RequestMapping("/getIndex")
    public String getIndex(){
        return  "index";
    }
}
