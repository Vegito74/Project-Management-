package com.javaweb.model.response;

import com.javaweb.entity.*;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Data;



@Data
public class StudentSubmissionForAssignmentResponse  extends AbstractDTO {
    private UserEntity user;
    private String classCode;
    private String studentCode;
    private SubmissionEntity submissionEntity;
    private GradeEntity gradeEntity;
}
