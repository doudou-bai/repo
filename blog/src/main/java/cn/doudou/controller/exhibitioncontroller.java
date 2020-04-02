package cn.doudou.controller;

import cn.doudou.domain.BlogTable;
import cn.doudou.service.BlogTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class exhibitioncontroller {
    @Autowired
    private BlogTableService service;

    @RequestMapping("/exhibition")
    public String exhibition(String buuid, HttpServletRequest request)
    {
        BlogTable byBlog = service.findByBlog(buuid);
        request.getSession().setAttribute("blog",byBlog);
        return  "exhibition";
    }
}
