package com.javaweb.repository;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.TopicEntity;
import com.javaweb.enums.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicRepository extends JpaRepository<TopicEntity, Integer> {
    TopicEntity getTopicEntityByStudent(StudentEntity student);
    TopicEntity getTopicEntityByStudentAndStatus(StudentEntity student, Status status);
    List<TopicEntity> findByStudentId(int studentId);
    List<TopicEntity> getTopicEntitiesByStudentAndStatusOrStudentAndStatus(StudentEntity student, Status status, StudentEntity student1, Status status1);
    List<TopicEntity> getTopicEntitiesByStatus(Status status);


    //Lấy số lượng đơn chờ duyệt trong 1 lớp
    @Query(value = "SELECT COUNT(*) FROM topic t JOIN student s ON t.student_id = s.id WHERE s.class_id = :classId AND t.status = 'Pending'", nativeQuery = true)
    int countPendingTopicsByClassId(@Param("classId") int classId);

    //Đơn của lớp có status là Pending - Chờ duyệt
    @Query("SELECT t FROM TopicEntity t WHERE t.student.classEntity.id = :classId AND t.status = 'Pending'")
    List<TopicEntity> getPendingTopicsByClassId(@Param("classId") int classId);


    @Query(value = "SELECT FLOOR(" +
            "(SELECT COUNT(DISTINCT t.student_id) " +
            " FROM topic t " +
            " JOIN student s1 ON t.student_id = s1.id " +
            " WHERE t.status = 'Accepted' AND s1.class_id = :classId) * 100.0 / " +
            "(SELECT COUNT(*) FROM student s2 WHERE s2.class_id = :classId))",
            nativeQuery = true)
    Integer getAcceptedTopicPercentageByClassId(@Param("classId") Integer classId);
}
