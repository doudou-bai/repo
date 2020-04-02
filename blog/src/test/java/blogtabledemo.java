import cn.doudou.domain.BlogTable;
import cn.doudou.domain.limit;
import cn.doudou.service.BlogTableService;
import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicaltionConfig.xml")
public class blogtabledemo {

    @Autowired
    private BlogTableService blogTableService;

    @Test
    public void findAll() {
        List<BlogTable> all = blogTableService.findAll();
        for (BlogTable blogTable : all) {
            System.out.println(blogTable);
        }
    }
    @Test
    public void insert() {
        BlogTable b = new BlogTable();
        String uuid = UUID.randomUUID().toString();
        String replace = uuid.replace("-", "");
        b.setbUid(replace);
        b.setbTitle("标题");
        b.setbIntroduce("介绍");
        b.setbTxt("1111111");
        b.setrName("lll");
        blogTableService.insertblog(b);
    }

    @Test
    public void fy() {
        limit m = new limit();
        m.setIndex(0);
        m.setPage(3);
        List<BlogTable> zsblog = blogTableService.zsblog(m);
        String s = JSON.toJSONString(zsblog);
        System.out.println(s);
    }
    @Test
    public void Byblog()
    {
        BlogTable byBlog = blogTableService.findByBlog("301e64c10e334ccbb7afe994f9bb0007");
        System.out.println(byBlog);
    }
    @Test
    public void date()
    {
        Date date = new Date();
        String str = "yyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(str);
        sdf.format(date);
    }
}
