package cn.doudou.service;

import cn.doudou.domain.BlogTable;
import cn.doudou.domain.limit;

import java.util.List;

public interface BlogTableService {
    List<BlogTable> findAll();
    void insertblog(BlogTable blogTable);
    List<BlogTable> zsblog(limit limit);
    BlogTable findByBlog(String bUid);
}
