package com.javalec.Web_Project.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.Web_Project.Dao.JoinDao;
import com.javalec.Web_Project.Dto.JoinDto;

@Controller
public class LoginController {

	@Autowired
	private SqlSession sqlSession; 
	Logger log= Logger.getLogger(this.getClass());
	
	
	@RequestMapping("/join")
	public String Join(HttpServletRequest request,Model model)
	{
		
		return "joinmember";
	}
	@RequestMapping("/joininsert")
	public String JoinInsert(HttpServletRequest request,Model model)
	{
		String ID=request.getParameter("wUserID");
		String PW=request.getParameter("wUserPW");
		String NAME=request.getParameter("wUserName");
		int SEX=Integer.parseInt(request.getParameter("wUserGender"));
		String PHONE=request.getParameter("wUserCellPhone");
		String POSTCODE=request.getParameter("wPostCode");
		String ROADADDR=request.getParameter("wRoadAddress");
		String JIBUNADDR=request.getParameter("wJibunAddress");
		String RESTADDR=request.getParameter("wRestAddress");
		
		JoinDao join=sqlSession.getMapper(JoinDao.class);
		join.insertJoin(ID, PW, NAME, SEX, PHONE, POSTCODE, ROADADDR, JIBUNADDR, RESTADDR);
		
		return "main";
	}
	
	@RequestMapping("/login")
	public String Login()
	{
		return "login";
	}
	
	@RequestMapping("/logincheck")
	public String LoginCheck(HttpServletRequest request,HttpSession session,Model model)
	{
		String returnURL="", msg="";
		JoinDao logincheck=sqlSession.getMapper(JoinDao.class);
		ArrayList<JoinDto> logininfo=logincheck.logincheck(request.getParameter("user"));
		//System.out.println(logininfo.get(0).getPW());

		if(logininfo.isEmpty())
		{
			msg="아이디가 존재하지 않습니다.";
			returnURL="login";
		}
		else
		{
			if(request.getParameter("pass").equals(logininfo.get(0).getPW()))
			{
				session.setAttribute("userId", request.getParameter("user"));
				returnURL="main";
			}
			else
			{
				msg="비밀번호가 틀립니다.";
				returnURL="login";
			}
		
		}
		
		//System.out.println(session.getAttribute("userId"));
		model.addAttribute("msg", msg);
		return returnURL;
	}
}
