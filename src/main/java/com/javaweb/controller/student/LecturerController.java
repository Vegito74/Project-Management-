package com.javaweb.controller.student;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ClassRequestService;
import com.javaweb.service.ClassService;
import com.javaweb.service.LecturerService;
import com.javaweb.service.impl.LecturerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LecturerController {

    @Autowired
    private ClassService classService;
    @Autowired
    private LecturerService lecturerService ;


    @Autowired
    private ClassRequestService classRequestService;
    @Autowired
    private StudenRepository studenRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/student/lecturer-list", method = RequestMethod.GET)
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) UserDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("student/lecture-list");
        mav.addObject("lecturers", lecturerService.getAllLecturers());
        UserEntity user = userRepository.findOneByUsername(SecurityUtils.getPrincipal().getUsername());
        StudentEntity student = studenRepository.getStudentEntityByUser(user);
        mav.addObject("studentRequest", classRequestService.getAllClassRequestsForStudent(student.getId()));
        return mav;
    }
}
