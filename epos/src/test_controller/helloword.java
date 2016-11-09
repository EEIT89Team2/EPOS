//package com.mucfc.controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.validation.Valid;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import com.mucfc.model.User;
//
//@Controller
//public class UserControllers {
//
//	@RequestMapping(value = "/register", method = { RequestMethod.POST })
//	public String registerCheck(Model model, @Valid @ModelAttribute("user") User user, BindingResult result) {
//		if (result.hasErrors)
//			return "register";
//		else {
//			model.addAttribute("userName", user.getUserName);
//			return "forward:/success";
//		}
//	}
//
//	@ModelAttribute("user")
//	public User getUser
//	{ 
//		User user=new User; return user; 
//		}
//
//	@RequestMapping(value = "/register", method = {RequestMethod.GET}) 
//	public String register{
//		return "register";
//	}
//
//	@RequestMapping(value = "/success") 
//	public String success(HttpServletRequest request,HttpServletResponse response) { 
//		String str=(String)request.getAttribute("userName");
//		if(str==null||str.equals("")){ 
//			return "redirect:/register"; 
//			}
//		return "success";
//		}
//	
//}原文網址：https:// read01.com/aAea5.html