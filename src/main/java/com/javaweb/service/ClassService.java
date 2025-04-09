package com.javaweb.service;


import com.javaweb.entity.ClassEntity;
import com.javaweb.model.dto.ClassDTO;
import com.javaweb.model.response.ClassResponse;

import java.util.List;


public interface ClassService {
    ClassDTO insertClass(ClassDTO classDTO);
    List<ClassResponse > getAllClasses(int lecturerId);
    void deleteClass(int id);


}

