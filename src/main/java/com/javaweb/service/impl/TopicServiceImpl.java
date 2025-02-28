package com.javaweb.service.impl;

import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.entity.TopicEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.TopicDTO;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.TopicRepository;
import com.javaweb.service.TopicService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private StudenRepository studenRepository;
    @Override
    public void createTopic(TopicDTO topicDTO) {
        TopicEntity topicEntity = modelMapper.map(topicDTO, TopicEntity.class);
        topicEntity.setStudent(studenRepository.findById(topicDTO.getStudentId()).get());
        topicEntity.setStatus(Status.Pending);
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
}
