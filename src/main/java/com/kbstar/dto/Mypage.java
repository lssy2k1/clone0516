package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Mypage {
    private String id;
    private String pwd;
    private String name;
    private String detail;
    private String email;
    private String contact;
    private String img;
    private String insta;
    private String facebook;
    private String mbti;
    private Date com_sdate;
    private Date digi_sdate;


    private MultipartFile imgfile;

}
