package cn.doudou.controller;

import cn.doudou.domain.Register;
import cn.doudou.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.UUID;

@Controller
@RequestMapping("/r")
public class UserRegister {
    @Autowired
    private RegisterService service;

    @RequestMapping("/register")
    public String zhuce(Register register) {
        String uuid = UUID.randomUUID().toString();
        String replace = uuid.replace("-", "");
        System.out.println(register.getUuid());
        service.insertuser(register);
        return "login";
    }

}
