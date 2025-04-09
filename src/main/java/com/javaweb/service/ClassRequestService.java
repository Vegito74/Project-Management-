package com.javaweb.service;

import com.javaweb.model.request.StudentRequest;
import com.javaweb.model.response.ClassRequestResponse;

import java.util.List;

public interface ClassRequestService {
    void createStudentRequest(StudentRequest studentRequest);
    void approveRequest(Integer id);
    void rejectRequest(Integer id);

    List<ClassRequestResponse> getAllClassRequestsForClass(int classId);

}
