package com.javaweb.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "student")
public class StudentEntity extends BaseEntity {


    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private UserEntity user;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "class_id", nullable = false, unique = true)
    private ClassEntity classEntity;

    @Column(name = "student_code", unique = true, nullable = false, length = 20)
    private String studentCode;

    @Column(name = "class_code", unique = true, nullable = false, length = 20)
    private String classCode;

    // Many-to-Many với Class
    @ManyToMany(mappedBy = "students")
    private List<ClassEntity> classes;



}
