package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private String id;
    private String pwd;
    private String name;
    private String detail;
    private String email;
    private String contact;
    private String img;
    private String insta;
    private String facebook;

    private MultipartFile imgfile;

    public Student(String id, String pwd, String name, String email, String contact) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.contact = contact;
    }


    public Student(String id, String pwd, String name, String detail, String email, String contact, String img) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.detail = detail;
        this.email = email;
        this.contact = contact;
        this.img = img;
    }

    public Student(String id, String pwd, String name, String detail, String email, String contact, String img, String insta, String facebook) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.detail = detail;
        this.email = email;
        this.contact = contact;
        this.img = img;
        this.insta = insta;
        this.facebook = facebook;
    }

}
