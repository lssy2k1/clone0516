package com.kbstar.study;

import com.kbstar.dto.Study;
import com.kbstar.service.StudyService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    StudyService service;
    @Test
    void contextLoads() {
        Study study = new Study(1, "id001","2023/05/14","2023/05/14","변경테스트","테스트","디스이즈변경");
        try {
            service.modify(study);
            log.info("update OK--------------------------------");
            service.get(1);
        } catch (Exception e) {
            log.info("update error-----------------------------");
        }
    }

}
