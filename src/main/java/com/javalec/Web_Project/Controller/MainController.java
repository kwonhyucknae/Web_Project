package com.javalec.Web_Project.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/Main")
	public String FirstPage(HttpSession session,Model model)
	{
		String loginck="";
		if(session.getAttribute("userId")==null)
		{
			loginck="null";
			loginck="login";	
		}
		else
		{
			loginck="logout";
		}
			
		model.addAttribute("loginck", loginck);
		System.out.println(loginck);
		return "main";
	}

	
}
