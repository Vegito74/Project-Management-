package com.javaweb.model.response;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.SubmissionEntity;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Data;

import java.util.Date;

@Data
public class StudentAssignmentResponse extends AbstractDTO {
    private ClassEntity classEntity;
    private String type;
    private String title;
    private String description;
    private Date dueDate;
    private SubmissionEntity submissionEntity;
    private String submittedCount;
    private String percent;
}
