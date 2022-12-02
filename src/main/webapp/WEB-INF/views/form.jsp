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

<body>
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
                            
                            <select id="answer_type" name="answer_type" class="form-control">
							 	<option value="" >문의타입을 선택해주세요.</option>
							 	<c:forEach items="${getQnaTypeInfo}" var="list">
							 		<option name = "seletedType" value="${list.idx}" >${list.typename}</option>
							 	</c:forEach>
						     </select>	
						     <label for="floatingSelect">게시글타입</label>
                            </div>
                            
                            <div class="form-floating mb-3">
                               	<input type="text" id="subject" name="subject" class="form-control">		
                                <label for="floatingPassword">제목</label>
                            </div>
                            
                          
                            <div class="form-floating mb-3">
                                <textarea class="form-textArea" rows="5" id="content" name="content" style=" height: 390px;padding-left: 100px;width: 100%; "></textarea>
                                <label for="floatingTextarea">내용</label>
                            </div>
                            <div class="ftco-animate text-center">
							 	<button type="button" class="btn btn-primary" onclick="d()" style=" display: inline;">뒤로</button>
						        <button type="button" class="btn btn-primary" onclick="regist();" style=" display: inline;">등록하기</button>
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
function regist(){
	
    if (!document.qnaForm.answer_type.value)
    // login_form 이름을 가진 form 안의 id_val 의 value가 없으면
    {
        alert("문의타입을 선택하세요!");
        // 화면 커서 이동
        return;
    }
    
    if (!document.qnaForm.subject.value)
    {
        alert("문의제목을 입력하세요!");
        // 화면 커서 이동
        return;
    }
    
    if (!document.qnaForm.content.value)
    {
        alert("문의내용을 입력하세요!");
        // 화면 커서 이동
        return;
    }
   	alert("문의가 등록되었습니다.");
    document.qnaForm.submit();
    // 모두 확인 후 submit()
    
  

}






</script>


</html>