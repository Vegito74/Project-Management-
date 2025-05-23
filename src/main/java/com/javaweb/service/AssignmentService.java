package com.javaweb.service;

import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.response.AssignmentResponse;

import com.javaweb.model.response.StudentAssignmentResponse;
import com.javaweb.model.response.StudentSubmissionForAssignmentResponse;

import java.util.List;

public interface AssignmentService {
    void createAssignment(AssignmentDTO assignmentDTO);
    AssignmentResponse getAssignmentById(int id);
    List<AssignmentResponse> getAllAssignments(Integer classId);
    void deleteAssignment(Integer assignmentId);
    List<StudentAssignmentResponse> getAllStudentAssignments(Integer studentId);

    // Lấy tất cả các sinh viên của lớp, trạng thái nộp bài của từng sinh viên
    List<StudentSubmissionForAssignmentResponse> getAllStudentSubmissionForAssignment(Integer assignmentId );

}
