package com.javalec.Web_Project.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.Web_Project.Dao.BoardDao;
import com.javalec.Web_Project.Dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession; 

	final int ROWSIZE=10; //한 페이지에 보일 게시물 수
	final int BLOCK=5;  //페이지 최대 개수 1~5/6~10
	
	@RequestMapping("/boardlist")
	public String boardList(Model model,HttpServletRequest request)
	{
		int pageNum=1;
		BoardDao bdo=sqlSession.getMapper(BoardDao.class);
		if(request.getParameter("pageNum")!=null)
		{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		int start=(pageNum*ROWSIZE)-(ROWSIZE-1);
		int end=(pageNum*ROWSIZE);
		
		int startPage=((pageNum-1)/BLOCK*BLOCK)+1;
		int endPage=((pageNum-1)/BLOCK*BLOCK)+BLOCK;
		int total=bdo.selectTotalcnt();
		int allPage=(int)Math.ceil(total/(double)ROWSIZE);
		
		if(endPage>allPage)
		{
			endPage=allPage;
		}
		System.out.println("startPage="+startPage);
		System.out.println("endPage="+endPage);
		System.out.println("allPage="+allPage);
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("BLOCK", BLOCK);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("list",bdo.selectList(start,end));
		System.out.println(request.getParameter("pageNum"));
		
		return "board";
	}
	
	@RequestMapping("/boardwrite")
	public String boardWrite()
	{
		
		return "boardwrite";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request,Model model,HttpSession session,@RequestParam("imgFile") MultipartFile imgFile)
	{
		String title=request.getParameter("TITLE");
		String contents=request.getParameter("CONTENTS");
		
		String savePath = "D:/workspace/Web_Project/src/main/webapp/resources/images"; // 파일이 저장될 프로젝트 안의 폴더 경로
		String rename="",fullPath="";
		if(imgFile.isEmpty())
	    {
	    	rename="None";
	    }
	    else
	    {
		String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	     
	    rename = onlyFileName+extension;// + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
	    fullPath = savePath + "\\" + rename;
	    }
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
	    
	    BoardDao bdo=sqlSession.getMapper(BoardDao.class);
	    bdo.insertWrite(title,(String)session.getAttribute("userId"), contents, getCurrentDayTime(), rename);
		
	    System.out.println(rename);
		return "board";
	}
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	
	@RequestMapping("/boardRead")
	public String BoardRead(HttpServletRequest request,Model model) throws Exception
	{
		BoardDao bdo=sqlSession.getMapper(BoardDao.class);
		BoardDto dto=bdo.selectRead(Integer.parseInt(request.getParameter("index")));
		int hit=dto.getHIT();
		hit++;

		bdo.updateHit(hit, Integer.parseInt(request.getParameter("index")));
		
		
		model.addAttribute("filename", dto.getFILENAME());
		model.addAttribute("readct",bdo.selectRead(Integer.parseInt(request.getParameter("index"))));
		return "boardread";
	}
	
	
	
	@RequestMapping("/imageDown")
	public void downloadFile(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		BoardDao bdo=sqlSession.getMapper(BoardDao.class);
		
		String FileName=bdo.selectFileName(Integer.parseInt(request.getParameter("index")));
		
		byte fileByte[]=FileUtils.readFileToByteArray(new File("D:/workspace/Web_Project/src/main/webapp/resources/images/"+FileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attaachment; fileName=\"" + URLEncoder.encode(FileName,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	
	@RequestMapping("/redat")
	public String reDat(HttpServletRequest request,HttpSession session)
	{
		BoardDao bdo=sqlSession.getMapper(BoardDao.class);
		System.out.println("1"+request.getParameter("comment"));
		System.out.println("2"+(String)session.getAttribute("userId"));
		System.out.println("3"+Integer.parseInt(request.getParameter("index")));
		
		bdo.insertRedat((String)session.getAttribute("userId"), request.getParameter("comment"), Integer.parseInt(request.getParameter("index")),getCurrentDayTime());
		
		
		return "redirect:boardRead?index="+request.getParameter("index");
	}
}
