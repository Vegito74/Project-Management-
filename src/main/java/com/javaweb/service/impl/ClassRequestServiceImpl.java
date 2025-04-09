package com.javaweb.service.impl;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.request.StudentRequest;
import com.javaweb.model.response.ClassRequestResponse;
import com.javaweb.repository.ClassRepository;
import com.javaweb.repository.ClassRequestRepository;
import com.javaweb.repository.StudenRepository;
import com.javaweb.service.ClassRequestService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Service
public class ClassRequestServiceImpl implements ClassRequestService {
    @Autowired
    private StudenRepository studentRepository;

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private ClassRequestRepository classRequestRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override // Lưu yêu cầu gia nhập của sinh viên
    public void createStudentRequest(StudentRequest studentRequest) {
        ClassRequestEntity classRequestEntity = new ClassRequestEntity();
        ClassEntity classEntity = classRepository.findById(studentRequest.getId()).get();
        classRequestEntity.setClassEntity(classEntity);
        StudentEntity studentEntity = studentRepository.findById(studentRequest.getStudentId()).get();
        classRequestEntity.setStudent(studentEntity);
        //Mặc định trạng thái chờ xử lý
        classRequestEntity.setStatus(Status.Pending);
        classRequestRepository.save(classRequestEntity);
    }

    @Override
    public void approveRequest(Integer id) {
        ClassRequestEntity classRequestEntity = classRequestRepository.findById(id).get();
        classRequestEntity.setStatus(Status.Accepted);
        ClassEntity classEntity = classRequestEntity.getClassEntity();

        //Thêm sinh viên vào lớp
        StudentEntity studentEntity = classRequestEntity.getStudent();
        studentEntity.setClassEntity(classEntity);
        studentRepository.save(studentEntity);
        //Lưu kết quả
        classRequestRepository.save(classRequestEntity);
    }

    @Override
    public void rejectRequest(Integer id) {
        ClassRequestEntity classRequestEntity=classRequestRepository.findById(id).get();
        classRequestEntity.setStatus(Status.Rejected);
        classRequestRepository.save(classRequestEntity);


    }

    @Override
    public List<ClassRequestResponse> getAllClassRequestsForClass(int classId) {
        ClassEntity classEntity = classRepository.findById(classId);
        List<ClassRequestEntity> classRequestEntityList= classRequestRepository.findByClassEntityAndStatus(classEntity, Status.Pending);
        List<ClassRequestResponse> results =new ArrayList<>();
        for(ClassRequestEntity classRequestEntity:classRequestEntityList){
            ClassRequestResponse classRequestResponse = modelMapper.map(classRequestEntity, ClassRequestResponse.class);
            results.add(classRequestResponse);
        }
        return results;

    }
}
