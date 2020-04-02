package cn.doudou.service.Impl;

import cn.doudou.dao.BlogTableDao;
import cn.doudou.domain.BlogTable;
import cn.doudou.domain.limit;
import cn.doudou.service.BlogTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service("blogTableService")
public class BlogTableServiceImpl implements BlogTableService {
    @Autowired
    private BlogTableDao dao;

    public List<BlogTable> findAll() {
        return dao.findAll();
    }

    public void insertblog(BlogTable blogTable) {
        String uuid = UUID.randomUUID().toString();
        String replace = uuid.replace("-", "");
        BlogTable b = new BlogTable();
        b.setbUid(replace);
        b.setbTitle("博客title");
        b.setbIntroduce("介绍");
        b.setbTxt("我是正文");
        b.setbTime("00");
        dao.insertblog(blogTable);
    }

    public List<BlogTable> zsblog(limit limit) {
        return dao.zsblog(limit);
    }

    public BlogTable findByBlog(String bUid) {
        return dao.findByBlog(bUid);
    }


}
