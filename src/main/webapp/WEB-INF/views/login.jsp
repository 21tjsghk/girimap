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

<link href="http://geon.wavus.co.kr:14071/js/odf/odf.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/js/oui/oui.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widget.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/common.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widget_custom.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/common_custom.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widgets/admSearch.css" rel="stylesheet">
<link href="http://geon.wavus.co.kr:14071/smt/css/widgets/addressSearch.css" rel="stylesheet">

<script type="text/javascript" src="http://geon.wavus.co.kr:14071/js/odf/odf.min.js"></script>
<script type="text/javascript" src="http://geon.wavus.co.kr:14071/js/oui/oui.min.js"></script>
  



<body>

			<!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
        	</nav>
            <!-- Navbar End -->
	<form action="logindo" name="loginForm" id="loginForm" method="post" class="bg-white p-5 contact-form">
	      <div class="login-heading">
		         <span>로그인</span>	                      
	      </div>
          <div class="form-group">
            <label>아이디</label>
            <input type="text" class="form-control" name="userId" placeholder="아이디">
          </div>
          <div class="form-group">
            <label>비밀번호</label>
            <input type="password" onkeyup="enterkey();"  class="form-control" name="password" placeholder="비밀번호">
          </div>
          
          <div class="form-group text-center">		        
	        <a href="findIdPassword">아이디, 비밀번호를 잊어버리셨나요?</a>
	      </div>
	      
          <div class="form-group text-center">
            <input type="button" value="로그인" class="btn btn-primary py-3 px-5" onclick="check_input()">
          </div>
          
          <div class="form-group text-center">
	        <p> 회원이 아니신가요? <a href="memberWrite">회원가입</a> 하기</p>                               
	      </div>
	      
	</form>   


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
var msg = "${msg}";

if(msg != ""){
	alert(msg);
}

function check_input() {
	
    if (!document.loginForm.userId.value)
    // login_form 이름을 가진 form 안의 id_val 의 value가 없으면
    {
        alert("아이디를 입력하세요!");
        // 화면 커서 이동
        return;
    }
    
    if (!document.loginForm.password.value)
    {
        alert("비밀번호를 입력하세요!");
        // 화면 커서 이동
        return;
    }
    
    document.loginForm.submit();
    // 모두 확인 후 submit()
 }
 
function enterkey() {	
    if (window.event.keyCode == 13) {
         // 엔터키가 눌렸을 때 실행할 내용
    	check_input();
    }
}

</script>

</html>