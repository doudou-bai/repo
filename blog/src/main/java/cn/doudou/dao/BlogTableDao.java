package cn.doudou.dao;

import cn.doudou.domain.BlogTable;
import cn.doudou.domain.limit;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogTableDao {
    List<BlogTable> findAll();
    List<BlogTable> zsblog(limit limit);
    void insertblog(BlogTable blogTable);
    BlogTable findByBlog(String bUid);
}

