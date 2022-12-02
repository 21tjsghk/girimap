<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<div id="evtChk"></div>
</body>
<script>
	/* 맵 타겟 */
	var mapContainer = document.getElementById('map');

	/* 맵 중심점 */
	var coord = new odf.Coordinate(955156.7761, 1951925.0984);

	/* 맵객체 옵션 */
	var mapOption = {	
		center:coord,
		zoom:11,
		projection:'EPSG:5179',
		//proxyURL:'proxyUrl.jsp',
		//proxyParam:'url',
		vWorldURL:'http://geon.wavus.co.kr:14062/map/api/vworld/wmts',
		basemap:{
    		vWorld:['vWorldBase','vWorldGray','vWorldMidnight','vWorldHybrid','vWorldSatellite']
		}
	};

	/* 맵객체 생성 */
	var map = new odf.Map(mapContainer, mapOption);

	/* 그리기 도구 컨트롤 생성 */
	var drawControl = new odf.DrawControl({
		/*
		연속 측정 여부. 
		 - true : 연속 측정 기능 활성화. ※ 측정 종료는 clean 함수를 통해서 실행
		 - false : (기본값) 연속 측정 기능 비활성화. 
		 */
		//continuity : true,
		rightClickDelete : true,
		message : {
			DRAWSTART_POINT : '[수정한 메세지]점을 그리기 위해 지도를 클릭해주세요',
			DRAWSTART_LINESTRING : '[수정한 메세지]선을 그리기 위해 지도를 클릭해주세요',
		
		},
		style : {
			fill : { // 원 채우기 스타일 Type Object
					//Properties
					//color
				color : [ 111, 111, 111, 0.6 ]
			},
			stroke : { //원 윤곽선 스타일
						/* color String | Array.<Number>
						색상 (ex) 'red' | '#55dd20' | [255,0,0,0.5]
		
						lineCap String
						선의 끝 모양
		
						lineJoin String
						선이 꺾이는 부분의 모양
		
						lineDash Array.<Number>
						점선
		
						lineDashOffset Number
						윤곽선
		
						miterLimit Number
						윤곽선
		
						width Number
						너비 */
				color : [ 103, 87, 197, 0.7 ],
				width : 2
			},
			image : {
				circle : {
					fill : {
						color : [ 111 , 222, 111, 0.6 ]
					},
					stroke : {
						color : [ 103, 87, 197, 0.7 ],
						width : 2
					},
					radius : 5,
				},
			},
			text : {
				textAlign : 'left',
				font : '30px sans-serif',
				fill : {
					color : [ 103, 87, 197, 1 ]
				},
				stroke : {
					color : [ 255, 255, 255, 1 ]
				},
			},
		},
		bufferStyle : {
			stroke : {
				color : [ 255, 255, 159, 1 ],
				width : 2
			},
			fill : {
				color : [ 255, 255, 159, 0.2 ],
			},
		}
	});
	
	drawControl.setMap(map);
	/*그리기 시작시 이벤트*/
	odf.event.addListener(drawControl, 'drawstart', function(feature) {
		//feature는 odf.Feature
		console.log("drawstart");
		document.getElementById('evtChk').innerText = "drawstart";
	});
	/*그리기 종료시 이벤트*/
	odf.event.addListener(drawControl, 'drawend', function(feature) {
		//feature는 odf.Feature
		console.log("drawend");
		document.getElementById('evtChk').innerText += " -> drawend";
	});
	
	/* 측정 도구 컨트롤 생성 */
	var measureControl = new odf.MeasureControl({
		/*
		연속 측정 여부. 
		 - true : 연속 측정 기능 활성화. ※ 측정 종료는 clean 함수를 통해서 실행
		 - false : (기본값) 연속 측정 기능 비활성화. 
		 */
		//continuity : true,
		message : {
			//DRAWSTART: '클릭하여 측정을 시작하세요',
			DRAWEND_POLYGON : '[수정한 메세지]클릭하여 폴리곤을 그리거나, 더블클릭하여 그리기를 종료하세요',
		// DRAWEND_LINE: '클릭하여 라인을 그리거나, 더블클릭하여 그리기를 종료하세요', 
		},
		style : {
			fill : {
				color : [ 111, 145, 124, 0.2 ]
			},
			stroke : {
				color : [ 103, 87, 197, 0.7 ],
				width : 2
			},
			image : {
				circle : {
					fill : {
						color : [ 111, 111, 111, 0.2 ]
					},
					stroke : {
						color : [ 103, 87, 197, 0.7 ],
						width : 2
					},
					radius : 5,
				},
			},
			text : {
				textAlign : 'left',
				font : '30px sans-serif',
				fill : {
					color : [ 103, 87, 197, 1 ]
				},
				stroke : {
					color : [ 255, 255, 255, 1 ]
				},
			},
		}
	});
	measureControl.setMap(map);
	/*그리기/측정 초기화 컨트롤 생성*/
	var clearControl = new odf.ClearControl();
	clearControl.setMap(map);
</script>
</html>
