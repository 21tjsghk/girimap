<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
   
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <meta http-equiv="Expires" content="-1">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/resources/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/resources/libs/font-awesome/5.10.0resources/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/tempusdominuscss/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>

<style>
body {
    overflow: scroll;
    overflow: visible;
}
</style>
<!-- 
<link href="http://geon.wavus.co.kr:14071/js/odf/odf.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/js/oui/oui.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widget.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/common.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widget_custom.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/common_custom.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widgets/admSearch.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widgets/addressSearch.css" rel="stylesheet">
  
<link href="http://geon.wavus.co.kr:14071/js/odf/odf.css" rel="stylesheet">
<script type="text/javascript" src="http://geon.wavus.co.kr:14071/js/odf/odf.min.js"></script>
<script type="text/javascript" src="http://geon.wavus.co.kr:14071/js/oui/oui.min.js"></script>
  
--+-----------------------------

 -->
<body style= " overflow-y: auto; " >
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <jsp:include page="/WEB-INF/views/include/sidebar.jsp"/>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
        
        
        
        
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
        	</nav>
            <!-- Navbar End -->


            <!-- Sale & Revenue Start -->
            <section id="Sale & Revenue">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                <c:forEach items="${getQnaTypeInfo}" var="list">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <div class="ms-3">
                                <a href="qnaPage?qnaNum=1&reviewNum=1&boardType=${list.idx}"><h6 class="mb-0" value="${list.idx}">${list.typename}</h6></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>  
            </div>
            </section>
            <!-- Sale & Revenue End -->


 			<!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h1 class="mb-0">인기글</h1>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                              <tr class="text-dark">
                                    <th scope="col">게시글번호</th>
                                    <th scope="col">게시판타입</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">아이디</th>
                                    <th scope="col">작성날짜</th>
                                    <th scope="col">조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${bestList.size() == 0 }">           
							       	<tr>
							        	<td colspan="6">해당하는 Q&A가 존재하지 않습니다.</td>		             	             	           		     
							       	</tr>
							       	</c:if>
							       	<c:forEach items="${bestList}" var="list">
		                                <tr>
		                                    <th>${list.idx}</th>
								        	<th>${list.answer_type}</th>
								        	<th><a href="qnaDetail?idx=${list.idx}&reviewNum=1">${list.subject}</a></th>
								        	<th>${list.userId}</th>	
								        	<th>${list.regdate}</th>
								        	<th>${list.view_cnt}</th>
		                                </tr>
		                            </c:forEach>    
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->

			<!-- 행정구역 나누기 -->
			
	
<%-- 			
			<div class="mapContainer1">
			
			<div>${msg} ${loginId}님</div>
			<div>${sessionScope.loginId } </div>
			<div id="userMenu" >
			<!--searchArea  -->
				<div id="searchAreaWidget" class="location odf_administrativeDistrictSearch_widget"  style="position: relative; "></div>
			</div>
			<div style= "overflow-y: visible;">
			<div id ="map" style= "overflow-y: visible;">
			</div>
			</div>
			<div class="location odf_administrativeDistrictSearch_widget" id="location"  style="position:static ; top: 50px; left: 150px;overflow-y: visible; ">
			
				<div id="administrativeDistrictSearchArea" class="administrativeDistrictSearch_location"></div>
				
			</div>
			
			</div> 
--%>
			<!--  행정구역 나누기  -->
	
	
<!--  
            Sales Chart Start
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Worldwide Sales</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="worldwide-sales"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Salse & Revenue</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="salse-revenue"></canvas>
                        </div>
                    </div>
                </div>
            </div>
           Sales Chart End
-->

           

