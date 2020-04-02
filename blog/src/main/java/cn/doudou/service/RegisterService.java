package cn.doudou.service;

import cn.doudou.domain.Register;

public interface RegisterService {
    Register findByName(String username);
    Register login(Register register);
    void insertuser(Register register);
    Register findByEmail(String email);
}

