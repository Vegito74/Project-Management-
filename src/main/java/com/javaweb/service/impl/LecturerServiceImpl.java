package com.javaweb.service.impl;


import com.javaweb.entity.LecturerEntity;
import com.javaweb.model.response.LecturerResponse;
import com.javaweb.repository.ClassRepository;
import com.javaweb.repository.LecturerRepository;
import com.javaweb.repository.custom.ClassRepositoryCustom;
import com.javaweb.service.LecturerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class LecturerServiceImpl implements LecturerService {

    @Autowired
    private ModelMapper modelMapper;


    @Autowired
    private LecturerRepository lecturerRepository;
    @Autowired
    private ClassRepositoryCustom classRepository;

    @Override
    public List<LecturerResponse> getAllLecturers() {
        List<LecturerEntity> lecturerEntities = lecturerRepository.findAll();
        List<LecturerResponse> results = new ArrayList<>();

        for (LecturerEntity lecturerEntity : lecturerEntities) {
            LecturerResponse lecturerResponse = modelMapper.map(lecturerEntity, LecturerResponse.class);
            lecturerResponse.setRole(lecturerEntity.getUser().getRole());
            lecturerResponse.setUsername(lecturerEntity.getUser().getUsername());
            lecturerResponse.setFullName(lecturerEntity.getUser().getFullName());
            lecturerResponse.setEmail(lecturerEntity.getUser().getEmail());
            lecturerResponse.setClasses(classRepository.classResponseList(lecturerEntity.getId()));
            results.add(lecturerResponse);

        }


        return results;
    }
}
