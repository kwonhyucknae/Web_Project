package com.javalec.Web_Project.Dto;

public class BoardReDto {
String USERID;
String CONTENTS;
int BOARDNUM;
String YDM;

public BoardReDto() {
}
public BoardReDto(String USERID,String CONTENTS,int BOARDNUM,String YDM) {
	this.USERID=USERID;
	this.CONTENTS=CONTENTS;
	this.BOARDNUM=BOARDNUM;
	this.YDM=YDM;
}

public String getUSERID() {
	return USERID;
}
public void setUSERID(String uSERID) {
	USERID = uSERID;
}
public String getCONTENTS() {
	return CONTENTS;
}
public void setCONTENTS(String cONTENTS) {
	CONTENTS = cONTENTS;
}
public int getBOARDNUM() {
	return BOARDNUM;
}
public void setBOARDNUM(int bOARDNUM) {
	BOARDNUM = bOARDNUM;
}
public String getYDM() {
	return YDM;
}
public void setYDM(String yDM) {
	YDM = yDM;
}



}
