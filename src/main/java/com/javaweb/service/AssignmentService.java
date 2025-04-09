package com.javaweb.service;

import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.response.AssignmentResponse;

import java.util.List;

public interface AssignmentService {
    void createAssignment(AssignmentDTO assignmentDTO);
    List<AssignmentResponse> getAllAssignments(Integer classId);
    void deleteAssignment(Integer assignmentId);
}
