package com.javaweb.entity;

import com.javaweb.enums.Status;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "topic")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TopicEntity extends BaseEntity{
    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private StudentEntity student;

    @Column(name = "title", nullable = false, length = 255)
    private String title;

    @Column(name = "category", nullable = false, length = 255)
    private String category;

    @Column(name = "technologies", nullable = false, length = 255)
    private String technologies;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;
    @Column(name = "comment", columnDefinition = "TEXT")
    private String comment;
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;
}
