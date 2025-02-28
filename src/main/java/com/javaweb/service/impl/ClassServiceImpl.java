package com.javaweb.service.impl;

import com.javaweb.converter.ClassConverter;
import com.javaweb.entity.ClassEntity;
import com.javaweb.model.dto.ClassDTO;
import com.javaweb.repository.ClassRepository;
import com.javaweb.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private ClassConverter classConverter;

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



}
