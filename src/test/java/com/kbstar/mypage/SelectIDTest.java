package com.kbstar.mypage;

import com.kbstar.dto.Mypage;
import com.kbstar.service.MypageService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Locale;

@Slf4j
@SpringBootTest
class SelectIDTest {

    @Autowired
    MypageService service;

    @Test
    void contextLoads() {
        try {
            Mypage mypage = service.get("rlawls2422");
            // 현재 날짜를 구합니다.
            LocalDate today = LocalDate.now(ZoneId.of("Asia/Seoul"));

            // Digi의 시작일을 가져옵니다.
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
            LocalDate digiStart = LocalDate.parse(mypage.getDigi_sdate().toString(), formatter);

            // 현재 날짜와 Digi의 시작일을 비교하여 d-day를 계산합니다.
            long daysBetween = ChronoUnit.DAYS.between(today, digiStart);
            String dDay = (daysBetween > 0) ? "D-" + daysBetween : "D+" + Math.abs(daysBetween);

            // 결과를 출력합니다.
            System.out.println("<h3>WITH DIGI " + dDay + "</h3>");
        } catch (Exception e) {
            log.info("select one error-----------------------------");
            e.printStackTrace();
        }
    }
}