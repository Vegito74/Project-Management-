package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentEntity;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.LecturerEntity;
import com.javaweb.exception.ResourceNotFoundException;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.response.AssignmentResponse;
import com.javaweb.repository.AssignmentRepository;
import com.javaweb.repository.ClassRepository;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.SubmissionRepository;
import com.javaweb.repository.custom.impl.AssignmentRepositoryImpl;
import com.javaweb.service.AssignmentService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AssignmentServiceImpl implements AssignmentService {

    @Autowired
    AssignmentRepository aRepository;
    @Autowired
    private ClassRepository classRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private AssignmentRepository assignmentRepository;

    @Autowired
    private StudenRepository studentRepository;

    @Autowired
    private SubmissionRepository submissionRepository;

    @Override
    public void createAssignment(AssignmentDTO assignmentDTO) {

        ClassEntity classEntity = classRepository.findById(
                assignmentDTO.getClassId())
                .orElseThrow(()
                        -> new ResourceNotFoundException
                        ("Lớp học không tồn tại với ID: " + assignmentDTO.getClassId()));

        AssignmentEntity assignmentEntity = modelMapper.map(assignmentDTO, AssignmentEntity.class);

        assignmentEntity.setClassEntity(classEntity);
        aRepository.save(assignmentEntity);

    }

    @Override
    public List<AssignmentResponse> getAllAssignments(Integer classId) {
        ClassEntity classEntity = classRepository.findById(classId).get();
        List<AssignmentEntity> assignment= assignmentRepository.findAllByClassEntity(classEntity);
        List<AssignmentResponse> result = new ArrayList<>();
        long totalStudents = studentRepository.countByClassEntityId(classId);
        for (AssignmentEntity assignmentEntity : assignment) {
            long submittedStudents = submissionRepository.countStudentsWhoSubmittedAssignment(assignmentEntity.getId());
            AssignmentResponse assignmentResponse = modelMapper.map(assignmentEntity, AssignmentResponse.class);
            //Tính tỉ lệ nộp bài
            if(totalStudents !=0){
                double percent = (double) submittedStudents / totalStudents * 100;
                long roundedPercent = Math.round(percent); // làm tròn phần trăm
                assignmentResponse.setPercent(roundedPercent +"%");
                assignmentResponse.setSubmittedCount(submittedStudents+ "/" + totalStudents);
            }
            else {
                assignmentResponse.setPercent(0 +"%");
                assignmentResponse.setSubmittedCount(submittedStudents+ "/" + 1);
            }

            result.add(assignmentResponse);
        }
        return result;
    }

    @Override
    public void deleteAssignment(Integer assignmentId) {
        assignmentRepository.deleteById(assignmentId);
    }
}
