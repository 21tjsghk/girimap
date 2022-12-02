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
</body>
<style>
.btn-control-newControl {
	position: relative;
	background-image: url(images/Symbols/Basic/Populated7.png);
}
</style>
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

	/* 베이스맵 컨트롤 생성 */
	var basemapControl = new odf.BasemapControl();
	basemapControl.setMap(map);
	
	//사용자 정의 컨트롤 클래스 생성
	    class NewControl extends odf.Control {
	        constructor(param) {
	          super({
	            setMap: function () {},
	            removeMap: function () {},
	            clear: function () {},
	         });
	       }
	     }

	      NewControl.click = function (evt) {
	        alert('사용자 정의 컨트롤 클릭!');
	      };

	      NewControl.controlId = 'newControl'; //컨트롤id
	      NewControl.groupIdx = 700; //컨트롤이 속할 그룹 번호 (1~)

	      var newControl = new NewControl();
	      newControl.setMap(map);
	
</script>

</html>