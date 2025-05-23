package com.javaweb.controller.student;

import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/student/home", method = RequestMethod.GET)
	public ModelAndView homePage(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("student/onboarding");
		return mav;
	}

    @GetMapping(value="student/onboarding")
    public ModelAndView introducceBuiding(){
        ModelAndView mav = new ModelAndView("student/onboarding");
        return mav;
    }



    @GetMapping(value="/file")
    public ModelAndView contact(){
        ModelAndView mav = new ModelAndView("/student/file-manager");
        return mav;
    }

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/login");
	}
}
