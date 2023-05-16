package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;


@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Study {
    private int id;
    private String studentId;
    private String startTime;
    private String endTime;
    private String contents;
    private String rdate;
    private String fileName;
    private String fileName_org;

    private MultipartFile file;

    private String studentName;
    private String studentImg;

    public Study(String studentId, String startTime, String endTime, String contents, String fileName, String fileName_org) {
        this.studentId = studentId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.contents = contents;
        this.fileName = fileName;
        this.fileName_org = fileName_org;
    }

    public Study(int id, String studentId, String startTime, String endTime, String contents, String rdate, String fileName, String fileName_org) {
        this.id = id;
        this.studentId = studentId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.contents = contents;
        this.rdate = rdate;
        this.fileName = fileName;
        this.fileName_org = fileName_org;
    }

    public Study(int id, String studentId, String startTime, String endTime, String contents, String fileName, String fileName_org) {
        this.id = id;
        this.studentId = studentId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.contents = contents;
        this.fileName = fileName;
        this.fileName_org = fileName_org;
    }


    public void setFormattedRdate(String formattedRdate) {
    }
}