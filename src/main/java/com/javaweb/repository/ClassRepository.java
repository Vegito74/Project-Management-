package com.javaweb.repository;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.LecturerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassRepository extends JpaRepository<ClassEntity, Integer> {
    ClassEntity findById(int id);
    List<ClassEntity> findAllByLecturer(LecturerEntity lecturerEntity);


}
