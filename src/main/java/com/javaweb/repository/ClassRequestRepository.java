package com.javaweb.repository;

import com.javaweb.entity.ClassRequestEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassRequestRepository extends JpaRepository<ClassRequestEntity, Integer> {

}
