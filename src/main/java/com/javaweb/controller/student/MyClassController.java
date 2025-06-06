package com.javaweb.controller.student;

import com.javaweb.entity.StudentEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.SemesterEnum;
import com.javaweb.model.response.ClassResponse;

import com.javaweb.repository.AssignmentRepository;
import com.javaweb.repository.ClassRepository;
import com.javaweb.repository.StudenRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.AssignmentService;
import com.javaweb.service.ClassRequestService;
import com.javaweb.service.ClassService;
import com.javaweb.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MyClassController {

    @Autowired
    private ClassService classService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClassRepository classRepository;
    @Autowired
    private StudenRepository studenRepository;

    @Autowired
    private ClassRequestService classRequestService;
    @Autowired
    private AssignmentRepository assignmentRepository;
    @Autowired
    private AssignmentService assignmentService;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/student/my-class", method = RequestMethod.GET)
    public ModelAndView listClass(@ModelAttribute("classModel") ClassResponse model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("student/my-class");
        UserEntity user = userRepository.getOne(SecurityUtils.getPrincipal().getId());
        StudentEntity student = studenRepository.getStudentEntityByUser(user);
        mav.addObject("myAssignments",assignmentService.getAllStudentAssignments(student.getId()));
        mav.addObject("myProfile", student);
        mav.addObject("semesterList", SemesterEnum.values());
        return mav;
    }

//    @RequestMapping(value = "/admin/class{id}-manage", method = RequestMethod.GET)
//    public ModelAndView classManage( @PathVariable("id") Integer id) {
//
//        ModelAndView mav = new ModelAndView("admin/class-manage");
//        mav.addObject("countStudents", studenRepository.countStudentByClassEntityId(id));
//        mav.addObject("classInfo", classRepository.findById(id));
//        mav.addObject("classStudents", studentService.getStudentClass(id));
//        mav.addObject("classRequest", classRequestService.getAllClassRequestsForClass(id));
//        return mav;
//    }


}
