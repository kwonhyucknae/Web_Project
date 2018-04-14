package com.javalec.Web_Project.InterSeptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.javalec.Web_Project.Dto.JoinDto;

public class LoginCheckInterSeptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		HttpSession session=request.getSession(false);
		
		if(session==null)
		{
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		JoinDto member=(JoinDto)session.getAttribute("member"); 
		
		if(member==null)
		{
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
			
		}
		return true;
	}
	
}
