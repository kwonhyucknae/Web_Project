package com.javalec.Web_Project.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/boardlist")
	public String boardList()
	{
		return "board";
	}
}
