package com.javaweb.api.admin;

import com.javaweb.model.dto.ClassDTO;
import com.javaweb.model.dto.TopicDTO;
import com.javaweb.model.request.TopicStatusRequest;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.TopicService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/topic")
@Slf4j
public class TopicAPI{

    @Autowired
    private TopicService topicService;

    @PostMapping ("/topicStatus") // Thêm lớp học mới
    public ResponseEntity<?> approveRequest(@Valid @RequestBody TopicStatusRequest topicStatusRequest) {
        topicService.updateStatusTopic(topicStatusRequest);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(), "Đã lưu kết quả!", null));
    }

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
