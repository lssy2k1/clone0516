package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Lecture {
    private int id;
    private String title;
    private String teacher;
    private String topic;
    private String target;
    private String rdate;
    private String lec_time;
    private float rating;
    private int students;
    private String img;

}
