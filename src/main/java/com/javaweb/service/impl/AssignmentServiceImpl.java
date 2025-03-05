package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentEntity;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.LecturerEntity;
import com.javaweb.exception.ResourceNotFoundException;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.repository.AssignmentRepository;
import com.javaweb.repository.ClassRepository;
import com.javaweb.service.AssignmentService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AssignmentServiceImpl implements AssignmentService {

    @Autowired
    AssignmentRepository aRepository;
    @Autowired
    private ClassRepository classRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public AssignmentDTO createAssignment(AssignmentDTO assignmentDTO) {

        ClassEntity classEntity = classRepository.findById(
                assignmentDTO.getClassId())
                .orElseThrow(()
                        -> new ResourceNotFoundException
                        ("Lớp học không tồn tại với ID: " + assignmentDTO.getClassId()));

        AssignmentEntity assignmentEntity = modelMapper.map(assignmentDTO, AssignmentEntity.class);
        assignmentEntity.setClassEntity(classEntity);
        aRepository.save(assignmentEntity);
        return assignmentDTO;
    }
}
