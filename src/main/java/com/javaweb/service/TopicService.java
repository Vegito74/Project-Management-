package com.javaweb.service;


import com.javaweb.model.dto.TopicDTO;

public interface TopicService {
    void createTopic(TopicDTO topicDTO);
    void approveRequest(Integer id);
    void rejectRequest(Integer id);
}
