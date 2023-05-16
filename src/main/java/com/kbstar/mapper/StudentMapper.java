package com.kbstar.mapper;

import com.kbstar.dto.Student;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface StudentMapper extends KBMapper<String, Student> {
}
