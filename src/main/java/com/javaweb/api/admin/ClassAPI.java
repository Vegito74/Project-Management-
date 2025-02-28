package com.javaweb.api.admin;

import com.javaweb.model.dto.ClassDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.ClassRequestService;
import com.javaweb.service.ClassService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/class")
@Slf4j
public class ClassAPI {

    @Autowired
    private ClassService classService;

    @Autowired
    private ClassRequestService classRequestService;


    @PostMapping   // Thêm lớp học mới
    public ResponseEntity<?> createUser(@Valid @RequestBody ClassDTO newClass) {
        log.info("Creating new class: {}", newClass.getClassName());

        ClassDTO classDTO = classService.insertClass(newClass);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(), "Lớp học được thêm thành công!", classDTO));
    }

    @PutMapping("/{requestId}/approve")
    public ResponseEntity<String> approveRequest(@Valid @PathVariable Integer requestId) {
        classRequestService.approveRequest(requestId);
        return ResponseEntity.ok("Yêu cầu đã được duyệt!");
    }

    @PutMapping("/{classId}/requests/{requestId}/reject")
    public ResponseEntity<String> rejectRequest( @PathVariable Integer requestId) {
        classRequestService.rejectRequest(requestId);
        return ResponseEntity.ok("Yêu cầu đã bị từ chối!");
    }



}
