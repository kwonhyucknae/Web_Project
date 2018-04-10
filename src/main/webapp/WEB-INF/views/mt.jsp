<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>�̵� �̺�Ʈ ����ϱ�</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<p><em>������ ������ �ּ���!</em></p> 
<p id="result"></p>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be5ed530255e3b048aa8a99d0da7c5de"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// ���콺 �巡�׷� ���� �̵��� �Ϸ�Ǿ��� �� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
daum.maps.event.addListener(map, 'dragend', function() {        
    
    // ���� �߽���ǥ�� ���ɴϴ� 
    var latlng = map.getCenter(); 
    
    var message = '����� ���� �߽���ǥ�� ' + latlng.getLat() + ' �̰�, ';
    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
    
    var resultDiv = document.getElementById('result');  
    resultDiv.innerHTML = message;
    
});
</script>
</body>
</html>