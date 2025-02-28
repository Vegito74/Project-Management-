package com.javaweb.repository;

import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.StudentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LecturerRepository extends JpaRepository<LecturerEntity, Long> {

}
