<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 동물병원 호출하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238e7e3447ac847cdba75075c7d23f2e&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>

	<div>
	    <label for="selectRegion">지역 선택:</label>
	    <select id="selectRegion">
	        <option >--선택--</option>
	        <option value="종로구">종로구</option>
	        <option value="중구">중구</option>
	        <option value="용산구">용산구</option>
	        <option value="성동구">성동구</option>
	        <option value="광진구">광진구</option>
	        <option value="동대문구">동대문구</option>
	        <option value="중랑구">중랑구</option>
	        <option value="성북구">성북구</option>
	        <option value="도봉구">도봉구</option>
	        <option value="노원구">노원구</option>
	        <option value="은평구">은평구</option>
	        <option value="서대문구">서대문구</option>
	        <option value="마포구">마포구</option>
	        <option value="양천구">양천구</option>
	        <option value="강서구">강서구</option>
	        <option value="구로구">구로구</option>
	        <option value="금천구">금천구</option>
	        <option value="영등포구">영등포구</option>
	        <option value="동작구">동작구</option>
	        <option value="관악구">관악구</option>
	        <option value="서초구">서초구</option>
	        <option value="강남구">강남구</option>
	        <option value="송파구">송파구</option>
	        <option value="강동구">강동구</option>
	        <!-- 다른 군(구) 옵션도 추가 -->
	    </select>
	</div>

	<div id="map" style="width:700px;height:700px;"></div>
	
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'),
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567),
	        level: 8
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var markers = []; // 마커를 관리하기 위한 배열
		
		// select option 값이 변경될 때마다 이벤트 리스너 등록
		$('#selectRegion').change(function () {
		    var selectedRegion = $(this).val(); // 선택된 군(구)
		    
		    // 기존의 마커 제거
		    removeAllMarkers();
		
		    // 선택된 군(구)에 해당하는 동물병원 마커 추가
		    $.ajax({
		        url: './listByRegion.do', // 서버 주소를 적절히 수정
		        method: 'GET',
		        dataType: 'json',
		        data: { region: selectedRegion },
		        success: function (data) {
		        	console.log(data);
		            for (var i = 0; i < data.length; i++) {
		                var item = data[i];
		                addMarkerWithInfo(item);
		            }
		        },
		        error: function (error) {
		            console.error('Error fetching data:', error);
		        }
		    });
		});
		
		// 기존의 마커들을 모두 제거하는 함수
		function removeAllMarkers() {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(null);
		    }
		    markers = []; // 배열 초기화
		}
		
		function addMarkerWithInfo(data) {
		    var geocoder = new kakao.maps.services.Geocoder();
		
		    geocoder.addressSearch(data.소재지전체주소, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		            var marker = new kakao.maps.Marker({
		                map: map,
		                position: coords
		            });
		            markers.push(marker); // 배열에 마커 추가
		
		            var infowindow = new kakao.maps.InfoWindow({
		                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data.사업장명 + '</div>'
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		        }
		    });
		}
		
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}

	</script>
	
</body>
</html>