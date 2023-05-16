package com.kbstar.service;

import com.kbstar.dto.Mypage;
import com.kbstar.dto.Student;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.MypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MypageService implements KBService<String, Mypage> {
    @Autowired
    MypageMapper mapper;

    @Override
    public void register(Mypage mypage) throws Exception {
        mapper.insert(mypage);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Mypage mypage) throws Exception {
        mapper.update(mypage);
    }
    @Override
    public Mypage get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Mypage> get() throws Exception {
        return null;
    }
}
