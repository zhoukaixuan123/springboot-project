
package com.recruit.springbootrecruit.projiect.util.filter;

import com.recruit.springbootrecruit.projiect.login.User;
import com.recruit.springbootrecruit.projiect.util.SessionUtil;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @Auther: kaixuan
 * @Date: 2019/3/18 13:02
 * @Description: 拦截器
 */
@Component
public class MyInterceptor implements HandlerInterceptor {


    //  private  final Logger  logger =LoggerFactory.getLogger(MyInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        User users = null;
        try {
            users = (User) SessionUtil.getSession().getAttribute("user");
        }catch (Exception e){

        }
        // logger.info("拦截器输出！！");
        String url = request.getRequestURI();
        System.out.println("--------请求路径---------" + url);
        if (users == null) {
            //重定向 要用绝对路径  相对路径会无限重定向
            response.sendRedirect("/login/getLogin");
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }


}

