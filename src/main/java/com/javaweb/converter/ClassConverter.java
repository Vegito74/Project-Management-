package com.javaweb.converter;

import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.ClassDTO;
import com.javaweb.model.dto.UserDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ClassConverter {
    @Autowired
    private ModelMapper modelMapper;

    public ClassDTO convertToDto (ClassEntity entity){
        ClassDTO result = modelMapper.map(entity, ClassDTO.class);
        return result;
    }

    public ClassEntity convertToEntity (ClassDTO dto){
        ClassEntity result = modelMapper.map(dto, ClassEntity.class);
        return result;
    }
}
