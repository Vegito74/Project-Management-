package com.javaweb.repository;

import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudenRepository extends JpaRepository<StudentEntity, Integer>{
}
