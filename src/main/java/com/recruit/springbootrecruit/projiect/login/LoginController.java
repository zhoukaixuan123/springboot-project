package com.recruit.springbootrecruit.projiect.login;

import com.recruit.springbootrecruit.projiect.login.LoginService;
import com.recruit.springbootrecruit.projiect.util.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

import static com.recruit.springbootrecruit.projiect.util.SessionUtil.getSession;

/**
 * @Auther: kaixuan
 * @Date: 2019/3/17 11:29
 * @Description:
 *      登录模块
 *
 *
 */
@Controller
@RequestMapping("/login")
public class LoginController {


    @Autowired
    private LoginService loginService;


    /**
     *
     * 功能描述: 
     *
     * @param: 登录页面跳转
     * @return: 
     * @auther: kaixuan
     * @date: 2019/3/17 12:19
     */
    @RequestMapping("getLogin")
    public String getLogin(){
        return "login";
    }



    /**
     *
     * 功能描述: 
     *
     * @param:     验证用户信息
     * @return: 
     * @auther: kaixuan
     * @date: 2019/3/17 12:21
     */
    @RequestMapping(value = "verificationLogin" , method = RequestMethod.POST)
    @ResponseBody
    public  String   verificationLogin(@RequestParam Map maps){

        return loginService.verificationLogin(maps);
    }



    @RequestMapping("/getImage")
    @ResponseBody
    public String  getImage(HttpServletRequest request, HttpServletResponse response){
        try {
            ImgUtil.getImg(request,response);
        }catch (Exception e){
           return  "N";
        }

        return null;
    }


}
