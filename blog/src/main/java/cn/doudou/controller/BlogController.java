package cn.doudou.controller;

import cn.doudou.domain.BlogTable;
import cn.doudou.domain.Register;
import cn.doudou.domain.limit;
import cn.doudou.service.BlogTableService;
import cn.doudou.service.RegisterService;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/b")
public class BlogController {
    @Autowired
    private RegisterService service;
    @Autowired
    private BlogTableService blogTableService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/wblog")
    public String wblog() {
        return "wblog";
    }

    @ResponseBody
    @RequestMapping(value = "/code", produces = "text/html;charset=UTF-8")
    public String code(HttpServletRequest request, String code) {
        String checkcode_server = (String) request.getSession().getAttribute("CHECKCODE_SERVER");
        if (code.equalsIgnoreCase(checkcode_server)) {
            return "验证码输入正确";
        }
        return "验证码输入错误,请检查!";
    }

    @ResponseBody
    @RequestMapping(value = "/email", produces = "text/html;charset=UTF-8")
    public String email(HttpServletRequest request, String useremail) {
        Register byEmail = service.findByEmail(useremail);
        if (byEmail != null) {
            return "邮箱已被占用";
        }
        return "邮箱可用";
    }

    @ResponseBody
    @RequestMapping(value = "/blogtxt", produces = "application/json;charset=UTF-8")
    public String blogtxt() {
        limit l =new limit();
        l.setIndex(0);
        l.setPage(6);
        List<BlogTable> zsblog = blogTableService.zsblog(l);
        String blogtxt = JSON.toJSONString(zsblog);
        return blogtxt;
    }
}
