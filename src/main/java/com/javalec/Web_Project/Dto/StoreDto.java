package com.javalec.Web_Project.Dto;

public class StoreDto {
	String ID;
	String NAME;
	String TYPE;
	String DAE;
	String JOONG;
	String SO;
	String LAT;
	String LNG;
	
	public StoreDto() {
	}
	
	public StoreDto(String ID,String NAME, String TYPE,String DAE,String JOONG,String SO,
			String LAT,String LNG) {
		this.ID=ID;
		this.NAME=NAME;
		this.TYPE=TYPE;
		this.DAE=DAE;
		this.JOONG=JOONG;
		this.SO=SO;
		this.LAT=LAT;
		this.LNG=LNG;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getDAE() {
		return DAE;
	}

	public void setDAE(String dAE) {
		DAE = dAE;
	}

	public String getJOONG() {
		return JOONG;
	}

	public void setJOONG(String jOONG) {
		JOONG = jOONG;
	}

	public String getSO() {
		return SO;
	}

	public void setSO(String sO) {
		SO = sO;
	}

	public String getLAT() {
		return LAT;
	}

	public void setLAT(String lAT) {
		LAT = lAT;
	}

	public String getLNG() {
		return LNG;
	}

	public void setLNG(String lNG) {
		LNG = lNG;
	}
	
	
}
