<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
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
html,body
{line-height:1.3;}
.th-1 {width:100px;}
.th-2{width:600px;}
.th-3{width:100px;}
.th-4{width:100px;}
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
dl
{overflow:hidden;}
dt{float:left;}
dd{
float:left;
disply:inline;
}
.scrollable input{border:none;}

</style>
<script>


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
      <li><a href="boardRead?index=${readct.NUM}">읽기</a></li>
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
      <div class="scrollable">
           <form id="frm" action="write" enctype="multipart/form-data" method="post">
           <div class="board_rd_top">
           <dl>
           <dt>글쓴이</dt>
           <dd><span>&nbsp;${readct.NAME}</span></dd>
           </dl>
           <dl>
           <dt>날짜</dt>
           <dd><span>${readct.YMD}</span></dd>
           <dd>조회수</dd>
           <dd>${readct.HIT}</dd>
           </dl>
           </div>

        	<table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${readct.TITLE}" readonly ></input></td>
                </tr>
               
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS" readonly>${readct.CONTENTS }</textarea>
                    </td>
                </tr>
               
            </tbody>
        </table>
        <input type="hidden" name="imgFile"><br/>
        <%
        if(!request.getAttribute("filename").equals("None"))
        {
        	%><a href="imageDown?index=${readct.NUM}" name="file">${readct.FILENAME }</a><%
        }
        %>
        

          <br/>
          <br/>   
        </form>
        <div id="comments">
        <h2>Comments</h2>
        <ul>
        	<c:forEach items="${redat}" var="rdt">
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="resources/images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">${rdt.USERID} </a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup>${rdt.YDM }</time>
              </header>
              <div class="comcont">
                <p>${rdt.CONTENTS }</p>
              </div>
            </article>
          </li>
          </c:forEach>
        </ul>
        <h2>Write A Comment</h2>
        <form action="redat" method="post">
          <div class="block clear">
            <label for="comment">Your Comment</label>
            <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
          </div>
          <div>
          	<input type="hidden" name="index" value=${readct.NUM}>
            <input type="submit" name="submit" value="Submit Form">
            &nbsp;
            <input type="reset" name="reset" value="Reset Form">
          </div>
        </form>
      </div>
      
      <form action="modify">
      	 <input type="hidden" name="index" value=${readct.NUM}>
          <% 
          if(session.getAttribute("userId")!=null)
          if(session.getAttribute("userId").equals(request.getAttribute("writer")))
          {%>
         <input type="submit" class="btn" value="수정하기">
          <% }%>
          
        <a href="boardlist" class="btn" id="list" >목록으로</a>
	  </form>

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