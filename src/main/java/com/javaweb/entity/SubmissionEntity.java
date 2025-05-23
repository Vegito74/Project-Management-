package com.javaweb.entity;

import com.javaweb.enums.SubmissionStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "submission")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SubmissionEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "assignment_id", nullable = false)
    private AssignmentEntity assignment;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private StudentEntity student;

    @Column(name = "file_url", nullable = false, length = 255)
    private String fileUrl;

    @Column(name = "file_name", nullable = false, length = 255)
    private String fileName;
    @Column(name = "file_type", nullable = false, length = 255)
    private String file_type;
    @Column(name = "submitted_date", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date submittedDate;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private SubmissionStatus status;

    @OneToOne(mappedBy = "submission", cascade = CascadeType.ALL)
    private GradeEntity grade;
}
