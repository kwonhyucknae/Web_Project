package com.javalec.Web_Project.Dao;

import java.util.ArrayList;

import com.javalec.Web_Project.Dto.StoreDto;

public interface STRDao {
	public ArrayList<StoreDto> listDao(Object swlng,Object nelng,Object swlat,Object nelat);
	
}
