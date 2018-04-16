package com.javalec.Web_Project.Dao;

import java.util.ArrayList;

import com.javalec.Web_Project.Dto.BoardDto;

public interface BoardDao {

	public void insertWrite(String TITLE,String NAME,String CONTENTS,String YMD,String FILENAME);
	public ArrayList<BoardDto> selectList(int start,int end);
	public String selectFileName(int index);
	public int selectTotalcnt();
}
