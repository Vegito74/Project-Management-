package com.javaweb.controller.admin;

import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.TopicDTO;
import com.javaweb.model.dto.TopicSuggestedDTO;
import com.javaweb.repository.*;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.TopicService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


@Controller
public class TopicApprovalController {
    @Autowired
    private  TopicRepository topicRepository;

    @Autowired
    private TopicService topicService;
    @Autowired
    private  StudenRepository studenRepository;
    @Autowired
    private ClassRepository classRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private LecturerRepository lecturerRepository;

    @RequestMapping(value = "/admin/topic_approval-{id}", method = RequestMethod.GET)
    public ModelAndView topicApproval( @PathVariable("id") Integer id) {
        ModelAndView mav = new ModelAndView("admin/topic-approval");
        StudentEntity student = studenRepository.findStudentEntityById(id);
        mav.addObject("student", student);
        mav.addObject("topic", topicRepository.getTopicEntityByStudentAndStatus(student, Status.Pending));
        mav.addObject("topicsApproved", topicService.listTopicsApproval());
        return mav;
    }

    @RequestMapping(value = "/admin/topic_manager", method = RequestMethod.GET)
    public ModelAndView topicManager(@ModelAttribute("Model") TopicDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/topic-manager");
        UserEntity user = userRepository.findById(SecurityUtils.getPrincipal().getId()).get();
        LecturerEntity lecturerEntity = lecturerRepository.getLecturerEntityByUser(user);
        mav.addObject("classList", classRepository.findAllByLecturer(lecturerEntity));
        mav.addObject("topicsApproved", topicService.listTopicsApproval());


        return mav;
    }

}
