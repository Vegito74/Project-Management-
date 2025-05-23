package com.javaweb.service.impl;

import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.TopicEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.TopicDTO;
import com.javaweb.model.request.TopicStatusRequest;
import com.javaweb.model.response.TopicResponse;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.TopicRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.TopicService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private StudenRepository studenRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public void createTopic(TopicDTO topicDTO){
        TopicEntity topicEntity = modelMapper.map(topicDTO, TopicEntity.class);

        UserEntity user = userRepository.findById(topicDTO.getStudentId()).get();
        StudentEntity student = studenRepository.getStudentEntityByUser(user);
        topicEntity.setStudent(studenRepository.findById(student.getId()).get());
        topicEntity.setStatus(Status.Pending);

        //Xử lý trường hợp đăng ký nhiều lần tránh spam
        StudentEntity studentEntity = studenRepository.findById(student.getId()).get();
        List<TopicEntity> topicCheck = topicRepository.getTopicEntitiesByStudentAndStatusOrStudentAndStatus(
                studentEntity, Status.Pending, studentEntity,Status.Accepted);
        if(topicCheck != null && !topicCheck.isEmpty() && topicDTO.getStudentId() != 0 ){
            throw new RuntimeException("Bạn đã có Đề tài hoặc Đề tài của bạn đang trong trạng thái chờ phê duyệt!");
        }
        topicRepository.save(topicEntity);
    }

    @Override
    public void approveRequest(Integer id) {
        TopicEntity topicEntity = topicRepository.findById(id).get();
        topicEntity.setStatus(Status.Accepted);
        topicRepository.save(topicEntity);
    }

    @Override
    public void rejectRequest(Integer id) {
        TopicEntity topicEntity = topicRepository.findById(id).get();
        topicEntity.setStatus(Status.Rejected);
        topicRepository.save(topicEntity);
    }

    @Override
    public List<TopicResponse> listTopicsApproval() {
        List<TopicEntity> topicEntities =topicRepository.getTopicEntitiesByStatus(Status.Accepted);
        List<TopicResponse> results = new ArrayList<>();
        for(TopicEntity topicEntity : topicEntities){
            TopicResponse topicResponse = modelMapper.map(topicEntity, TopicResponse.class);
            topicResponse.setStudentName(topicEntity.getStudent().getUser().getFullName());
            topicResponse.setStudentId(topicEntity.getStudent().getId());
            topicResponse.setClassName(topicEntity.getStudent().getClassEntity().getClassName());
            results.add(topicResponse);
        }
        return results;
    }

    @Override
    public void updateStatusTopic(TopicStatusRequest topicStatusRequest) {
        TopicEntity topicEntity = topicRepository.findById(topicStatusRequest.getId()).get();
        topicEntity.setStatus(topicStatusRequest.getStatus());
        if(topicStatusRequest.getComment() != null  && topicStatusRequest.getComment().isEmpty()){
            throw new RuntimeException("Chưa có comment!");
        }
        topicEntity.setComment(topicStatusRequest.getComment());
        topicRepository.save(topicEntity);
    }
}
