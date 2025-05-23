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

    SubmissionEntity findByAssignmentIdAndStudentId(Integer assignmentId, Integer studentId);

    @Query("SELECT COUNT(s) FROM SubmissionEntity s " +
            "WHERE s.student.id = :studentId " +
            "AND s.assignment.classEntity.id = :classId " +
            "AND s.status = 'Submitted'")
    int countSubmittedAssignmentsByStudentAndClass(@Param("studentId") int studentId,
                                                    @Param("classId") int classId);

    @Query(value = "SELECT FLOOR(COUNT(*) * 100.0 / " +
            "  (SELECT COUNT(DISTINCT cs.student_id) " +
            "   FROM class_student cs WHERE cs.class_id = :classId)) " +
            "FROM ( " +
            "  SELECT cs.student_id " +
            "  FROM class_student cs " +
            "  JOIN assignment a ON cs.class_id = a.class_id " +
            "  LEFT JOIN submission s ON s.assignment_id = a.id AND s.student_id = cs.student_id " +
            "  WHERE cs.class_id = :classId " +
            "  GROUP BY cs.student_id " +
            "  HAVING COUNT(DISTINCT s.id) = (SELECT COUNT(*) FROM assignment WHERE class_id = :classId) " +
            ") AS completed_students",
            nativeQuery = true)
    Integer getCompletedAssignmentPercentageByClassId(@Param("classId") Integer classId);


    @Query(value = "SELECT CASE WHEN COUNT(*) = 0 THEN 0 " +
            "ELSE FLOOR(COUNT(CASE WHEN g.score >= 5 THEN 1 END) * 100.0 / COUNT(*)) END " +
            "FROM submission s " +
            "JOIN assignment a ON s.assignment_id = a.id " +
            "LEFT JOIN grade g ON g.submission_id = s.id " +
            "WHERE a.class_id = :classId",
            nativeQuery = true)
    Integer getPassPercentageByClassId(@Param("classId") Integer classId);
}
