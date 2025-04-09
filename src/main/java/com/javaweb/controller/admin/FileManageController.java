package com.javaweb.controller.admin;


import com.javaweb.enums.SemesterEnum;
import com.javaweb.model.response.ClassResponse;
import com.javaweb.security.utils.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FileManageController {
    @RequestMapping(value = "/admin/file-manage", method = RequestMethod.GET)
    public ModelAndView listClass(@ModelAttribute("classModel") ClassResponse model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/file-manager");
        return mav;
    }
}
