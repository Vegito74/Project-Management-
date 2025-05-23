package com.javaweb.service.impl;

import com.google.api.client.http.InputStreamContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.javaweb.config.GoogleDriveAuth;
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
        /*try {
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
        }*/

            try {
                // 1. Upload file lên Google Drive
                Drive driveService = GoogleDriveAuth.createDriveService();

                // Upload và lấy file trả về
                File uploadedFile = uploadFileToDrive(driveService, file);

                // 2. Lấy ID hoặc link file trên Drive để lưu vào database
                String driveFileId = uploadedFile.getId();

                // Ví dụ bạn lưu driveFileId làm fileUrl hoặc tạo link share tùy bạn
                String driveFileUrl = "https://drive.google.com/file/d/" + driveFileId + "/view";

                // 3. Tạo entity lưu dữ liệu submission
                SubmissionEntity submissionEntity = new SubmissionEntity();
                submissionEntity.setStudent(studenRepository.getOne(submission.getStudentId()));
                submissionEntity.setAssignment(assignmentRepository.getOne(submission.getAssignmentId()));
                submissionEntity.setFileUrl(driveFileUrl);
                submissionEntity.setSubmittedDate(Timestamp.valueOf(LocalDateTime.now()));
                submissionEntity.setStatus(SubmissionStatus.Submitted);
                submissionEntity.setFileName(file.getOriginalFilename());
                submissionRepository.save(submissionEntity);

                return submission;
            } catch (Exception e) {
                throw new RuntimeException("Lỗi khi lưu file lên Drive: " + e.getMessage());
            }
    }

    private File uploadFileToDrive(Drive driveService, MultipartFile multipartFile) throws IOException {
        File fileMetadata = new File();
        fileMetadata.setName(multipartFile.getOriginalFilename());

        InputStreamContent mediaContent = new InputStreamContent(
                multipartFile.getContentType(),
                multipartFile.getInputStream());

        return driveService.files().create(fileMetadata, mediaContent)
                .setFields("id, name")
                .execute();
    }
}
