package com.javaweb.api.student;

import com.javaweb.model.dto.ClassDTO;
import com.javaweb.model.dto.TopicDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.StudentRequest;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.ClassRequestService;
import com.javaweb.service.ClassService;
import com.javaweb.service.TopicService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/student-request")
@Slf4j
public class StudentRequestAPI {

    @Autowired
    private ClassRequestService classRequestService;

    @Autowired
    private TopicService topicService;

    @PostMapping("/class-register") // Sinh viên đăng ký lớp học
    public ResponseEntity<ResponseData<StudentRequest>> classRegister(@Valid @RequestBody StudentRequest newRequest) {
        log.info("Tạo yêu cầu tham gia lớp học có id: {}", newRequest.getId());
        classRequestService.createStudentRequest(newRequest);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(),
                        "Yêu cầu được gửi thành công!",
                        newRequest));
    }
    @PostMapping("/topic-register")
    public ResponseEntity<ResponseData<?>> topicRegister(@Valid @RequestBody TopicDTO newTopic) {
        topicService.createTopic(newTopic);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(),
                        "Đăng ký đề tài thành công!",
                        newTopic));
    }

    @DeleteMapping("/delete-{id}")
    public ResponseEntity<ResponseData<?>> deleteRegister(@PathVariable("id") Integer id) {
        classRequestService.deleteStudentRequest(id);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(),
                        "Xoá yêu cầu thành công!",
                        null));
    }

}
