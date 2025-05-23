package com.javaweb.model.response;

import com.javaweb.enums.Status;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class TopicResponse extends AbstractDTO {
    private Integer studentId;
    private String studentName;
    private String title;
    private String category;
    private String technologies;
    private String description;
    private String comment;
    private Status status;
    private String className;
}
