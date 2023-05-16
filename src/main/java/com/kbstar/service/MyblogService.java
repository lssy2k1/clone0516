package com.kbstar.service;

import com.kbstar.dto.Myblog;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.MyblogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyblogService implements KBService<Integer, Myblog> {
    @Autowired
    MyblogMapper mapper;

    @Override
    public void register(Myblog myblog) throws Exception {
        mapper.insert(myblog);
    }

    @Override
    public void remove(Integer k) throws Exception {
        mapper.delete(k);
    }

    @Override
    public void modify(Myblog myblog) throws Exception {
        mapper.update(myblog);
    }
    @Override
    public Myblog get(Integer k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Myblog> get() throws Exception {
        return null;
    }

    public List<Myblog> getMyBlog(String stu_id) throws Exception{
        return mapper.getMyBlog(stu_id);
    }
}
