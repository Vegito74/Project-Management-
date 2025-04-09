package com.javaweb.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.javaweb.entity.BaseEntity;
import lombok.Data;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
public class AssignmentDTO extends AbstractDTO {
    @NotNull(message = " Chưa có thông tin lớp!")
    private Integer classId;
    @NotBlank(message = "Chưa có kiểu nhiệm vụ!")
    private String type;
    @NotBlank(message =  "Title trống!")
    private String title;
    @NotBlank(message = "Chưa có mô tả nhiệm vụ!")
    private String description;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    @NotNull(message=  "Chưa có thời hạn nộp cuối cùng!")
    private Date dueDate;
}
