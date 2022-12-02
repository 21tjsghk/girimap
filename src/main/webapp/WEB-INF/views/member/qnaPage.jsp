<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
   
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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

.selected {
    text-align:center;
    border-right:1px solid #ccc;
    padding-right:10px;
    margin-right:10px;
    font-weight:bold;
    color:#f30;
}

ul{
    display: inline-flex;
}
</style>


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
                                <a href="./${list.idx}"><h6 class="mb-0" value="${list.idx}">${list.typename}</h6></a>
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
                        <h6 class="mb-0">전체글</h6>
                    </div>
                    <form role="form" method="get">
                    	<input type="hidden" name="qnaNum" value="${qnaNum}">
                    	<input type="hidden" name="boardType" value="${boardType}">
                    </form>
                    
                    
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
                            <c:if test="${qnaList.size() == 0 }">           
					       	<tr>
					        	<td colspan="6">해당하는 Q&A가 존재하지 않습니다.</td>		             	             	           		     
					       	</tr>
					       	</c:if>
					       	<c:forEach items="${qnaList}" var="list">
                                <tr>
                                    <th>${list.idx}</th>
						        	<th>${list.answer_type}</th>
						        	<th><a href="javascript:void(0);" onclick="numPass('${list.idx}','${qnaNum}','${boardType}')">${list.subject}</a></th>
						        	<th>${list.userId}</th>	
						        	<th>${list.regdate}</th>
						        	<th>${list.view_cnt}</th>
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table>
                      <div class="col text-center">
                      <!-- paging Start -->
			            
			            <jsp:include page="/WEB-INF/views/include/paging.jsp"/>
			        	
			          <!-- paging End -->
		       	   </div>       	 
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->

            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        </br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
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
	


    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
</body>


<script>

function toDetail(idx, writer) {
	
	var userId = "${sessionScope.loginId}";		
	/* var mem_flg = "${sessionScope.mem_flg}";

	if (userId!=writer) {	
		
		if (mem_flg==1) {
			alert("타인의 문의내용을 볼 수 없습니다!");
			return;
		}				
	} */
	
	location.href="qnaDetail?idx="+idx;
	
}
var qnaNum = '${qnaNum}';
var boardType = '${boardType}';

console.log("qnaNum : "+ qnaNum);
console.log("boardType : "+ boardType);


function numPass(idx,qnaNum,boardType) {
	console.log("numPass함수 실행");
	console.log("qnaNum numPass : "+ qnaNum);
	console.log("boardType numPass : "+ boardType);
	
	var formobj = $("form[role='form']");
	
	formobj.attr("action", "/qnaDetail");
	formobj.attr("method", "get");
	formobj.submit();
	console.log("qnaNum numPass : "+ qnaNum);
	console.log("boardType numPass : "+ boardType);

	if(qnaNum != '' && boardType == ''){
		console.log("boardType 이 0 일때");
		location.href="qnaDetail?idx="+idx+"&reviewNum=1&qnaNum="+qnaNum;
	} 
	if(qnaNum != '' && boardType != ''){
		console.log("boardType 이 0 일때");
		location.href="qnaDetail?idx="+idx+"&reviewNum=1&qnaNum="+qnaNum+"&boardType="+boardType;
	} 
	
}

</script>


</html>