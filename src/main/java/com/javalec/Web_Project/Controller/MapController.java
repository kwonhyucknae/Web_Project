package com.javalec.Web_Project.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.Web_Project.Dao.IDao;
import com.javalec.Web_Project.Dao.STRDao;
import com.javalec.Web_Project.Dto.StoreDto;

@Controller
public class MapController {
	
	@Autowired
	private SqlSession sqlSession; 
	
	@RequestMapping("/Map")
	public String Map()
	{
		return "map";
	}
	
	@RequestMapping("/test")
	public String test(Model model)
	{
		IDao dao=sqlSession.getMapper(IDao.class);
		
		model.addAttribute("list",dao.listDao());
		
		return"test";
	}
	
	@RequestMapping("/Main")
	public String FirstPage()
	{
		return "main";
	}
	@RequestMapping("/Maintest")
	public String Maintest()
	{
		return "maintest";
	}
	
	@RequestMapping("/Maptest")
	public String Maptest(Model model)
	{
		IDao dao=sqlSession.getMapper(IDao.class);
		
		model.addAttribute("list",dao.listDao());
		
		return "maptest";
	}
	
	@RequestMapping("/scMaptest")
	public String ScMaptest(Model model)
	{
		IDao dao=sqlSession.getMapper(IDao.class);
		
		model.addAttribute("list",dao.listDao());
		
		return "mapsctest";
	}
	@RequestMapping("/mt")
	public String mt(Model model)
	{
		return "mt";
	}
	
	
	
	@ResponseBody
	@RequestMapping("/testajax")
	public HashMap<String,Object> Ajaxtest(@RequestParam HashMap<String,Object> param,Model model)
	{
		System.out.println(param);
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("KEY", "YES");
		model.addAttribute("test","test2");
		return hm;
	}
/*
	@ResponseBody
	@RequestMapping("/markermake")
	public HashMap<String,Object> markertest(@RequestParam HashMap<String,Object> param)
	{
		System.out.println(param);
		System.out.println(param.get("swlat"));
		HashMap<String,Object> hm=new HashMap<String,Object>();
		hm.put("KEY", "YES");
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("name","강호동");
		mv.setViewName("maptest");
		
		return hm;
	}
*/
	@ResponseBody
	@RequestMapping("/markermake")
	public HashMap<String,ArrayList<StoreDto>> markertest(@RequestParam HashMap<String,Object> param)
	{
		System.out.println(param);
		System.out.println(param.get("swlat"));
		HashMap<String,ArrayList<StoreDto>> hm=new HashMap<String,ArrayList<StoreDto>>();
		
		STRDao dao=sqlSession.getMapper(STRDao.class);
		hm.put("DATA",dao.listDao(param.get("swlng"),param.get("nelng"),param.get("swlat"),param.get("nelat")));
		
		System.out.println(dao.listDao(param.get("swlng"),param.get("nelng"),param.get("swlat"),param.get("nelat")));
		return hm;
	}
	
	
	public void MapMove(double test)
	{
		System.out.println(test);
	}
	
	@RequestMapping("/imgtest")
	public String ImageTest(HttpServletRequest request)
	{
		System.out.println("conpath="+request.getContextPath());
		System.out.println("uri="+request.getRequestURI());
		return "imagetest";
	}
	@RequestMapping("insert")
	public ModelAndView insert(CommandMap commandMap,HttpServletRequest request)throws Exception 
	{
		ModelAndView mv=new ModelAndView("redirect:/imgtest");
		
		return mv;
	}
	
	
	@RequestMapping("/uploadFile")
	public String uploadFile(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile
	                , Model model){
	    // String savePath = "D:/Projects/workspace/projectName/WebContent/folderName";
	    //String savePath = request.getRealPath("/resources/images"); // 파일이 저장될 프로젝트 안의 폴더 경로
	    // System.out.println(savePath);
	    // System.out.println(request.getSession().getServletContext().getRealPath("/"));
		String savePath = "D:/workspace/Web_Project/src/main/webapp/resources/images"; // 파일이 저장될 프로젝트 안의 폴더 경로
	    
		String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	     
	    String rename = onlyFileName+extension;// + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
	    String fullPath = savePath + "\\" + rename;
	     
	    if (!imgFile.isEmpty()) {
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	            model.addAttribute("resultMsg", "파일을 업로드 성공!");
	        } catch (Exception e) {
	            model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
	            e.printStackTrace();
	        }
	    } else {
	        model.addAttribute("resultMsg", "업로드할 파일을 선택해주시기 바랍니다.");
	    }
	     
	    return "imagetest";
	}
	 
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
}
