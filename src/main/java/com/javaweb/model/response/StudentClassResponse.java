package com.javaweb.model.response;

import lombok.Data;



@Data
public class StudentClassResponse {

    private String fullName;
    private String email;
    private String studentCode;
    private String titleTopic;
    private String descriptionTopic;
    private String complete;
}
