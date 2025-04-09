package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentEntity;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.TopicEntity;
import com.javaweb.model.response.StudentClassResponse;
import com.javaweb.repository.*;
import com.javaweb.service.StudentService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentServiceImpl  implements StudentService {

    @Autowired
    private  ClassRepository classRepository;

    @Autowired
    private  ModelMapper modelMapper;
    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private SubmissionRepository submissionRepository;
    @Autowired
    private StudenRepository studenRepository;
    @Autowired
    private AssignmentRepository assignmentRepository;


    @Override
    public List<StudentClassResponse> getStudentClass(int classId) {
        ClassEntity classEntity = classRepository.findById(classId);
        List<StudentClassResponse> result = new ArrayList<>();
        List<StudentEntity> studentEntities = studenRepository.findAllByClassEntity(classEntity);
        for (StudentEntity studentEntity : studentEntities) {
            StudentClassResponse studentClassResponse = modelMapper.map(studentEntity, StudentClassResponse.class);
            studentClassResponse.setFullName(studentEntity.getUser().getFullName());
            studentClassResponse.setEmail(studentEntity.getUser().getEmail());

            // Xử lý trạng thái topic của sinh viên
            TopicEntity topicEntity = topicRepository.getTopicEntityByStudent(studentEntity);
            if(topicEntity != null) {
                studentClassResponse.setTitleTopic(topicEntity.getTitle());
                studentClassResponse.setDescriptionTopic(topicEntity.getDescription());
            }
            else{
                studentClassResponse.setTitleTopic("Chưa có!");
                studentClassResponse.setDescriptionTopic("Chưa có mô tả");
            }
            int countAssignment = assignmentRepository.countAllByClassEntity(classEntity);
            int countComplete =submissionRepository.countSubmittedAssignmentsByStudentAndClass(studentEntity.getId(), studentEntity.getClassEntity().getId());
            studentClassResponse.setComplete(countComplete +"/"+countAssignment);
            result.add(studentClassResponse);
        }
        return result;
    }
}
