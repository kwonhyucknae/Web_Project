<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Template Name: Corklow
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html>
<head>
<title>Corklow | Pages | Full Width</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<style>
.th-1 {
width:100px;}
.th-2{
width:600px;}
.th-3{
width:100px;}
.th-4{
width:100px;}
.th-5{
width:70px;}
.button-8{
  width:100px;
  height:50px;
  border:2px solid #34495e;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  //margin:0 0 40px 50px;
}
.button-8 a{
  font-family:arial;
  font-size:16px;
  color:#fff;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}
.eff-8{
  width:140px;
  height:50px;
  border:70px solid #34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
  box-sizing:border-box;
}
.button-8:hover .eff-8{
  border:0px solid #34495e;
}
.button-8:hover a{
  color:#34495e;
}

}

</style>
<script>
function pageNumber()
{
		
}

</script>

</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="fl_left">
      <ul class="nospace">
        <li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
        <li><i class="fa fa-envelope-o"></i> info@domain.com</li>
      </ul>
    </div>
    <div class="fl_right">
      <ul class="nospace">
        <li><a href="Main"><i class="fa fa-lg fa-home"></i></a></li>
  		<li>
        <%if(request.getAttribute("loginck").equals("login"))
        	{
        	%>
        	<a href="login">Login</a>
        	<% 
        	}
        else
        {%>
        	<a href="logout">Logout</a>
        <% 
        }  	
        %>
        </li>
        <li><a href="join">Register</a></li>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="Main">오늘 뭐먹지?</a></h1>
      <p>매장을 손쉽게 찾아보세요</p>
    </div>
    <!-- ################################################################################################ -->
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li><a href="Main">Home</a></li>
        <li><a href="scMaptest">매장찾기</a></li>
        <li><a href="boardlist">게시판</a></li>
      </ul>
    </nav>
    <!-- ################################################################################################ -->
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('resources/images/demo/backgrounds/01.png');">
  <div id="breadcrumb" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="Main">Home</a></li>
      <li><a href="boardlist">게시판</a></li>

    </ul>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      <!-- ################################################################################################ -->
     <h1>자유게시판</h1>
      <div class="scrollable">
        <table>
          <thead>
            <tr>
              <th class="th-1">번호</th>
              <th class="th-2">제목</th>
              <th class="th-3">글쓴이</th>
              <th class="th-5">조회수</th>
              <th class="th-4">날짜</th>
              
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list}" var="dto" varStatus="status">
            <tr>
              <td>${dto.NUM} </td>
              <td><a href="boardRead?index=${dto.NUM}">${dto.TITLE}</a></td>
              <td>${dto.NAME}</td>
			  <td>${dto.HIT}</td>
			  <td>${dto.YMD}</td>
            </tr>
            </c:forEach>
            
          </tbody>
        </table>
     <div class="button-8">
    <div class="eff-8"></div>
    <a href="#"> 글쓰기 </a>
  	</div>
      </div>
      <div class="page" align="center">
      <%
      		if((Integer)request.getAttribute("pageNum")> (Integer)request.getAttribute("BLOCK"))
      		{
      			%>
      			<a href="boardlist?pageNum=1">◀◀</a>
      			<a href="boardlist?pageNum=${startPage}">◀</a>
      			<% 
      		}
      %>
      
      <%
      		for(int i=(Integer)request.getAttribute("startPage");i<=(Integer)request.getAttribute("endPage");i++)
      		{
      			if(i==(Integer)request.getAttribute("pageNum"))
      			{
      				%><u><b><%=i %></b></u>
      				<%
      			}
      			else
      			{
      				%><a href="boardlist?pageNum=<%=i%>"><%=i %></a>
      				<% 
      			}
      		}
      		if((Integer)request.getAttribute("endPage")<(Integer)request.getAttribute("allPage"))
      		{
      			%> 
      			<a href="boardlist?pageNum=${endPage+1}">▶</a>
      			<a href="boardlist?pageNum=${allPage}">▶▶</a>
      			<% 
      		}
      		
      
      %>
      
      </div>

      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <h3 class="heading">Corklow</h3>
    <ul class="nospace inline pushright uppercase">
      <li><a href="#"><i class="fa fa-lg fa-home"></i></a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
      <li><a href="#">Login</a></li>
      <li><a href="#">Register</a></li>
    </ul>
    <ul class="faico clear">
      <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
      <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
      <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
      <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
      <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
      <li><a class="faicon-vk" href="#"><i class="fa fa-vk"></i></a></li>
    </ul>
    <div id="copyright">
      <p>Copyright &copy; 2016 - All Rights Reserved - <a href="#">Domain Name</a></p>
      <p class="font-xs">Template by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="resources/layout/scripts/jquery.min.js"></script>
<script src="resources/layout/scripts/jquery.backtotop.js"></script>
<script src="resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>