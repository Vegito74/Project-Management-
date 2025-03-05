package com.javaweb.api.admin;


import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.AssignmentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/assignment")
@Slf4j
public class AssignmentAPI {

    @Autowired
    private AssignmentService assignmentService;

    @PostMapping
    public ResponseEntity<ResponseData<AssignmentDTO>> createUser(@Valid @RequestBody AssignmentDTO newAssignment) {
        log.info("Creating new Assignment: {}", newAssignment.getTitle());

        AssignmentDTO assignmentDTO = assignmentService.createAssignment(newAssignment);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(),
                        "Nhiệm vụ đã được tạo thành công", assignmentDTO));
    }

}
