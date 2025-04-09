package com.javaweb.repository;

import com.javaweb.entity.SubmissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SubmissionRepository extends JpaRepository<SubmissionEntity, Integer> {
    // Đếm số lượng sinh viên đã nộp bài cho một assignment
    @Query("SELECT COUNT(DISTINCT s.student.id) " +
            "FROM SubmissionEntity s " +
            "WHERE s.assignment.id = :assignmentId AND s.status = 'Submitted'")
    long countStudentsWhoSubmittedAssignment(@Param("assignmentId") Integer assignmentId);



    @Query("SELECT COUNT(s) FROM SubmissionEntity s " +
            "WHERE s.student.id = :studentId " +
            "AND s.assignment.classEntity.id = :classId " +
            "AND s.status = 'Submitted'")
    int countSubmittedAssignmentsByStudentAndClass(@Param("studentId") int studentId,
                                                    @Param("classId") int classId);
}
