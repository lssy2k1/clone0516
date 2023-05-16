package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Lecture;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface LectureMapper extends KBMapper<Integer, Lecture> {
    Page<Lecture> getpage() throws Exception;
}
