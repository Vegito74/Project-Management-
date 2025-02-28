package com.javaweb.model.dto;

import com.javaweb.enums.Role;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;


@Data
public class UserDTO extends AbstractDTO {
    private Integer id;
    private String username;
    private String password;
    private String fullName;

    @Email(message = "Invalid email format")
    @NotBlank(message = "Email is required")
    private String email;
    private Integer status;
    private Role role;
    private String studentCode;
    private String classCode;
    private String department;
}
