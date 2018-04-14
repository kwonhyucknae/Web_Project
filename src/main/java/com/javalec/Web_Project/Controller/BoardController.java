package com.javalec.Web_Project.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/boardlist")
	public String boardList()
	{
		return "board";
	}
	@RequestMapping("/boardwrite")
	public String boardWrite()
	{
		return "boardwrite";
	}
	@RequestMapping("/write")
	public String write(HttpServletRequest request,Model model)
	{
		String test=request.getParameter("TITLE");
		System.out.println(test);
		return "board";
	}
}
