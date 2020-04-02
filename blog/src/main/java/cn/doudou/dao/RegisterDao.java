package cn.doudou.dao;

import cn.doudou.domain.Register;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface RegisterDao {
  /*  @Select("select * from register where id = #{id}")*/
    Register findByName(String username);
  Register findByEmail(String email);
    Register login(Register register);
    void insertuser(Register register);
}
