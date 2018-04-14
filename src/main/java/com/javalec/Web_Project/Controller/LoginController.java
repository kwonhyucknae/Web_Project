package com.javalec.Web_Project.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/join")
	public String Join()
	{
		return "joinmember";
	}
	@RequestMapping("/login")
	public String Login()
	{
		return "login";
	}
}
