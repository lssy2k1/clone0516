package com.kbstar.service;

import com.kbstar.dto.Student;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService implements KBService<String, Student> {
    @Autowired
    StudentMapper mapper;

    @Override
    public void register(Student student) throws Exception {
        mapper.insert(student);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Student student) throws Exception {
        mapper.update(student);
    }

    @Override
    public Student get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Student> get() throws Exception {
        return mapper.selectall();
    }
}
