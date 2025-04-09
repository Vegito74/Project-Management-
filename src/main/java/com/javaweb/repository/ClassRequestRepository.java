package com.javaweb.repository;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.enums.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassRequestRepository extends JpaRepository<ClassRequestEntity, Integer> {
    List<ClassRequestEntity> findByClassEntityAndStatus(ClassEntity classEntity, Status status);
}
