
package com.recruit.springbootrecruit.projiect.util.filter;

import com.recruit.springbootrecruit.projiect.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @Auther: kaixuan
 * @Date: 2019/3/18 13:02
 * @Description:
 *
 *
 *    拦截器
 *
 */
@Component
public class MyInterceptor  implements HandlerInterceptor {



    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String users = (String) SessionUtil.getSession().getAttribute("USERNAME");
        System.out.println("拦截器");
        String url = request.getRequestURI();
        System.out.println("--------请求路径---------"+url);
             if(users == null){
                 response.sendRedirect("getLogin");
                 return false;
            }else{
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

