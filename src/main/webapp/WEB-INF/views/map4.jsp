<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주변 동물병원 마커 표시하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238e7e3447ac847cdba75075c7d23f2e&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="./css/map.css">
</head>
<body>

<div id="map" style="width:700px;height:700px;"></div>

<script>
	var mapContainer = document.getElementById('map');
	var mapOption = { 
		// 지도의 기본 중심좌표
	    center: new kakao.maps.LatLng(37.476513, 126.880105),
	    // 지도의 확대 레벨
	    level: 6
	};
	
	// 지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var customOverlay = new kakao.maps.CustomOverlay({});
	
	// geolocation으로 접속한 현재위치 가져오기
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude,
	            lon = position.coords.longitude;
	
	        // 현재 접속 위치기준 반경 3km범위 설정,표시하기 
	        var locPosition = new kakao.maps.LatLng(lat, lon);
	        var circle = new kakao.maps.Circle({
	            center: locPosition,
	            radius: 3000,
	            strokeWeight: 1,
	            strokeColor: '#AED6F1',
	            strokeOpacity: 0.7,
	            fillColor: '#AED6F1',
	            fillOpacity: 0.3
	        });
	
	        circle.setMap(map);
	        searchPlaces(lat, lon);
	    });
	} else {
	    var locPosition = new kakao.maps.LatLng(37.476513, 126.880105);
	
	    var circle = new kakao.maps.Circle({
	        center: locPosition,
	        radius: 3000,
	        strokeWeight: 1,
	        strokeColor: '#AED6F1',
	        strokeOpacity: 0.7,
	        fillColor: '#AED6F1',
	        fillOpacity: 0.3
	    });
	
	    circle.setMap(map);
	    searchPlaces(locPosition.getLat(), locPosition.getLng());
	}
	
	// 검색된 키워드의 주소를 마커 표시
	function displayMarker(locPosition, placeName, placeAddress ) {
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: locPosition
	    });
	
	    // 마커 클릭 시 동물병원의 주소와 상세내역 화면으로 이동
	    kakao.maps.event.addListener(marker, 'click', function() {
	        var content =                     
	        	'<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <div class="title">' + 
	            				placeName + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	            '        </div>' + 
	            '        <div class="body">' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis">'+ placeAddress +'</div>' + 
	            '                <div><a href="./detail.do?address='+placeAddress+'" class="link">병원 상세보기</a></div>' + 
	            '                <div><button>예약하기</button></div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';
	
	        customOverlay.setContent(content);
	        customOverlay.setPosition(locPosition);
	        customOverlay.setMap(map);
	        
	        console.log("마커에 표시된 주소:",placeAddress);
	    });
	}
	
	// 키워드 검색, 현재 위지기준
	function searchPlaces(lat, lon) {
	    var ps = new kakao.maps.services.Places();
	
	    ps.keywordSearch('동물병원', function(data, status, pagination) {
	        if (status === kakao.maps.services.Status.OK) {
	            var bounds = new kakao.maps.LatLngBounds();
	
	            for (var i=0; i<data.length; i++) {
	                var placePosition = new kakao.maps.LatLng(data[i].y, data[i].x);
	                var placeName = data[i].place_name;
	                var placeAddress = data[i].address_name; // 장소의 주소 정보
	                displayMarker(placePosition, placeName, placeAddress);
	                bounds.extend(placePosition);
	            }
	
	            map.setBounds(bounds);
	        }
	    }, {
	        location: new kakao.maps.LatLng(lat, lon)
	    });
	}
	
	function closeOverlay() {
	    customOverlay.setMap(null);     
	}
</script>


</body>
</html>