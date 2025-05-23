package com.javaweb.model.response;

import com.javaweb.entity.BaseEntity;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.TopicEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Data;

import java.util.List;


@Data
public class StudentClassResponse extends AbstractDTO {


    private UserEntity user;
    private TopicEntity topicEntitie;
    private ClassEntity classEntity;
    private String studentCode;
    private String classCode;
    private List<ClassEntity> classes;
    private String complete;
}
