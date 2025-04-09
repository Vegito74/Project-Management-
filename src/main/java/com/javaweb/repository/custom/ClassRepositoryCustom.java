package com.javaweb.repository.custom;

import com.javaweb.entity.ClassEntity;
import com.javaweb.model.response.ClassResponse;

import java.util.List;

public interface ClassRepositoryCustom {
    List<ClassResponse> classResponseList(int lecturerId);
}
