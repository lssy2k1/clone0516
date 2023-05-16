package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Myblog;
import com.kbstar.dto.Mypage;
import com.kbstar.dto.Student;
import com.kbstar.dto.Study;
import com.kbstar.service.MyblogService;
import com.kbstar.service.MypageService;
import com.kbstar.service.StudentService;
import com.kbstar.utill.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Locale;

@Slf4j
@Controller
@RequestMapping("/student")

public class StudentController {
    @Value("${uploadimgdir}")
    String imgpath;

    @Value("${upload.path}")
    String uploadPath;

    @Autowired
    MypageService mypageService;
    @Autowired
    MyblogService myblogService;
    String dir = "student/";

    @RequestMapping("/mypage")
    public String mypage(Model model, String id) throws Exception {
        Mypage mypage = null;
        List<Myblog> list = null;
        String dDay = null;
        try {
            mypage = mypageService.get(id);
//            log.info(String.valueOf(mypage) + "----------------test");
            LocalDate today = LocalDate.now(ZoneId.of("Asia/Seoul"));

            // Digi의 시작일을 가져옵니다.
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
            LocalDate digiStart = LocalDate.parse(mypage.getDigi_sdate().toString(), formatter);

            // 현재 날짜와 Digi의 시작일을 비교하여 d-day를 계산합니다.
            long daysBetween = ChronoUnit.DAYS.between(today, digiStart);
            dDay = (daysBetween > 0) ? "D-" + daysBetween : "D+" + Math.abs(daysBetween);

            list = myblogService.getMyBlog(id);


        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        model.addAttribute("student", mypage);
        model.addAttribute("bloglist",list);
        model.addAttribute("dday", dDay);
        return dir + "mypage";
    }
}
