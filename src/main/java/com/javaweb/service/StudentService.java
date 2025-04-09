package com.javaweb.service;

import com.javaweb.model.response.StudentClassResponse;

import java.util.List;

public interface StudentService {
    List<StudentClassResponse> getStudentClass(int classId);

}
