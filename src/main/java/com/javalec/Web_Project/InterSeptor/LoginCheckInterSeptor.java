package com.javalec.Web_Project.InterSeptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.javalec.Web_Project.Dto.JoinDto;

public class LoginCheckInterSeptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		HttpSession session=request.getSession();
		String userId=(String)session.getAttribute("userId");
		
		if(userId==null||userId.trim().equals(""))
		{
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
			
		}
		
		return true;
	}
	
}
