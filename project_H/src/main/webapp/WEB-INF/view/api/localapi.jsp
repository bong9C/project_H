<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Kakao ���� �����ϱ�</title>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=163531f559b3b1b15070b9932b6799e2"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	
		
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);

		// �Ʒ� �ڵ�� ���� ���� ��Ŀ�� �����ϴ� �ڵ��Դϴ�
		// marker.setMap(null);    
		
	</script>
</body>
</html>