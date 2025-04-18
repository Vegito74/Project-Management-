package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClassResponse {
    private Integer id;
    private Integer lecturerId;
    private String className;
    private String status;
    private String semester;
    private int student_count;
    private int assignment_count;
}
