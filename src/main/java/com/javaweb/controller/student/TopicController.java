package com.javaweb.controller.student;

import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.dto.TopicDTO;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.TopicRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TopicController {

    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private StudenRepository studenRepository;

    @GetMapping(value="/student/topic-registration")
    public ModelAndView topicRegistration(){
        ModelAndView mav = new ModelAndView("student/topic-registration");
        UserEntity user = userRepository.getOne(SecurityUtils.getPrincipal().getId());
        StudentEntity student = studenRepository.getStudentEntityByUser(user);
        mav.addObject("topicRegisterList", topicRepository.findByStudentId(student.getId()));
        return mav;
    }
}
