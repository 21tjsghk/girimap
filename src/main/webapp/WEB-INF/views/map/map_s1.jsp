<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
</head>
<link href="http://geon.wavus.co.kr:14071/js/odf/odf.css" rel="stylesheet">
<script type="text/javascript" src="http://geon.wavus.co.kr:14071/js/odf/odf.min.js"></script>
<body>
	<div id="map" class="odf-view"></div>
	<button onclick="transform('current')" class="onoffOnlyBtn">1.
			현재 좌표 확인</button>
	 <div id="result"></div>
</body>
<script>
	/* 맵 타겟 */
	var mapContainer = document.getElementById('map');

	/* 맵 중심점 */
	var coord = new odf.Coordinate(909765.83258, 1486333.889);

	/* 맵객체 옵션 */
	var mapOption = {	
		center:coord,  // 지도 중심점 좌표
		zoom:18, // 확대 레벨
		projection:'EPSG:5179',  // 좌표계 SRS ID 
		//proxyURL:'proxyUrl.jsp', // 프록시 url
		//proxyParam:'url', // 프록시에서 사용할 param 명 :  url
		vWorldURL:'http://geon.wavus.co.kr:14062/map/api/vworld/wmts', // v월드 url 
		basemap:{ // 베이스맵 옵션(사용할 베이스맵 선택) 
     		vWorld:['vWorldBase','vWorldGray','vWorldMidnight','vWorldHybrid','vWorldSatellite']
		}
	};
	
	console.log(coord);
	/* 
		* 배경지도 종류
		eMapBasic - 바로e맵 일반 지도
		eMapColor - 바로e맵 색각 지도
		eMapLowV - 바로e맵 큰글씨 지도
		eMapWhite - 바로e맵 백지도
		eMapEnglish - 바로e맵 영어 지도
		eMapChinese - 바로e맵 중어 지도
		eMapJapanese - 바로e맵 일어 지도
		eMapWhiteEdu - 바로e맵 교육용 백지도
		eMapAIR - 바로e맵  항공지도
		
		* 프록시 사용
		proxyURL: 'proxy.jsp' 프록시 설정
	 */

	/* 맵객체 생성 */
	var map = new odf.Map(mapContainer, mapOption);

	/* 베이스맵 컨트롤 생성 */
	var basemapControl = new odf.BasemapControl();
	basemapControl.setMap(map);
	
	/* 줌 컨트롤 생성 */
	var zoomControl = new odf.ZoomControl({zoomSlider : true,});
	zoomControl.setMap(map);

    
	/* 축척 컨트롤 생성 */
	var scaleControl = new odf.ScaleControl({
		size : 100,
		scaleInput  : false, //true 로 변경시 축척 입력 상자 생성
	//축척 컨트롤 크기 조정 (기준 픽셀) ※기본값 => 100
	});
	scaleControl.setMap(map);
	
</script>
</html>