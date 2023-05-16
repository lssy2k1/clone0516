package com.kbstar.study;

import com.kbstar.dto.Study;
import com.kbstar.service.StudyService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.util.Date;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    StudyService service;
    @Test
    void contextLoads() {
        Date date = new Date();
        Study study = new Study(1, "id00","2023/05/14","2023/05/14","내용내용","변경","오리지날네임");
        try {
            service.register(study);
            log.info("register OK--------------------------------");
        } catch (Exception e)  {
            e.printStackTrace();
            log.info("시스템 장애--------------------------------");
        }
    }

}
