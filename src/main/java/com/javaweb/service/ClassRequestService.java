package com.javaweb.service;

import com.javaweb.model.request.StudentRequest;

public interface ClassRequestService {
    void createStudentRequest(StudentRequest studentRequest);
    void approveRequest(Integer id);
    void rejectRequest(Integer id);
}
