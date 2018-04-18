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
<!-- JAVASCRIPTS -->
<script src="resources/layout/scripts/jquery.min.js"></script>
<script src="resources/layout/scripts/jquery.backtotop.js"></script>
<script src="resources/layout/scripts/jquery.mobilemenu.js"></script>

<title>Corklow</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
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
      <h1><a href="Main">���� ������?</a></h1>
      <p>������ �ս��� ã�ƺ�����</p>
    </div>
    <!-- ################################################################################################ -->
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="Main">Home</a></li>
        <li><a href="scMaptest">����ã��</a></li>
        <li><a href="boardlist">�Խ���</a></li>
      </ul>
    </nav>
    <!-- ################################################################################################ -->
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('resources/images/del01.jpg');">
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <article>
      <p class="heading">�� �ֺ��� ������ ã�ƺ�����!</p>
      <h2 class="heading"><span class="block">����</span> ������?</h2>
      <footer><a href="#">Malesuada fames &raquo;</a></footer>
    </article>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <div id="services" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="table">
      <div class="table-row"> 
        <!-- ################################################################################################ -->
        <div class="table-cell">
          <article><a href="#"><i class="fa fa-key"></i></a>
            <h6 class="heading">Primis in faucibus</h6>
            <p>Massa finibus at integer dictum sem arcu eu venenatis purus porta eu aliquam&hellip;</p>
            <footer><a href="#">Read More &raquo;</a></footer>
          </article>
        </div>
        <div class="table-cell">
          <article><a href="#"><i class="fa fa-lastfm"></i></a>
            <h6 class="heading">Etiam ac porttitor</h6>
            <p>In venenatis ipsum ac tincidunt dolor duis accumsan massa velit eget luctus&hellip;</p>
            <footer><a href="#">Read More &raquo;</a></footer>
          </article>
        </div>
        <div class="table-cell">
          <article><a href="#"><i class="fa fa-angellist"></i></a>
            <h6 class="heading">Metus et suscipit</h6>
            <p>Lorem facilisis vel aliquam semper vestibulum iaculis etiam vel convallis porta&hellip;</p>
            <footer><a href="#">Read More &raquo;</a></footer>
          </article>
        </div>
        <!-- ################################################################################################ -->
      </div>
    </div>
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
    <div class="center btmspace-80">
      <h3 class="heading">Nisl massa aliquet ac sagittis</h3>
      <p class="nospace">Pulvinar egestas sed nibh mauris commodo sed dolor id viverra nullam ornare augue at.</p>
    </div>
    <ul class="nospace group cta">
      <li class="one_third first">
        <article><a href="#"><i class="fa fa-line-chart"></i></a>
          <h6 class="heading">At enim vehicula</h6>
          <p>Turpis tristique ac tincidunt et placerat rutrum nisi proin quis magna integer&hellip;</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article><a href="#"><i class="fa fa-audio-description"></i></a>
          <h6 class="heading">Vehicula eu lacinia</h6>
          <p>Purus nulla sed sodales enim nunc semper quam leo donec eu pharetra turpis&hellip;</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article><a href="#"><i class="fa fa-balance-scale"></i></a>
          <h6 class="heading">Augue vivamus sem</h6>
          <p>Id dapibus tellus ut iaculis tempus mi at ornare dui vestibulum vitae&hellip;</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
    </ul>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('resources/images/demo/backgrounds/02.png');">
  <article class="hoc container clear center"> 
    <!-- ################################################################################################ -->
    <h3 class="heading">Nulla eget nunc consequat</h3>
    <p class="btmspace-50">Pretium leo at auctor tellus proin volutpat aliquet lorem vitae volutpat quam</p>
    <footer><a class="btn medium" href="#">More Information &raquo;</a></footer>
    <!-- ################################################################################################ -->
  </article>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="center btmspace-50">
      <h3 class="font-x2 nospace">Ornare ut suspendisse</h3>
      <p class="nospace">Tincidunt placerat dui id feugiat duis eu vehicula ipsum id feugiat elit maecenas</p>
    </div>
    <div class="group">
      <article class="one_third first"><a href="#"><img class="btmspace-30" src="resources/images/demo/320x220.png" alt=""></a>
        <h4 class="nospace btmspace-10 font-x1 uppercase">Tincidunt eget nisi</h4>
        <ul class="nospace btmspace-10 group font-xs">
          <li class="fl_left">
            <time datetime="2045-04-06">6<sup>th</sup> April 2045</time>
          </li>
          <li class="fl_right">by <a href="#">Admin</a></li>
        </ul>
        <hr>
        <p>Auctor cursus feugiat sed scelerisque id odio non scelerisque sed ac est rhoncus sodales ante dictum lacinia&hellip;</p>
        <p class="nospace"><a href="#">Read More &raquo;</a></p>
      </article>
      <article class="one_third"><a href="#"><img class="btmspace-30" src="resources/images/demo/320x220.png" alt=""></a>
        <h4 class="nospace btmspace-10 font-x1 uppercase">Lacinia etiam ornare</h4>
        <ul class="nospace btmspace-10 group font-xs">
          <li class="fl_left">
            <time datetime="2045-04-05">5<sup>th</sup> April 2045</time>
          </li>
          <li class="fl_right">by <a href="#">Admin</a></li>
        </ul>
        <hr>
        <p>Morbi tempor ac nibh eu imperdiet diam maecenas in facilisis arcu nec pulvinar risus etiam convallis lacus&hellip;</p>
        <p class="nospace"><a href="#">Read More &raquo;</a></p>
      </article>
      <article class="one_third"><a href="#"><img class="btmspace-30" src="resources/images/demo/320x220.png" alt=""></a>
        <h4 class="nospace btmspace-10 font-x1 uppercase">Elementum vestibulum</h4>
        <ul class="nospace btmspace-10 group font-xs">
          <li class="fl_left">
            <time datetime="2045-04-04">4<sup>th</sup> April 2045</time>
          </li>
          <li class="fl_right">by <a href="#">Admin</a></li>
        </ul>
        <hr>
        <p>Est lectus lacinia enim quis egestas leo urna id ex integer ipsum purus sagittis at eleifend et vestibulum&hellip;</p>
        <p class="nospace"><a href="#">Read More &raquo;</a></p>
      </article>
    </div>
    <!-- ################################################################################################ -->
  </section>
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
</body>
</html>