package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Lecture;
import com.kbstar.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequestMapping("/lecture")

public class LectureController {
    @Value("${uploadimgdir}")
    String imgpath;

    @Autowired
    LectureService lectureService;

    String dir = "lecture/";

    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Lecture> p;
        try {
            p = new PageInfo<>(lectureService.getPage(pageNo), 5);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        model.addAttribute("target","lecture");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"allpage");
        return "index";
    }
}
