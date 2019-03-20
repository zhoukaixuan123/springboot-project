/*
package com.recruit.springbootrecruit.projiect.util.filter;

import com.recruit.springbootrecruit.projiect.util.LoggerUtil;
import com.recruit.springbootrecruit.projiect.util.SessionUtil;
import org.springframework.boot.web.servlet.FilterRegistrationBean;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Logger;

*
 * @Auther: kaixuan
 * @Date: 2019/3/18 13:20
 * @Description:
 *
 *    过滤器配置



//filertName   过滤器的名字      urlPatterns   需要过滤的URl
@WebFilter(filterName = "test", urlPatterns = "/*")
public class MyFilter  implements Filter  {


    private FilterRegistrationBean registration ;

    public MyFilter(){
        this.registration =new FilterRegistrationBean();
    }


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("----------------------->过滤器被创建");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;

        String requestURI = req.getRequestURI();
        System.out.println("--------------------->过滤器：请求地址"+requestURI);
       //
//        registration.setUrlPatterns(Arrays.asList("/*.do"));
        if(requestURI.indexOf(".do")!=-1){
            //req.getRequestDispatcher("/WEB-INF/views/login.jsp").(servletRequest, servletResponse);
            ((HttpServletResponse)servletResponse).sendRedirect("/login/getLogin");
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

        System.out.println("----------------------->过滤器被销毁");
    }


}
*/
