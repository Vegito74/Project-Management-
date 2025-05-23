package com.javaweb.repository;

import com.javaweb.entity.AssignmentEntity;
import com.javaweb.entity.ClassEntity;
import com.javaweb.model.response.AssignmentResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssignmentRepository extends JpaRepository<AssignmentEntity, Integer> {
    List<AssignmentEntity> findAllByClassEntity(ClassEntity classEntity);
    int countAllByClassEntity(ClassEntity classEntity);
    AssignmentEntity findById(int id);


}