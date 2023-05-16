package com.kbstar.lecture;

import com.kbstar.dto.Lecture;
import com.kbstar.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class SelectTest {


    @Autowired
    LectureService lectureService;
    @Test
    void contextLoads() throws Exception {
        List<Lecture> list = null;

        try {
            list = lectureService.get();
            log.info(list.toString());
        } catch (Exception e) {
            log.info("시스템 장애입니다.");
            e.printStackTrace();
        }
    }
}
