package com.bank.config;

import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author wangql
 * 过滤器
 */
public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        // 如果调用了这个方法,过滤器就会继承往下执行,
        HttpSession session = httpServletRequest.getSession();
        String requestURI = httpServletRequest.getRequestURI();

        if (session.getAttribute("user") == null) {
            //没有登陆
            httpServletResponse.sendRedirect("/login");
        } else {
            System.out.println("ip:" + httpServletRequest.getRemoteHost() + ",url:" + httpServletRequest.getRequestURL());
            filterChain.doFilter(servletRequest, servletResponse);
        }

    }

    @Override
    public void destroy() {

    }
}