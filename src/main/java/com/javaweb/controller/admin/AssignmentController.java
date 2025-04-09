package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.AssignmentEnum;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.service.AssignmentService;
import com.javaweb.service.impl.AssignmentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AssignmentController {
    @Autowired
    private AssignmentService assignmentService;

    @RequestMapping(value = "/admin/assignment-list{id}", method = RequestMethod.GET)
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) AssignmentDTO model, @PathVariable("id") Integer id) {
        ModelAndView mav = new ModelAndView("admin/assignment");
        mav.addObject("assignmentList", assignmentService.getAllAssignments(id));
        mav.addObject("AssignmentType", AssignmentEnum.values());
        mav.addObject("classId", id);
        return mav;
    }
}
