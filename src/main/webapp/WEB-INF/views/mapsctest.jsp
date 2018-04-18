<%@page import="com.javalec.Web_Project.Controller.MapController"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be5ed530255e3b048aa8a99d0da7c5de"></script>
	<script>
		
	var map;
	
	function makemap()
	{	
		var lat,lon,bounds,swLatLng,neLatLng;
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����
	    };
		// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
		map = new daum.maps.Map(mapContainer, mapOption); 
		// HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		if (navigator.geolocation) {
		    
		    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        	lat = position.coords.latitude, // ����
		            lon = position.coords.longitude; // �浵
		            map.setCenter(new daum.maps.LatLng(lat,lon));
		        	
		            bounds = map.getBounds();
		        	swLatLng=bounds.getSouthWest();
		        	neLatLng=bounds.getNorthEast();
		            $.ajax({
		        		type:"post",
		        		url:"markermake",
		        		data:{"swlat":swLatLng.getLat(),"swlng":swLatLng.getLng(),"nelat":neLatLng.getLat(),"nelng":neLatLng.getLng()},
		        		//data:{"swlat":37.3,"swlng":127.15,"nelat":37.7,"nelng":127.7},
		        		
		        		dataType:"json",
		        		success:function(data)
		        		{
		        			var dataList=data['DATA'];
		        			console.log(dataList);
		        			for(var i in dataList)
		        			{
		        				var positionslatlng=new daum.maps.LatLng(dataList[i].lng,dataList[i].lat);
		        				
		        				var marker=new daum.maps.Marker({
		        					map:map,
		        					position:positionslatlng,
		        					title:dataList[i].name
		        				});
		        			}
							//
		        			var list_html="";
		        			list_html+="<li>"+dataList[0].lng+"</li>";
		        			$('#list_test').html(list_html);
		        			
		        			//alert("����"+dataList[0]);
		        		},
		        		error:function(request,status,error)
		        		{
		        			alert("code:"+request.status+"\n"+"error:"+error);
		        		}
		        	});

		            
		      });
		    
		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

			lat=33.450701;
			lon=126.570667;
		}
		// ���콺 �巡�׷� ���� �̵��� �Ϸ�Ǿ��� �� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'dragend', function() {        
		    
		    // ���� �߽���ǥ�� ���ɴϴ� 
	    	
		    var latlng = map.getCenter(); 
		   
		    bounds = map.getBounds();
        	swLatLng=bounds.getSouthWest();
        	neLatLng=bounds.getNorthEast();
            $.ajax({
        		type:"post",
        		url:"markermake",
        		data:{"swlat":swLatLng.getLat(),"swlng":swLatLng.getLng(),"nelat":neLatLng.getLat(),"nelng":neLatLng.getLng()},
        		//data:{"swlat":37.3,"swlng":127.15,"nelat":37.7,"nelng":127.7},
        		
        		dataType:"json",
        		success:function(data)
        		{
        			var dataList=data['DATA'];
        			console.log(dataList);
        			for(var i in dataList)
        			{
        				var positionslatlng=new daum.maps.LatLng(dataList[i].lng,dataList[i].lat);
        				
        				var marker=new daum.maps.Marker({
        					map:map,
        					position:positionslatlng,
        					title:dataList[i].name
        				});
        			}
					//
        			var list_html="";
        			list_html+="<li>"+dataList[0].lng+"</li>";
        			$('#list_test').html(list_html);
        			
        			//alert("����"+dataList[0]);
        		},
        		error:function(request,status,error)
        		{
        			alert("code:"+request.status+"\n"+"error:"+error);
        		}
        	});
		    
		});
	
		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// ������ Ȯ�� �Ǵ� ��ҵǸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'zoom_changed', function() {        

				bounds = map.getBounds();
	        	swLatLng=bounds.getSouthWest();
	        	neLatLng=bounds.getNorthEast();
	            $.ajax({
	        		type:"post",
	        		url:"markermake",
	        		data:{"swlat":swLatLng.getLat(),"swlng":swLatLng.getLng(),"nelat":neLatLng.getLat(),"nelng":neLatLng.getLng()},
	        		//data:{"swlat":37.3,"swlng":127.15,"nelat":37.7,"nelng":127.7},
	        		
	        		dataType:"json",
	        		success:function(data)
	        		{
	        			var dataList=data['DATA'];
	        			var list_html="";
	        			console.log(dataList);
	        			for(var i in dataList)
	        			{
	        				var positionslatlng=new daum.maps.LatLng(dataList[i].lng,dataList[i].lat);
	        				
	        				var marker=new daum.maps.Marker({
	        					map:map,
	        					position:positionslatlng,
	        					title:dataList[i].name
	        				});
	        				list_html+="<div style=\"width:600px; height:100px; box-shadow: 1px 1px 3px #a5a5a5;margin: 0 8px 8px;\"><h2>"+dataList[i].name+
		        			"</h2><p>"+dataList[i].dae+
		        			"</p><p>"+dataList[i].joong+
		        			"</p></div>";
	        			}
						
	        			$('#list_test2').html(list_html);
	        			
	        			//alert("����"+dataList[0]);
	        		},
	        		error:function(request,status,error)
	        		{
	        			alert("code:"+request.status+"\n"+"error:"+error);
	        		}
	        	});
		    
		});
		
	}

	</script>

<title>Corklow | Pages | Sidebar Right</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<style>

.sdb_holder
{

align:right;
height:650px;
overflow-y:scroll;
overflow-x:hidden;
}

</style>
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
        <li><a href="#"><i class="fa fa-lg fa-home"></i></a></li>
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
      <h1><a href="../index.html">Corklow</a></h1>
      <p>Congue pulvinar velit</p>
    </div>
    <!-- ################################################################################################ -->
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li><a href="../index.html">Home</a></li>
        <li class="active"><a class="drop" href="#">Pages</a>
          <ul>
            <li><a href="gallery.html">Gallery</a></li>
            <li><a href="full-width.html">Full Width</a></li>
            <li><a href="sidebar-left.html">Sidebar Left</a></li>
            <li class="active"><a href="sidebar-right.html">Sidebar Right</a></li>
            <li><a href="basic-grid.html">Basic Grid</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">Dropdown</a>
          <ul>
            <li><a href="#">Level 2</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
            <li><a href="#">Level 2</a></li>
          </ul>
        </li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
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
      <li><a href="#">Home</a></li>
      <li><a href="#">Lorem</a></li>
      <li><a href="#">Ipsum</a></li>
      <li><a href="#">Dolor</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hocd container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter first"> 
      <!-- ################################################################################################ -->

<!-- ������ ǥ���� div �Դϴ� -->
	<div id="map" style="width:100%;height:700px;"></div>

	<script type="text/javascript">
	makemap();
	</script>

      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter"> 
      <!-- ################################################################################################ -->
      <h6>Lorem ipsum dolor</h6>
      <nav class="sdb_holder">
        <p id="rs"></p>
 		<ul id="list_test">
 		</ul>
        <div id="list_test2">
        </div>
        
        <c:forEach items="${list}" var="dto">
		<div style="width:600px; height:100px; box-shadow: 1px 1px 3px #a5a5a5;margin: 0 8px 8px;">
		<img src="resources/images/del01.jpg" style= "width:150px; height:100px;" align="left"/>
		 ${dto.NAME}
		 <p>zsd</p>
		 <p>test</p>
		
		</div>
		</c:forEach>
		
      </nav>
      
      
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