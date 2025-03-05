package com.javaweb.service;

import com.javaweb.model.dto.SubmissionDTO;
import org.springframework.web.multipart.MultipartFile;

public interface SubmissionService {
    SubmissionDTO createSubmission(SubmissionDTO submission, MultipartFile file);
}
