package com.javaweb.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ClassReportResponse;
import com.javaweb.repository.LecturerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ClassService;
import com.javaweb.service.impl.ClassServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

    @Autowired
    private ClassService classService;
    @Autowired
    private LecturerRepository lecturerRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/admin/home", method = RequestMethod.GET)
    public ModelAndView homePage() {

        ModelAndView mav = new ModelAndView("admin/home");
        UserEntity user = userRepository.findOneByUsername(SecurityUtils.getPrincipal().getUsername());
        LecturerEntity lecturerEntity = lecturerRepository.getLecturerEntityByUser(user);
        Integer lecturerId = lecturerEntity.getId();
        List<ClassReportResponse> reports = classService.getAllClassReports(lecturerEntity.getId());
        try {
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(reports);
            mav.addObject("classReports", json);
        } catch (Exception e) {
            mav.addObject("classReports", "[]");
        }
        mav.addObject("myProfile", lecturerRepository.findById(lecturerId));
        mav.addObject("studentCount", lecturerRepository.countStudentsByLecturerId(lecturerId));
        mav.addObject("studentComplete", 27);
        mav.addObject("worked", lecturerRepository.getTotalHandledWorkPercentage(lecturerId));
        return mav;
    }

    @RequestMapping(value = "/admin/my-profile", method = RequestMethod.GET)
    public ModelAndView profile(@ModelAttribute(SystemConstant.MODEL) UserDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/profile");
        return mav;
    }
}
