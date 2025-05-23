package com.javaweb.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "class")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassEntity  extends BaseEntity{

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "lecturer_id", nullable = false)
    private LecturerEntity lecturer;


    @Column(name = "class_name", nullable = false, length = 100)
    private String className;

    @Column(name = "semester", nullable = false, length = 10)
    private String semester;

    @Column(name = "status")
    private String status;

    @OneToMany(mappedBy = "classEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<AssignmentEntity> assignmentEntities;

    @OneToMany(mappedBy = "classEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<StudentEntity> studentEntities;

    // Many-to-Many với Student thông qua bảng trung gian class_student
    @ManyToMany
    @JoinTable(
            name = "class_student",
            joinColumns = @JoinColumn(name = "class_id"),
            inverseJoinColumns = @JoinColumn(name = "student_id")
    )
    private List<StudentEntity> students;
}

