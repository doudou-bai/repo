package cn.doudou.controller;

import cn.doudou.domain.BlogTable;
import cn.doudou.domain.Register;
import cn.doudou.service.BlogTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/w")
public class rootblog {
    @Autowired
    private BlogTableService service;

    @ResponseBody
    @RequestMapping(value = "/insertb", produces = "text/html;charset=UTF-8")
    public String insertblog(BlogTable blogTable, HttpServletRequest request) {
        Register user =(Register) request.getSession().getAttribute("login-user");
        String uuid = UUID.randomUUID().toString();
        String replace = uuid.replace("-", "");
        Date date = new Date();
        String str = "yyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(str);
        String format = sdf.format(date);
        blogTable.setrName(user.getUsername());
        blogTable.setbUid(replace);
        blogTable.setbTime(format);
        service.insertblog(blogTable);
        return "文章发布成功!";
    }
}
