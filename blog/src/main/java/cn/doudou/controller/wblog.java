package cn.doudou.controller;

import cn.doudou.domain.Register;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class wblog implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的RUi:去除http:localhost:8080这部分剩下的
        String uri = request.getRequestURI();
        //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
        if (uri.indexOf("/l/login") >= 0) {
            return true;
        }
        //获取session
        HttpSession session = request.getSession();
        Register user = (Register) session.getAttribute("login-user");
        //判断session中是否有用户数据，如果有，则返回true，继续向下执行
        if (user != null) {
            return true;
        }
        //不符合条件的给出提示信息，并转发到登录页面
        request.setAttribute("login-msg", "您还没有登录，请先登录！");
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        return false;
    }
}
