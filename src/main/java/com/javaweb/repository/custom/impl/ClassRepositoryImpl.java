package com.javaweb.repository.custom.impl;

import com.javaweb.entity.ClassEntity;
import com.javaweb.model.response.ClassResponse;
import com.javaweb.repository.custom.ClassRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Primary
@Repository
public class ClassRepositoryImpl implements ClassRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<ClassResponse> classResponseList(int lecturerId) {
        String sql = "SELECT " +
                "    c.id AS class_id, " +
                "    c.lecturer_id, " +
                "    c.class_name, " +
                "    c.status, " +
                "    c.semester, " +
                "    COUNT(DISTINCT s.id) AS student_count, " +
                "    COUNT(DISTINCT a.id) AS assignment_count " +
                " FROM class c " +
                " LEFT JOIN student s ON c.id = s.class_id " +
                " LEFT JOIN assignment a ON c.id = a.class_id " +
                " WHERE c.lecturer_id = ? " +
                " GROUP BY c.id, c.lecturer_id, c.class_name, c.status, c.semester";
        Query query = entityManager.createNativeQuery(sql);
        query.setParameter(1, lecturerId); //
        List<Object[]> results = query.getResultList();

        List<ClassResponse> classResponses = new ArrayList<>();
        for (Object[] row : results) {
            classResponses.add(new ClassResponse(
                    ((Number) row[0]).intValue(),  // class_id
                    ((Number) row[1]).intValue(),  // lecturer_id
                    (String) row[2],               // class_name
                    (String) row[3],               // status
                    (String) row[4],               // semester
                    ((Number) row[5]).intValue(),  // student_count
                    ((Number) row[6]).intValue()   // assignment_count
            ));
        }
        return classResponses;
    }

}
