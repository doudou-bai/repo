package cn.doudou.service.Impl;

import cn.doudou.dao.RegisterDao;
import cn.doudou.domain.Register;
import cn.doudou.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("registerService")
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDao dao;


    public Register findByName(String username) {
        return dao.findByName(username);
    }

    public Register login(Register register) {
        return dao.login(register);
    }

    public void insertuser(Register register) {
        dao.insertuser(register);
    }

    public Register findByEmail(String email) {
        return dao.findByEmail(email);
    }
}
