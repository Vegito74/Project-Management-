package com.javaweb.api.student;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.entity.SubmissionEntity;
import com.javaweb.model.dto.SubmissionDTO;
import com.javaweb.model.response.ResponseData;
import com.javaweb.service.SubmissionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/api/submission")
@Slf4j
public class SubmissionAPI {

    @Autowired
    private SubmissionService submissionService;


    @PostMapping
    public ResponseEntity<?> uploadFile(@RequestParam("jsonData") String jsonData,
                                        @RequestParam("file") MultipartFile file) {
        try {
            System.out.println("📥 Received JSON: " + jsonData);
            System.out.println("📥 Received File: " + file.getOriginalFilename());

            ObjectMapper objectMapper = new ObjectMapper();
            SubmissionDTO dto = objectMapper.readValue(jsonData, SubmissionDTO.class);
            submissionService.createSubmission(dto, file);
            if (dto == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("🚨 JSON data is invalid");
            }

            if (file.isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("🚨 File is empty");
            }


            return ResponseEntity.ok("✅ Upload successful");
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("❌ ERROR: " + e.getMessage());
        }
    }
}
