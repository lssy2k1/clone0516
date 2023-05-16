package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Myblog {
    private int id;
    private String stu_id;
    private String title;
    private String contents;
    private Date rdate;



}
