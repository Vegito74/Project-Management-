package com.javaweb.model.response;

import com.javaweb.entity.ClassEntity;
import com.javaweb.enums.Role;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Data
public class LecturerResponse {
    private Integer id;
    private String username;
    private String fullName;
    private String email;
    private Role role;
    private String department;
    private List<ClassResponse> classes;
}
