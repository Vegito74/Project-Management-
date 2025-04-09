package com.javaweb.service.impl;

import com.javaweb.entity.SubmissionEntity;
import com.javaweb.enums.SubmissionStatus;
import com.javaweb.model.dto.SubmissionDTO;
import com.javaweb.repository.AssignmentRepository;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.SubmissionRepository;
import com.javaweb.service.SubmissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Service
public class SubmissionServiceImpl implements SubmissionService {

    @Autowired
    private SubmissionRepository submissionRepository;

    private static final String UPLOAD_DIR = "D:\\Project Manager - Java\\uploads\\";
    @Autowired
    private StudenRepository studenRepository;
    @Autowired
    private AssignmentRepository assignmentRepository;

    @Override
    public SubmissionDTO createSubmission(SubmissionDTO submission, MultipartFile file) {
        try {
            // Kiểm tra và tạo thư mục nếu chưa tồn tại
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            // Lưu file vào thư mục uploads/
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            try (InputStream inputStream = file.getInputStream()) {
                Files.copy(inputStream, filePath);
            }
            SubmissionEntity submissionEntity = new SubmissionEntity();
            // Cập nhật thông tin file vào submission
            submissionEntity.setStudent(studenRepository.getOne(submission.getStudentId()));
            submissionEntity.setAssignment(assignmentRepository.getOne(submission.getAssignmentId()));
            submissionEntity.setFileUrl(fileName);
            submissionEntity.setSubmittedDate(Timestamp.valueOf(LocalDateTime.now()));
            submissionEntity.setStatus(SubmissionStatus.Submitted);
            submissionRepository.save(submissionEntity);
            // Lưu vào database
            return submission;
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi lưu file: " + e.getMessage());
        }
    }
}
