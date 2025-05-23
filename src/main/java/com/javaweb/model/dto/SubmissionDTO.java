package com.javaweb.model.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.javaweb.entity.AssignmentEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.enums.SubmissionStatus;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class SubmissionDTO extends AbstractDTO{

    @NotNull(message = "Thiếu")
    private Integer assignmentId;
    @NotNull(message = "Thiếu")
    private Integer studentId;
    @NotBlank
    private String submittedDate;
    @NotBlank
    private String status;
}
