package com.javalec.Web_Project.Dto;

public class JoinDto {

	String ID;
	String PW;
	String NAME;
	int SEX;
	String PHONE;
	String POSTCODE;
	String ROADADDR;
	String JIBUNADDR;
	String RESTADDR;
	public JoinDto() {
		
	}
	public JoinDto(String ID,String PW,String NAME,int SEX,String PHONE,String POSTCODE,String ROADADDR,String JIBUNADDR,String RESTADDR) {
		this.ID=ID;
		this.PW=PW;
		this.NAME=NAME;
		this.SEX=SEX;
		this.PHONE=PHONE;
		this.POSTCODE=POSTCODE;
		this.ROADADDR=ROADADDR;
		this.JIBUNADDR=JIBUNADDR;
		this.RESTADDR=RESTADDR;
			
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getSEX() {
		return SEX;
	}
	public void setSEX(int sEX) {
		SEX = sEX;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getPOSTCODE() {
		return POSTCODE;
	}
	public void setPOSTCODE(String pOSTCODE) {
		POSTCODE = pOSTCODE;
	}
	public String getROADADDR() {
		return ROADADDR;
	}
	public void setROADADDR(String rOADADDR) {
		ROADADDR = rOADADDR;
	}
	public String getJIBUNADDR() {
		return JIBUNADDR;
	}
	public void setJIBUNADDR(String jIBUNADDR) {
		JIBUNADDR = jIBUNADDR;
	}
	public String getRESTADDR() {
		return RESTADDR;
	}
	public void setRESTADDR(String rESTADDR) {
		RESTADDR = rESTADDR;
	}
	
}
