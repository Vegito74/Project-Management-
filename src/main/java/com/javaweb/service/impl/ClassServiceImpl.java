package com.javaweb.service.impl;

import com.javaweb.converter.ClassConverter;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.ClassDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ClassReportResponse;
import com.javaweb.model.response.ClassResponse;
import com.javaweb.repository.*;
import com.javaweb.repository.custom.ClassRepositoryCustom;
import com.javaweb.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassRepositoryCustom classRepositoryCustom;

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private ClassConverter classConverter;
    @Autowired
    private LecturerRepository lecturerRepository;

    @Autowired
    private ClassRequestRepository classRequestRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private SubmissionRepository submissionRepository;
    @Override  // Thêm class mới
    public ClassDTO insertClass(ClassDTO classDTO) {
        if (classDTO == null) {
            throw new IllegalArgumentException("ClassDTO không có giá trị!");
        }

        try {
            ClassEntity classEntity = classConverter.convertToEntity(classDTO);
            classEntity = classRepository.save(classEntity);
            return Optional.ofNullable(classConverter.convertToDto(classEntity))
                    .orElseThrow(() -> new RuntimeException("Lỗi khi chuyển đổi entity sang DTO"));
        } catch (DataAccessException e) {
            throw new RuntimeException("Lỗi truy cập dữ liệu: " + e.getMessage(), e);
        }
    }

    @Override
    public List<ClassResponse> getAllClasses(int lecturerId) {
        return classRepositoryCustom.classResponseList(lecturerId);
    }

    @Override
    public void deleteClass(int id) {
        classRepository.deleteById(id);
    }

    @Override
    public List<ClassReportResponse> getAllClassReports(int lecturerId) {
        List<ClassReportResponse> results = new ArrayList<>();
        LecturerEntity lecturerEntity = lecturerRepository.findById(lecturerId);
        List<ClassEntity> classEntities = classRepository.findAllByLecturer(lecturerEntity);
        for (ClassEntity classEntity : classEntities) {
            ClassReportResponse clResp = new ClassReportResponse();
            List<Integer> chartSeries = new ArrayList<>();
            clResp.setId(classEntity.getId());
            clResp.setName(classEntity.getClassName());
            clResp.setStudentCount(classEntity.getStudentEntities().size());
            clResp.setTaskCount(classEntity.getAssignmentEntities().size());
            clResp.setJoinRequest( classRequestRepository.countAllByClassEntityAndStatus(classEntity, Status.Pending));
            clResp.setPendingTopic(topicRepository.countPendingTopicsByClassId(classEntity.getId()));

            Integer percentage1 = topicRepository.getAcceptedTopicPercentageByClassId(classEntity.getId());
            Integer result1 =  percentage1 != null ? percentage1 : 0;
            chartSeries.add(result1);
            Integer percentage2 = submissionRepository.getCompletedAssignmentPercentageByClassId(classEntity.getId());
            Integer result2 = percentage2 != null ? percentage2 : 0;
            chartSeries.add(result2);
            Integer passPercentage3 = submissionRepository.getPassPercentageByClassId(classEntity.getId());
            int result3 = passPercentage3 != null ? passPercentage3 : 0;
            chartSeries.add(result3);

            clResp.setChartSeries(chartSeries);
            results.add(clResp);
        }
        return results;
    }


}
