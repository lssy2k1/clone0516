package com.kbstar.myblog;

import com.kbstar.dto.Myblog;
import com.kbstar.service.MyblogService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


import java.util.List;


@Slf4j
@SpringBootTest
class SelectIDTest {

    @Autowired
    MyblogService service;

    @Test
    void contextLoads() {
        try {
            List<Myblog> list = null;
           list = service.getMyBlog("rlawls2422");
           log.info(list.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}