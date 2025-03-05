package com.javaweb.model.dto;

import com.javaweb.entity.SubmissionEntity;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
public class GradeDTO {
    @NotNull(message = "Không có thông tin Id")
    private Integer submissionId;

    @NotNull(message = "Chưa có điểm số!")
    private Double score;
    @NotBlank(message = "Chưa có ngày khởi tạo")
    private Date gradedDate;
    private String comments;
}
