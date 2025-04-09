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


    @PostMapping  // Thêm lớp học mới
    public ResponseEntity<?> createUser(@Valid @RequestBody ClassDTO newClass) {
        log.info("Creating new class: {}", newClass.getClassName());
        ClassDTO classDTO = classService.insertClass(newClass);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(), "Lớp học được thêm thành công!", classDTO));
    }
    @DeleteMapping("/{id}/delete")
    public ResponseEntity<?> deleteBuilding(@PathVariable Integer  id) {
        classService.deleteClass(id);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED .value(),
                        "Xoá thành công!",
                        null));

    }
    @PutMapping("/{id}/approve")
    public ResponseEntity<?> approveRequest(@PathVariable("id") Integer id) {
        classRequestService.approveRequest(id);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED .value(),
                        "Yêu cầu đã được duyệt!",
                        null));

    }
    @PutMapping("/{requestId}/reject")
    public ResponseEntity<?> rejectRequest( @PathVariable Integer requestId) {
        classRequestService.rejectRequest(requestId);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED .value(),
                        "Yêu cầu đã bị từ chối!",
                        null));
    }
}