<!-- 
            Widgets Start
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-light rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <h6 class="mb-0">Messages</h6>
                                <a href="">Show All</a>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-3">
                                <img class="rounded-circle flex-shrink-0" src="resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h6 class="mb-0">Jhon Doe</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                    <span>Short message goes here...</span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-3">
                                <img class="rounded-circle flex-shrink-0" src="resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h6 class="mb-0">Jhon Doe</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                    <span>Short message goes here...</span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-3">
                                <img class="rounded-circle flex-shrink-0" src="resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h6 class="mb-0">Jhon Doe</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                    <span>Short message goes here...</span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center pt-3">
                                <img class="rounded-circle flex-shrink-0" src="resources/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h6 class="mb-0">Jhon Doe</h6>
                                        <small>15 minutes ago</small>
                                    </div>
                                    <span>Short message goes here...</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-light rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Calender</h6>
                                <a href="">Show All</a>
                            </div>
                            <div id="calender"></div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="h-100 bg-light rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">To Do List</h6>
                                <a href="">Show All</a>
                            </div>
                            <div class="d-flex mb-2">
                                <input class="form-control bg-transparent" type="text" placeholder="Enter task">
                                <button type="button" class="btn btn-primary ms-2">Add</button>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox" checked>
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span><del>Short task goes here...</del></span>
                                        <button class="btn btn-sm text-primary"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center border-bottom py-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center pt-2">
                                <input class="form-check-input m-0" type="checkbox">
                                <div class="w-100 ms-3">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                        <span>Short task goes here...</span>
                                        <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            Widgets End
 -->

            <!-- Footer Start -->
 <!--            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            /*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div> 
            
-->

            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/lib/chart/chart.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/waypoints/waypoints.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
	<script>
	var msg = "${msg}";

	if(msg != ""){
		alert(msg);
	}
	
	var msg2 ="${alretMsg}"
	console.log("msg : "+ msg);
	if(msg2 != ""){
		alert(msg);
	}
			
	
	
		/* 맵 타겟 */
		var mapContainer = document.getElementById('map');
	
		/* 맵 중심점 */
		var coord = new odf.Coordinate(209576.17356159375, 355040.40034509933);
	
		/* 맵객체 옵션 */
		var mapOption = {	
			center:coord,
			zoom:11,
			projection:'EPSG:5186',
			vWorldURL:'https://api.gonp.duckdns.org/map/api/vworld/wmts',
			basemap:{
	    		vWorld:['vWorldBase','vWorldGray','vWorldMidnight','vWorldHybrid','vWorldSatellite']
			}
		};
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
		//var basemapControl = new odf.BasemapControl();
		//basemapControl.setMap(map);
		
		/* 줌 컨트롤 생성 */
		//var zoomControl = new odf.ZoomControl({zoomSlider : true,});
		//zoomControl.setMap(map);
	  
	  	//00. 주소검색 위젯 api 생성
	    var administApi = oui.AdministApi(oui.HttpClient({
	        baseURL: 'http://geon.wavus.co.kr:14062/addrgeo',
	    }), {
	        projection: '5186',
	      	crtfckey : 'tmiKPqf1niMu5rq1VcG49XKIYmhwDJEh',
	    });
	    var addressApi = oui.AddressApi(oui.HttpClient({
			baseURL: 'http://geon.wavus.co.kr:14062/addrgeo',
		}), {
	        projection: '5186',
	      	crtfckey : 'tmiKPqf1niMu5rq1VcG49XKIYmhwDJEh',
	    });
	    //01. 행정구역 검색 위젯 생성
	    
	    var administrativeDistrictSearchWidget = new oui.AdministrativeDistrictSearchWidget({
	      odf,
	      target: document.querySelector('#administrativeDistrictSearchArea'),
	      
	      options: {
	        useLi: true, //li 사용 여부(default 값 : false)
	        useHilight: true,//하이라이트 레이어 사용 여부  
	        clearHilightLayerFlagMove: true,//지도 이동시 검색결과 날리기 활성화
	        // styleObject: {// 하이라이트 레이어 스타일. 없으면 기본 스타일 적용
	        //   text: {
	        //     fill: {
	        //       color: "#858484ff",
	        //     },
	        //     font: "normal bold 16px 굴림",
	        //   },
	        //   fill: { color: [255, 255, 255, 0.4] },
	        //   stroke: { color: [241, 189, 29, 0.82], width: 2 },
	        // },
	        //알림옵션\
	    
	        
	        
	         
	        alertList: {
	          //사용자 정의 알림 메세지 정의
	          customAlert: (message) => {
	            console.log(message);
	          },
	          //사용자 정의 로딩바 시작 function
	          startLoadingBar: (message) => {
	            console.log(message);
	          },
	          //사용자 정의 로딩바 종료 function
	          endLoadingBar: (message) => {
	            console.log(message);
	          },
	        }
	      },
	      
	      api: {
	        //단건 행정구역 정보 조회  function
	        geometrySearch: administApi.geometrySearch,
	        //행정구역 유형별 정의
	        //시도 목록 조회 function
	        ctpvAdministrativeDistrictSearch: administApi.ctpvAdministrativeDistrictSearch,
	        //시군구 목록 조회 function
	        sggAdministrativeDistrictSearch: administApi.sggAdministrativeDistrictSearch,
	        //읍면동 목록 조회 function
	        emdAdministrativeDistrictSearch: administApi.emdAdministrativeDistrictSearch,
	        //리 목록 조회 function
	        liAdministrativeDistrictSearch: administApi.liAdministrativeDistrictSearch,
	        //경위도 좌표 검색 fucntion
	        coordSearch: addressApi.coordSearch,
	      }
	    });
	    
	    administrativeDistrictSearchWidget.addTo(map);
	  	//지우기 함수
		//administrativeDistrictSearchWidget.remove();
	
	  	
	  	// 그리기도구 
	  	var drawControl = new odf.DrawControl({
		/*
		연속 측정 여부.
		 - true : 연속 측정 기능 활성화. ※ 측정 종료는 clean 함수를 통해서 실행
		 - false : (기본값) 연속 측정 기능 비활성화.
		 */
		//continuity : true,
		message : {
			DRAWSTART_POINT : '[수정한 메세지]점을 그리기 위해 지도를 클릭해주세요',
			DRAWSTART_LINESTRING : '[수정한 메세지]선을 그리기 위해 지도를 클릭해주세요',
		/* DRAWSTART_POLYGON: '면을 그리기 위해 지도를 클릭해주세요',
		DRAWSTART_CURVE: '곡선을 그리기 위해 지도를 드래그해주세요',
		DRAWSTART_TEXT: '텍스트를 입력하기 위해 지도를 클릭해주세요.',
		DRAWSTART_BUFFER: '버퍼를 생성하기 위해 레이어를 선택해주세요.',
		DRAWSTART_CIRCLE: '원을 그리기 위해 지도를 클릭해주세요.',
		DRAWSTART_BOX: '사각형을 그리기 위해 지도를 클릭해주세요.',
		DRAWEND_DRAG: '드래그를 멈추면 그리기가 종료됩니다.',
		DRAWEND_DBCLICK: '드래그를 멈추면 그리기가 종료됩니다.', */
		},
		style : {
			fill : {
				color : [ 254, 243, 255, 0.6 ]
			},
			stroke : {
				color : [ 103, 87, 197, 0.7 ],
				width : 2
			},
			image : {
				circle : {
					fill : {
						color : [ 254, 243, 255, 0.6 ]
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
	/*그리기/측정 초기화 컨트롤 생성*/
	var clearControl = new odf.ClearControl();
	clearControl.setMap(map);
	
	
	</script>


    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
</body>

</html>