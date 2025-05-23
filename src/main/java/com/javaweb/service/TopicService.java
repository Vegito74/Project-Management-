package com.javaweb.service;


import com.javaweb.model.dto.TopicDTO;
import com.javaweb.model.request.TopicStatusRequest;
import com.javaweb.model.response.TopicResponse;

import java.util.List;

public interface TopicService {
    void createTopic(TopicDTO topicDTO);
    void approveRequest(Integer id);
    void rejectRequest(Integer id);
    List<TopicResponse> listTopicsApproval();
    void updateStatusTopic(TopicStatusRequest topicStatusRequest);
}
