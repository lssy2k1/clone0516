package com.kbstar.mapper;

import com.kbstar.dto.Myblog;
import com.kbstar.dto.Study;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MyblogMapper extends KBMapper<Integer, Myblog> {

    public List<Myblog> getMyBlog(String stu_id) throws Exception;
}
