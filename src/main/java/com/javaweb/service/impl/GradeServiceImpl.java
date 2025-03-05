package com.javaweb.service.impl;


import com.javaweb.entity.GradeEntity;
import com.javaweb.model.dto.GradeDTO;
import com.javaweb.repository.GradeRepository;
import com.javaweb.repository.SubmissionRepository;
import com.javaweb.service.GradeService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
public class GradeServiceImpl implements GradeService {

    private final ModelMapper modelMapper;
    private final SubmissionRepository submissionRepository;
    private final GradeRepository gradeRepository;

    public GradeServiceImpl(ModelMapper modelMapper, SubmissionRepository submissionRepository, GradeRepository gradeRepository) {
        this.modelMapper = modelMapper;
        this.submissionRepository = submissionRepository;
        this.gradeRepository = gradeRepository;
    }

    @Override
    public GradeDTO assessSubmission(GradeDTO gradeDTO) {
        GradeEntity gradeEntity = modelMapper.map(gradeDTO, GradeEntity.class);
        gradeEntity.setSubmission(submissionRepository.getOne(gradeDTO.getSubmissionId()));
        gradeRepository.save(gradeEntity);
        return modelMapper.map(gradeEntity, GradeDTO.class);
    }
}
