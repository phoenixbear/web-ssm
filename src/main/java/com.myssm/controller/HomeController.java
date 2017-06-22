package com.myssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/home")
public class HomeController {
	@RequestMapping("/home_top")
	public ModelAndView topUI(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home/top");
		return modelAndView;
	}
	@RequestMapping("/home_left")
	public ModelAndView leftUI(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home/left");
		return modelAndView;
	}
	@RequestMapping("/home_bottom")
	public ModelAndView bottomUI(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home/bottom");
		return modelAndView;
	}
	@RequestMapping("/home_right")
	public ModelAndView rightUI(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home/right");
		return modelAndView;
	}
}
