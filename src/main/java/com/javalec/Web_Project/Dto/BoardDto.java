package com.javalec.Web_Project.Dto;

public class BoardDto {
	int NUM;
	String TITLE;
	String NAME;
	String CONTENTS;
	int HIT;
	String YMD;
	String FILENAME;
	
	public BoardDto() {
	}
	public BoardDto(int NUM,String TITLE,String NAME ,String CONTENTS,int HIT,String YMD,String FILENAME) {
		this.NUM=NUM;
		this.TITLE=TITLE;
		this.NAME=NAME;
		this.CONTENTS=CONTENTS;
		this.HIT=HIT;
		this.YMD=YMD;
		this.FILENAME=FILENAME;
	}
	
	public int getNUM() {
		return NUM;
	}
	public void setNUM(int num) {
		NUM = num;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENTS() {
		return CONTENTS;
	}
	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
	}
	public int getHIT() {
		return HIT;
	}
	public void setHIT(int hIT) {
		HIT = hIT;
	}
	public String getYMD() {
		return YMD;
	}
	public void setYMD(String yMD) {
		YMD = yMD;
	}
	public String getFILENAME() {
		return FILENAME;
	}
	public void setFILENAME(String fILENAME) {
		FILENAME = fILENAME;
	}
	
	
}
