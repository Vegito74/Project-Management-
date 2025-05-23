package com.javaweb.service;

import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.model.request.StudentRequest;
import com.javaweb.model.response.ClassRequestResponse;

import java.util.List;

public interface ClassRequestService {
    void createStudentRequest(StudentRequest studentRequest);
    void approveRequest(Integer id);
    void rejectRequest(Integer id);

    void deleteStudentRequest(Integer id);// Xoá yêu cầu
//   Lấy danh sách yêu cầu của 1 sinh viên
    List<ClassRequestEntity> getAllClassRequestsForStudent(Integer id);
    List<ClassRequestResponse> getAllClassRequestsForClass(int classId);

}
