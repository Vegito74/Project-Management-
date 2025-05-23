package com.javaweb.repository;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.ClassRequestEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.enums.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassRequestRepository extends JpaRepository<ClassRequestEntity, Integer> {
    @Query(value = "SELECT * FROM class_request cr WHERE cr.class_id = :classId AND cr.status = :status", nativeQuery = true)
    List<ClassRequestEntity> findByClassEntityAndStatusNative(@Param("classId") Integer classId, @Param("status") String status);


    List<ClassRequestEntity> findByStudentAndStatus(StudentEntity studentEntity, Status status);
    List<ClassRequestEntity> findByStudent(StudentEntity studentEntity);

    int countAllByClassEntityAndStatus(ClassEntity classEntity, Status status);
    void deleteClassRequestEntityById(Integer id);

}
