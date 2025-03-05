package com.javaweb.api.admin;

import com.javaweb.service.TopicService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/topic")
@Slf4j
public class TopicAPI{

    @Autowired
    private TopicService topicService;

    @PutMapping("/{requestId}/approve")
    public ResponseEntity<String> approveRequest(@Valid @PathVariable Integer requestId) {
        topicService.approveRequest(requestId);
        return ResponseEntity.ok("Yêu cầu đã được duyệt!");
    }

    @PutMapping("/{requestId}/reject")
    public ResponseEntity<String> rejectRequest( @PathVariable Integer requestId) {
        topicService.rejectRequest(requestId);
        return ResponseEntity.ok("Yêu cầu đã bị từ chối!");
    }
}
