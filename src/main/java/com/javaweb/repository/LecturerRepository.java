package com.javaweb.repository;

import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LecturerRepository extends JpaRepository<LecturerEntity, Integer> {
    // Đếm tổng số sinh viên trong các lớp của giảng viên
    @Query(value = "SELECT COUNT(s.id) " +
            "FROM student s " +
            "JOIN class c ON s.class_id = c.id " +
            "WHERE c.lecturer_id = :lecturerId",
            nativeQuery = true)
    long countStudentsByLecturerId(@Param("lecturerId") Integer lecturerId);


    @Query(value = "SELECT ROUND( " +
            "  ( " +
            "    (SELECT COUNT(*) FROM class_request cr " +
            "      JOIN class c ON cr.class_id = c.id " +
            "      WHERE cr.status != 'Pending' AND c.lecturer_id = :lecturerId) + " +
            "    (SELECT COUNT(*) FROM topic t " +
            "      JOIN student s ON t.student_id = s.id " +
            "      JOIN class_student cs ON cs.student_id = s.id " +
            "      JOIN class c2 ON cs.class_id = c2.id " +
            "      WHERE t.status != 'Pending' AND c2.lecturer_id = :lecturerId) " +
            "  ) * 100.0 / " +
            "  ( " +
            "    (SELECT COUNT(*) FROM class_request cr2 " +
            "      JOIN class c3 ON cr2.class_id = c3.id " +
            "      WHERE c3.lecturer_id = :lecturerId) + " +
            "    (SELECT COUNT(*) FROM topic t2 " +
            "      JOIN student s2 ON t2.student_id = s2.id " +
            "      JOIN class_student cs2 ON cs2.student_id = s2.id " +
            "      JOIN class c4 ON cs2.class_id = c4.id " +
            "      WHERE c4.lecturer_id = :lecturerId) " +
            "  ), 0 " +
            ")", nativeQuery = true)
    Integer getTotalHandledWorkPercentage(@Param("lecturerId") Integer lecturerId);

    LecturerEntity getLecturerEntityByUser(UserEntity user);
    LecturerEntity findById(int id);
}
