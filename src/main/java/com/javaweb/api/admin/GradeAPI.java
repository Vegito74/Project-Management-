package com.javaweb.api.admin;


import com.javaweb.model.dto.GradeDTO;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.GradeService;
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
@RequestMapping("/api/grade")
@Slf4j
public class GradeAPI {

   @Autowired
   private GradeService gradeService;

    @PostMapping
    public ResponseEntity<?> addScore(@Valid @RequestBody GradeDTO newAssess) {
        log.info("Creating new Assess: {}", newAssess.getSubmissionId());
        GradeDTO gradeDTO = gradeService.assessSubmission(newAssess);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ResponseData<>(HttpStatus.CREATED.value(),
                        "Đánh giá thành công", gradeDTO));
    }

}