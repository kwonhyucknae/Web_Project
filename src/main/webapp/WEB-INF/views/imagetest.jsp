<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

</head>
<body>
<form name="uploadForm" method="post" action="/Web_Project/uploadFile" enctype="multipart/form-data">
    <input type="file" name="imgFile">
    <input type="submit" value="µî·Ï">
    ${resultMsg} 
    <img src="resources\images\Apple_Wood.jpg">
</form>
</body>
</html>
