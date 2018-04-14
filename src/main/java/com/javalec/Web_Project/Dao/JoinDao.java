package com.javalec.Web_Project.Dao;

import java.util.ArrayList;

import com.javalec.Web_Project.Dto.JoinDto;

public interface JoinDao {

	public void insertJoin(String ID,String PW,String NAME,int SEX,String PHONE,String POSTCODE,String ROADADDR,String JIBUNADDR,String RESTADDR);
	public ArrayList<JoinDto> logincheck(String ID);
}
