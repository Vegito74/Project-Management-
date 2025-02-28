package com.javaweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "grade")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GradeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne
    @JoinColumn(name = "submission_id", nullable = false)
    private SubmissionEntity submission;

    @Column(name = "score", nullable = false, precision = 5, scale = 2)
    private Double score;

    @Column(name = "graded_date", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date gradedDate;

    @Column(name = "comments", columnDefinition = "TEXT")
    private String comments;
}
