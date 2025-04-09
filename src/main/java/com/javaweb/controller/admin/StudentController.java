package com.javaweb.controller.admin;


import com.javaweb.constant.SystemConstant;
import com.javaweb.model.dto.UserDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller(value = "studentControllerOfAdmin")
public class StudentController {
    @RequestMapping(value = "/admin/student-list", method = RequestMethod.GET)
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) UserDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/student-list");
//		DisplayTagUtils.of(request, model);
//		List<UserDTO> news = userService.getUsers(model.getSearchValue(), PageRequest.of(model.getPage() - 1, model.getMaxPageItems()));
//		model.setListResult(news);
//		model.setTotalItems(userService.countTotalItems());
//		mav.addObject(SystemConstant.MODEL, model);
//		initMessageResponse(mav, request);
        return mav;
    }
}
