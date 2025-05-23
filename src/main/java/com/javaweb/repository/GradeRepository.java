package com.javaweb.repository;

import com.javaweb.entity.GradeEntity;
import com.javaweb.entity.SubmissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GradeRepository extends JpaRepository<GradeEntity, Integer> {
    GradeEntity findGradeEntitiesBySubmission(SubmissionEntity submissionEntity);
}
