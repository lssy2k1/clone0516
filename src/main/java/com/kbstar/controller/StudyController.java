package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Study;
import com.kbstar.service.StudyService;
import com.kbstar.utill.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@Slf4j
@Controller
@RequestMapping("/study")

public class StudyController {
    @Value("${uploadimgdir}")
    String imgpath;

    @Value("${upload.path}")
    String uploadPath;

    @Autowired
    StudyService studyService;


    String dir = "study/";

    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Study> p;
        try {
            p = new PageInfo<>(studyService.getPage(pageNo), 5);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        model.addAttribute("cpage", p);
        model.addAttribute("target", "study");
        model.addAttribute("center", dir + "allpage2");
        return "index";
    }

    @RequestMapping("/writeimpl")
    public String writeimpl(Model model, Study study) throws Exception {
        //input datetimelocal로 받은 String date값 변환해서 study에 set
        String startTime_org = study.getStartTime();
        String endTime_org = study.getEndTime();
        LocalDateTime parseStartTime = LocalDateTime.parse(startTime_org);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss");
        String startTime = parseStartTime.format(formatter);
        study.setStartTime(startTime);

        LocalDateTime parseEndTime = LocalDateTime.parse(endTime_org);
        String endTime = parseEndTime.format(formatter);
        study.setEndTime(endTime);

        MultipartFile file = study.getFile();
        String fileName_org = file.getOriginalFilename();
        String filename = FileUploadUtil.uploadFile(file, uploadPath);
        study.setFileName(filename);
        study.setFileName_org(fileName_org);
        studyService.register(study);
        return "redirect:/"+dir+"allpage";
    }

    @RequestMapping("/write")
    public String write(Model model) throws Exception {
        model.addAttribute("center",dir+"write");
        return "index";
    }

    @RequestMapping("/edit")
    public String edit(Model model, Integer id) throws Exception {
        Study study = null;
        study = studyService.get(id);
        model.addAttribute("study", study);
        model.addAttribute("center", dir+"edit");
        return "index";
    }

    @RequestMapping("/editimpl")
    public String editimpl(Model model, Study study) throws Exception {
        int studyNo = study.getId();
        log.info("원래아이디"+studyNo);
        Study Origin = studyService.get(studyNo);
        log.info("원래스터디"+Origin.toString());
        String previousOrg = Origin.getFileName_org();
        log.info("원래찐이름"+previousOrg);
        String previousName = Origin.getFileName();
        log.info("원래가짜이름"+previousName);
        String previousStart = Origin.getStartTime();
        String previousEnd = Origin.getEndTime();

        MultipartFile mf = study.getFile();
        String new_fileName_org = mf.getOriginalFilename();

        String new_start = study.getStartTime();

        if ((new_fileName_org.equals("")||new_fileName_org == null) && (new_start.equals("")||new_start == null)){
            study.setFileName(previousName);
            study.setFileName_org(previousOrg);
            study.setStartTime(previousStart);
            study.setEndTime(previousEnd);
            log.info("새스터디"+study.toString());
            studyService.modify(study);

        } else if ((new_fileName_org.equals("")||new_fileName_org == null) && (!(new_start.equals("")||new_start == null))) {
            String startTime_org = study.getStartTime();
            String endTime_org = study.getEndTime();
            LocalDateTime parseStartTime = LocalDateTime.parse(startTime_org);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss");
            String startTime = parseStartTime.format(formatter);
            study.setStartTime(startTime);

            LocalDateTime parseEndTime = LocalDateTime.parse(endTime_org);
            String endTime = parseEndTime.format(formatter);
            study.setEndTime(endTime);

            study.setFileName(previousName);
            study.setFileName_org(previousOrg);
            log.info("새스터디"+study.toString());
            studyService.modify(study);

        } else if (!(new_fileName_org.equals("")||new_fileName_org == null) && (new_start.equals("")||new_start == null)) {
            study.setStartTime(previousStart);
            study.setEndTime(previousEnd);
            String new_fileName = FileUploadUtil.uploadFile(mf, uploadPath);
            study.setFileName(new_fileName);
            study.setFileName_org(new_fileName_org);
            log.info("새스터디"+study.toString());
            studyService.modify(study);

        } else {
            String startTime_org = study.getStartTime();
            String endTime_org = study.getEndTime();
            LocalDateTime parseStartTime = LocalDateTime.parse(startTime_org);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss");
            String startTime = parseStartTime.format(formatter);
            study.setStartTime(startTime);

            LocalDateTime parseEndTime = LocalDateTime.parse(endTime_org);
            String endTime = parseEndTime.format(formatter);
            study.setEndTime(endTime);

            String new_fileName = FileUploadUtil.uploadFile(mf, uploadPath);
            study.setFileName(new_fileName);
            study.setFileName_org(new_fileName_org);
            studyService.modify(study);
        }
        return "redirect:/study/allpage";
    }

    @RequestMapping("/delete")
    public String delete(Model model, Integer id) throws Exception {
        studyService.remove(id);
        return "redirect:/study/allpage";
    }

}
