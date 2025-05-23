package com.javaweb.api.admin;


import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.AssignmentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/assignment")
@Slf4j
public class AssignmentAPI {

    @Autowired
    private AssignmentService assignmentService;

    @PostMapping
    public ResponseEntity<?> createUser(@Valid @RequestBody AssignmentDTO newAssignment) {
         log.info("Creating new Assignment: {}", newAssignment.getTitle());
        assignmentService.createAssignment(newAssignment);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(),
                        "Nhiệm vụ đã được tạo thành công", null));
    }

    @DeleteMapping("/{id}/delete")
    public ResponseEntity<?> deleteAssignment(@PathVariable Integer id) {
        assignmentService.deleteAssignment(id);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED .value(),
                        "Xoá thành công!",
                        null));
    }

}
