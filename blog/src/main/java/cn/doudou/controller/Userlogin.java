package cn.doudou.controller;

import cn.doudou.domain.Register;
import cn.doudou.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/l")
public class Userlogin {
    @Autowired
    private RegisterService service;

    @RequestMapping("/login")
    public void login(Register register, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Register login = service.login(register);
        if (login != null)
        {
            request.getSession().setAttribute("login-user",login);
            request.getSession().setAttribute("username",login.getUsername());
            request.getRequestDispatcher("/WEB-INF/pages/wblog.jsp").forward(request,response);
            return;
        }
        request.getSession().setAttribute("login-msg","用户名或密码错误");
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request,response);
    }
}
