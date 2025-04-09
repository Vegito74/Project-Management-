package com.javaweb.model.response;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Data;



@Data
public class ClassRequestResponse extends AbstractDTO {
    private Integer id;
    private ClassEntity classEntity;
    private StudentEntity student;
    private Status status;
    private String message;
}
