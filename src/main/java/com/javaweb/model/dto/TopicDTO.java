package com.javaweb.model.dto;

import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.enums.Status;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class TopicDTO extends AbstractDTO {

    @NotNull(message = "Không có giá trị studentId gửi về!")
    private Integer studentId;

    @NotBlank(message = "Tên đề tài không hợp lệ!")
    private String title;

    @NotBlank(message = "Chưa chọn loại đề tài!")
    private String category;

    @NotBlank(message = "Chưa chọn công nghệ sử dụng!")
    private String technologies;

    private String description;
    private String comment;
    private Status status;
}
