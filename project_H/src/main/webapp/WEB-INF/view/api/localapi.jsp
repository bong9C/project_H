<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Consultation center location</title>
    <style>
        body {
            margin: 0px;
        }

        #map {
            width: 100vw;
            height: 100vh;
            min-height: 500px;
        }
    </style>
</head>
<body>
    <label for="searchKeyword">Place: </label>
    <input type="text" id="searchKeyword" placeholder="Please enter a location">
    <button onclick="searchPlaces()">Search</button>
    
    <div id="map" style="width:500px;height:400px;"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=163531f559b3b1b15070b9932b6799e2"></script>
    <script>
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
        };

        var map = new kakao.maps.Map(container, options);

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();
        
        // 키워드 검색 함수
        function searchPlaces() {
            var searchKeyword = document.getElementById('searchKeyword').value;

            // 사용자가 입력한 검색어로 장소 검색 실행
            ps.keywordSearch(searchKeyword, placesSearchCB);
        }

        // 키워드 검색 완료 시 호출되는 콜백함수
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해 LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();

                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
        }

        // 지도에 마커를 표시하는 함수
        function displayMarker(place) {
            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x)
            });

            // 마커에 클릭 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                infowindow.open(map, marker);
            });
        }
    </script>
</body>
</html>
