package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.ClassEntity;
import com.javaweb.entity.LecturerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.SemesterEnum;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ClassResponse;
import com.javaweb.repository.*;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ClassRequestService;
import com.javaweb.service.ClassService;
import com.javaweb.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ClassController {

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
    private TopicRepository topicRepository;
    @Autowired
    private AssignmentRepository assignmentRepository;
    @Autowired
    private ClassRequestRepository classRequestRepository;
    @Autowired
    private LecturerRepository lecturerRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/admin/class-list", method = RequestMethod.GET)
    public ModelAndView listClass(@ModelAttribute("classModel") ClassResponse model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/class-list");
        UserEntity user = userRepository.findOneByUsername(SecurityUtils.getPrincipal().getUsername());
        LecturerEntity lecturerEntity = lecturerRepository.getLecturerEntityByUser(user);
        mav.addObject("lecturer", lecturerEntity);
        mav.addObject("listClass", classService.getAllClasses(lecturerEntity.getId()));
        mav.addObject("semesterList", SemesterEnum.values());
        return mav;
    }
    @RequestMapping(value = "/admin/class{id}-manage", method = RequestMethod.GET)
    public ModelAndView classManage( @PathVariable("id") Integer id) {
        ClassEntity classEntity = classRepository.findById(id).get();

        ModelAndView mav = new ModelAndView("admin/class-manage");
        mav.addObject("countStudents", studenRepository.countStudentByClassEntityId(id));
        mav.addObject("countTopicsPending", topicRepository.countPendingTopicsByClassId(id));
        mav.addObject("countAssignments", assignmentRepository.countAllByClassEntity(classEntity));
        mav.addObject("countRequests", classRequestRepository.countAllByClassEntityAndStatus(classEntity, Status.Pending));
        mav.addObject("topicPending", topicRepository.getPendingTopicsByClassId(id));
        mav.addObject("classInfo", classEntity);
        mav.addObject("classStudents", studentService.getStudentClass(id));
        mav.addObject("classRequest", classRequestService.getAllClassRequestsForClass(id));
        return mav;
    }


}
