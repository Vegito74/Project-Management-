package com.javaweb.repository;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudenRepository extends JpaRepository<StudentEntity, Integer>{
    long countByClassEntityId(Integer classId);
    List<StudentEntity> findAllByClassEntity(ClassEntity classEntity);
    int countStudentByClassEntityId(Integer classId);
}
