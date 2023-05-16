package com.kbstar.lecture;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Lecture;
import com.kbstar.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectPageTest {

    @Autowired
    LectureService lectureService;

    @Test
    void contextLoads() {
        PageInfo<Lecture> pageInfo;


        try {
            pageInfo = new PageInfo<>(lectureService.getPage(1), 5); // 5:하단 네비게이션 개수

        } catch (Exception e) {
                log.info("시스템 장애입니다.");
                e.printStackTrace();
            }
        }
    }

