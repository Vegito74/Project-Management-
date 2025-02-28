package com.javaweb.model.request;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class StudentRequest {

     @NotNull(message =  "Đối tượng yêu cầu không hợp lệ!")
     private Integer id;
     @NotNull(message = "Không có id sinh viên!")
     private Integer studentId;
}
