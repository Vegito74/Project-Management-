package com.javaweb.model.request;

import com.javaweb.enums.Status;
import lombok.Data;

@Data
public class TopicStatusRequest {
    private int studentId;
    private int id;
    private String comment;
    private Status status;
}
