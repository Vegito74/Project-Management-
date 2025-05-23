package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentEntity;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.SubmissionEntity;
import com.javaweb.exception.ResourceNotFoundException;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.response.AssignmentResponse;
import com.javaweb.model.response.StudentAssignmentResponse;
import com.javaweb.model.response.StudentSubmissionForAssignmentResponse;
import com.javaweb.repository.*;
import com.javaweb.service.AssignmentService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
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
    @Autowired
    private GradeRepository gradeRepository;

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
    public AssignmentResponse getAssignmentById(int id) {
       AssignmentEntity assignmentEntity = assignmentRepository.getOne(id);
        AssignmentResponse assignmentResponse = modelMapper.map(assignmentEntity, AssignmentResponse.class);
        //Tính tỉ lệ nộp bài
        long totalStudents = studentRepository.countByClassEntityId(assignmentEntity.getClassEntity().getId());
        long submittedStudents = submissionRepository.countStudentsWhoSubmittedAssignment(assignmentEntity.getId());
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
        return assignmentResponse;
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

    @Override
    public List<StudentAssignmentResponse> getAllStudentAssignments(Integer studentId) {
        StudentEntity student =  studentRepository.getOne(studentId);
        List<AssignmentEntity> assignment= assignmentRepository.findAllByClassEntity(student.getClassEntity());
        List<StudentAssignmentResponse> result = new ArrayList<>();
        long totalStudents = studentRepository.countByClassEntityId(student.getClassEntity().getId());
        for (AssignmentEntity assignmentEntity : assignment) {
            long submittedStudents = submissionRepository.countStudentsWhoSubmittedAssignment(assignmentEntity.getId());
            StudentAssignmentResponse assignmentResponse = modelMapper.map(assignmentEntity, StudentAssignmentResponse.class);
            //Tính tỉ lệ nộp bài
            if(totalStudents !=0){
                double percent = (double) submittedStudents / totalStudents * 100;
                long roundedPercent = Math.round(percent);  // làm tròn phần trăm
                assignmentResponse.setPercent(roundedPercent +"%");
                assignmentResponse.setSubmittedCount(submittedStudents+ "/" + totalStudents);
            }
            else {
                assignmentResponse.setPercent(0 +"%");
                assignmentResponse.setSubmittedCount(null);
            }
            SubmissionEntity submissionEntity = submissionRepository.findByAssignmentIdAndStudentId(assignmentEntity.getId(), studentId);
            assignmentResponse.setSubmissionEntity( submissionEntity);
            if (submissionEntity != null) {

            }
            result.add(assignmentResponse);
        }
        return result;
    }
    @Override
    public List<StudentSubmissionForAssignmentResponse> getAllStudentSubmissionForAssignment(Integer assignmentId) {
        AssignmentEntity assignmentEntity = assignmentRepository.findById(assignmentId).get();
        List<StudentSubmissionForAssignmentResponse> results = new ArrayList<>();
        List<StudentEntity> studentEntities = assignmentEntity.getClassEntity().getStudentEntities();
        for (StudentEntity studentEntity : studentEntities) {
            StudentSubmissionForAssignmentResponse studentSubmissionForAssignmentResponse = modelMapper.map(studentEntity, StudentSubmissionForAssignmentResponse.class);
            SubmissionEntity submissionEntity = submissionRepository.findByAssignmentIdAndStudentId(assignmentEntity.getId(), studentEntity.getId());
            studentSubmissionForAssignmentResponse.setSubmissionEntity(submissionEntity);
            studentSubmissionForAssignmentResponse.setGradeEntity(gradeRepository.findGradeEntitiesBySubmission(submissionEntity));
            results.add(studentSubmissionForAssignmentResponse);
        }
        return results;
    }
}
