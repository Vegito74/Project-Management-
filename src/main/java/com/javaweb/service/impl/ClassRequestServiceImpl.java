package com.javaweb.service.impl;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.request.StudentRequest;
import com.javaweb.model.response.ClassRequestResponse;
import com.javaweb.repository.ClassRepository;
import com.javaweb.repository.ClassRequestRepository;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ClassRequestService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
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
    @Autowired
    private UserRepository userRepository;

    @Override // Lưu yêu cầu gia nhập của sinh viên
    public void createStudentRequest(StudentRequest studentRequest) {
        ClassRequestEntity classRequestEntity = new ClassRequestEntity();
        ClassEntity classEntity = classRepository.findById(studentRequest.getId()).get();

       UserEntity user = userRepository.findById(studentRequest.getStudentId()).get();

        StudentEntity studentEntity = studentRepository.getStudentEntityByUser(user);
        List<ClassRequestEntity> classRequestEntityList = classRequestRepository.findByStudentAndStatus(studentEntity, Status.Pending);
        if(classRequestEntityList != null  && classRequestEntityList.size() !=0){
            throw new RuntimeException("Bạn đang có đơn xin gia nhập trước đó chưa được duyệt!");
        }
        else if(studentEntity.getClasses() != null && studentEntity.getClasses().size() !=0){
            throw new RuntimeException("Bạn đã tham gia một lớp học trươc đó rồi!");
        }
        classRequestEntity.setClassEntity(classEntity);

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
    public void deleteStudentRequest(Integer id) {
        classRequestRepository.deleteClassRequestEntityById(id);
    }

    @Override
    public List<ClassRequestEntity> getAllClassRequestsForStudent(Integer id) {


        StudentEntity studentEntity=studentRepository.findStudentEntityById(id);
        return classRequestRepository.findByStudent(studentEntity);
    }

    @Override
    public List<ClassRequestResponse> getAllClassRequestsForClass(int classId) {
        ClassEntity classEntity = classRepository.findById(classId);
        List<ClassRequestEntity> classRequestEntityList= classRequestRepository.findByClassEntityAndStatusNative(classEntity.getId(), Status.Pending.name());
        List<ClassRequestResponse> results =new ArrayList<>();
        for(ClassRequestEntity classRequestEntity:classRequestEntityList){
            ClassRequestResponse classRequestResponse = modelMapper.map(classRequestEntity, ClassRequestResponse.class);
            results.add(classRequestResponse);
        }
        return results;

    }
}
