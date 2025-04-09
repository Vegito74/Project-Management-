package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor // Lombok tự động tạo constructor không tham số
@AllArgsConstructor // Lombok tự động tạo constructor có tham số cho tất cả các trường
public class AssignmentResponse extends AbstractDTO {
    private Integer id;
    private String type;
    private String title;
    private String description;
    private Date dueDate;
    private String submittedCount;
    private String percent;
}
