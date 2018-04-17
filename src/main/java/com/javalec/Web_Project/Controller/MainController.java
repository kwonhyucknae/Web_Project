package com.javalec.Web_Project.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/Main")
	public String FirstPage(HttpSession session)
	{
		String loginck="";
		if(session.getAttribute("userId").equals("null"))
		{
			loginck="login";
		}
		
		
		System.out.println(session.getAttribute("userId"));
		return "main";
	}

	
}
