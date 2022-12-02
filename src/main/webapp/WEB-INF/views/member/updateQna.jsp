<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>게시글쓰기 폼 페이지 </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/resources/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/tempusdominus/resources/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>

<body  style= " overflow-y: auto; ">
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

            <!-- Form Start -->
            
            
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-12">
                    <form action="doRegistQna" name="qnaForm" id="qnaForm" method="post" class="bg-white p-5 contact-form">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">게시글 쓰기</h6>
                            
                            <div class="form-floating mb-3">
                        	 현재 게시글 타입 : <input type="text" id="answer_type_selected" name="answer_type_selected" class="form-control" readonly="readonly" value="${updateInfo.answer_type }">
                               변경 된 게시글 타입 : 
                             <label for="floatingSelect">게시글 타입</label>
                            </div>
                            
                             
                            <div class="form-floating mb-3">
                            	 
                               	<select id="answer_type" name="answer_type" class="form-control">
	                             <c:forEach items="${getQnaTypeInfo}" var="list" >
								 		<option value="${list.idx}"  selected="${updateInfo.answer_type }">${list.typename}</option>
								 </c:forEach>
								 </select>
							     <label for="floatingSelect">변경하려는 게시글타입을 고르시오</label>
                            </div>
                            
                            <div class="form-floating mb-3">
                               	<input type="text"  id="userId" name="userId" class="form-control" value="${updateInfo.userId }" readonly="readonly">		
                                <label for="floatingPassword">글쓴이</label>
                            </div>
                            
                            <div class="form-floating mb-3">
                               	<input type="text" id="subject" name="subject" class="form-control" value="${updateInfo.subject }">		
                                <label for="floatingPassword">제목</label>
                            </div>
                           
                           <div class="form-floating mb-3">
                               	<input type="text" id="regdate" name="regdate" class="form-control" value="${updateInfo.regdate }" readonly="readonly">		
                                <label for="floatingPassword">날짜</label>
                            </div>
                           
                           
                            <div class="form-floating mb-3">
                                <textarea class="form-textArea" rows="5" id="content" name="content" style=" height: 390px;padding-left: 100px;width: 100%; ">${updateInfo.content }</textarea>
                                <label for="floatingTextarea">내용</label>
                            </div>
                            <div class="form-floating mb-3">
						        <button type="button" class="btn btn-primary" onclick="doUpdateQna(${updateInfo.idx})"> 수정하기</button>
							</div>
							
							
                        </div>
                    </form>
                    </div>
                </div>
            </div>
            <!-- Form End -->


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
    <script src="resources/lib/tempusdominus/resources/js/moment.min.js"></script>
    <script src="resources/lib/tempusdominus/resources/js/moment-timezone.min.js"></script>
    <script src="resources/lib/tempusdominus/resources/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
    
     <!--  Vue.js  -->
    <script src="https://unpkg.com/vue@next"></script>
    
</body>
<script>

var userId = "${sessionScope.loginId}";

if (userId=="") {
	location.href="logout";
}

/* 
var qnaNum = "${sessionScope.qnaNum}";
var boardType = "${sessionScope.boardType}"; 
 */

function doUpdateQna(idx){
	if (confirm('해당 문의를 수정하시겠습니까?')) {
		$.ajax({
			type:"post",
			url:"doUpdateQna",
			data : {
				idx: idx,	
				answer_type: $("#answer_type").val(),
				content: $("#content").val(),
				subject: $("#subject").val(),
				userId: $("#userId").val()
			},
			dataType:"JSON",
			success:function(data){
				
				if (data.result>0) {
					alert('답변이 수정되었습니다.');
					location.href="qnaDetail?idx="+idx+"&reviewNum=1";	
					return;
				} else{
					alert('에러발생! 관리자에게 문의해주세요.1');				
				}				
			},
			error:function(e){
				
				alert('에러발생 관리자에게 문의해주세요.2');
				
			}
		});
	}
	
}



</script>


</html>