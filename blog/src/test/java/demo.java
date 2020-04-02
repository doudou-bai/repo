import cn.doudou.domain.Register;
import cn.doudou.service.RegisterService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicaltionConfig.xml")
public class demo {
    @Autowired
    private RegisterService service;

    @Test
    public void findByName() {
        Register lll = service.findByEmail("121");
        System.out.println(lll);
    }

    @Test
    public void login() {
        Register r = new Register();
        r.setUsername("lll");
        r.setUserpassword("lll");
        Register login = service.login(r);
        System.out.println(login);
    }

    @Test
    public void run() {
        String uuid = UUID.randomUUID().toString();
        String replace = uuid.replace("-", "");
        Register r = new Register();
        r.setUsername("124444");
        r.setUserpassword("45555");
        r.setUseremail("4574755585");
        r.setUuid(replace);
        service.insertuser(r);
    }
    @Test
    public void uuid()
    {
        String uuid = UUID.randomUUID().toString();
        String replace = uuid.replace("-", "");
        System.out.println(replace);
    }
}
