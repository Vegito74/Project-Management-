package com.javaweb.model.dto;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@EqualsAndHashCode(callSuper = true)
@Data
public class ClassDTO  extends AbstractDTO{

    @NotNull(message = "Không có thông tin giảng viên!")
    private Integer lecturerId;

    @NotBlank(message = "Tên lớp không được bỏ trống!")
    private String className;

    @Size(min = 1, max = 10, message = "Dữ liệu quá dài hoặc không hợp lệ!")
    private String semester;

    @NotBlank(message = "Thiếu thông tin status!")
    private String status;
}
