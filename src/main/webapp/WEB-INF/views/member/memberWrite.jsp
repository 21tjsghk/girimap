<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>memberWrite</title>
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



        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <jsp:include page="/WEB-INF/views/include/header.jsp"/>
        	</nav>
            <!-- Navbar End -->

            <!-- Form Start -->
            <form action="doMemberWrite" name="MemberWriteForm" id="MemberWriteForm" method="post" >
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    
                    <div class="col-sm-12 col-xl-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">회원가입</h6>
                            <div class="form-floating mb-3">
                                
			    				<input type="text"  class="form-control" id="inputName" name="username"  placeholder="성명을 입력해 주세요">
			    				<label for="inputName">성명</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="inputUserId" name="userId" placeholder="아이디를 입력해주세요.">
					            <br>
					            <div class="text-center">       
							    	<input type="button" class="btn btn-primary py-3 px-5" id="idCheck" onclick="goIdCheck()" value="아이디 중복체크"/>
							  	</div>
                                <label>아이디</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="inputPassword" name="password"  placeholder="비밀번호를 입력해주세요.">
	            				<font name="pwdlengthcheck" size="2" color="red"></font> 
	            				<label>비밀번호</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control" id="inputPasswordCheck" name="passwordcheck" placeholder="비밀번호를 확인해 주세요.">
	            				<font name="check" size="2" color="red"></font>
                                <label>비밀번호 확인</label>
                            </div>
                            
                            <div class="form-floating mb-3">
	                            <input type="text"  readonly class="form-control"
							     	   id ="inputZipcode" name="zipcode"  placeholder="우편번호 찾기를 해주세요.">
							    <br>
							    <div class="text-center">
							    <input type = "button" id ="btnZipcode" class="btn btn-primary py-3 px-5" onclick="goPostcode()" value = "우편번호 찾기"/>
							 	</div>
							 	<label for="inputZipcode">우편번호</label>
                            </div>
                            <div class="form-floating mb-3">
                            	<input type="text" class="form-control" readonly id="inputAddress"  name="address" placeholder="주소를 입력해 주세요">
                            	<label for="inputAddress">주소</label>
                            </div>
                            <div class="form-floating mb-3">
                            	<input type="text" class="form-control" id="inputAddress_detail" name = "address_detail"  placeholder="상세주소를 입력해 주세요">
                            	<label for="inputAddress_detail">상세 주소</label>
                            </div>
                            <div class="form-floating mb-3">
                            	<input type="email"  class="form-control" id="inputEmail" name="email"  placeholder="이메일 주소를 입력해주세요">
                            	 <label for="InputEmail">이메일 주소</label>
                            </div>
                            <div class="form-floating mb-3">
                            	<input type="tel" class="form-control" id="inputMobile" name="phone"  placeholder="ex)01012345678">
                            	<label for="inputMobile">휴대폰번호</label>
                            </div>
                            <div class="form-floating mb-3">
                            	<input type="tel" class="form-control" id="inputBirth" name="birthday"  placeholder="ex)20220101">
			    				<font name="bdlengthcheck" size="2" color="red"></font> 
			    				<label for="inputMobile">생년월일</label>
                            </div>
                            <div class="form-floating mb-3">
                            	<input type="radio" class="mr-2" name = "gender" value="남">남
			    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    					&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="mr-2" name = "gender" value="여" checked>여
                          
                            </div>
                            <div class="form-group text-center">
				            	<input type="button" value="회원가입" class="btn btn-primary py-3 px-5" onclick="check_input()">
				          	</div>
                            
                            
                            
                            
                        </div>
                    </div>
                    
                   
                    
            
                </div>
            </div>
            </form>
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
    
    
	<!-- 우편번호 찾기 라이브러리 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 	
    
</body>
<script>
$('#certify').hide();
$('#certifyButton').hide();

var idcheck_flg;

//개인정보이용, 마케팅 정보 수신동의 체크확인
$(function(){
	$('#checkbox').click(function(){
		
		var check = $('#checkbox').val();
		console.log("개인정보 동의 : ",check);
	});
});

$(function(){
	$('#marketing').click(function(){
		
		var marketing = $('#marketing').val();
		console.log("마케팅정보 수신동의 : ",marketing);
	});
});


//아이디 중복체크	
	function goIdCheck(){
		
		var frm = document.MemberWriteForm;
		var userId = $('#inputUserId').val();
		var idCheck = $('#idCheck').val();
		
		console.log("userId : "+ userId);
		console.log("idCheck : "+ idCheck);
		
		//아이디 미입력
		if(!document.MemberWriteForm.userId.value){
			alert("아이디 입력 후 중복확인을 해주세요.");
			document.MemberWriteForm.userId.focus();
			return;
		}
		
		if (!userId.match(/^[A-Za-z0-9]{8,12}$/)) {
			alert("아이디는 영문, 숫자조합으로만 입력가능합니다!");
			return;
		}
		
		$.ajax({
			url:'idCheck',
			method:'POST',
			data:{'userId' : userId},
			dataType:'json',
			success:function(data){
				console.log(data);
				
				
				if(data.result == false){
					$("#idcheck").val('Y');	
					$('#inputUserId').prop('readonly', true);
					$('#inputUserId').attr('readonly', true);
					$('#idCheck').attr('disabled', true);
					alert("사용가능한 아이디입니다.");
					idcheck_flg = 1;
				}else{
					$('#idcheck').val("N");
					alert("이미 사용중인 아이디입니다.");
					document.MemberWriteForm.userId.focus();
					return;
				}
			},
			error:function(e){
				console.log(e);
			}
			
		});
		
	}

//비밀번호 조건 확인
$(function(){	

	$('#inputPassword').keyup(function(){
		
		var pw = $('#inputPassword').val();
	    var num = pw.search(/[0-9]/g);
	    var eng = pw.search(/[a-z]/ig);
	    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

 		$('font[name=pwdlengthcheck]').text('');		
 		
 		if(pw.length<8){
 			$('font[name=pwdlengthcheck]').text('');
 			$('font[name=pwdlengthcheck]').html("비밀번호가 너무 짧습니다. 8자이상으로 만들어주세요.");
 		}else if(pw.search(/\s/) != -1){
 			$('font[name=pwdlengthcheck]').html("비밀번호는 공백없이 입력해주세요.");
 		}else if(num < 0 || eng < 0 || spe < 0 ){
	 		$('font[name=pwdlengthcheck]').text('');
	   		$('font[name=pwdlengthcheck]').html("비밀번호는 영문,숫자,특수문자 조합으로 입력해주세요.");
	   } else {
	  	 	$('font[name=pwdlengthcheck]').text('');
	    	$('font[name=pwdlengthcheck]').html("이 비밀번호는 사용가능합니다.");
	   }
	});
});
	
//비밀번호 일치확인
	$(function(){
		
		$('#inputPassword').keyup(function(){
			$('font[name=inputPasswordCheck]').text(' ');
		});
		
		$('#inputPasswordCheck').keyup(function(){
			if($('#inputPassword').val() != $('#inputPasswordCheck').val()){
				$('font[name=check]').text(' ');
				$('font[name=check]').html("비밀번호가 서로 일치하지 않습니다.");
			}else{
				$('font[name=check]').text(' ');
				$('font[name=check]').html("비밀번호가 일치합니다.");
			}
		});
		
	});
	
//우편번호 찾기
	function goPostcode(){
		console.log("우편번호 검색");
		
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("inputAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("inputAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('inputZipcode').value = data.zonecode;
	            document.getElementById("inputAddress").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("inputAddress_detail").focus();
	        }
	    }).open();
	};
	
//생년월일
$(function(){
	$('#inputBirth').keyup(function(){
		
		var birth = $('#inputBirth').val();
		var eng = birth.search(/[a-z]/ig);
		var spe = birth.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		var year = birth.substring(0,4);
		var month = birth.substring(4,6);
		var day = birth.substring(6,8);
		
		console.log("연도 : ", year);
		console.log("월 : ", month);
		console.log("일 : ", day);
		
		$('font[name=bdlengthcheck]').text(' ');
		
		if(birth.length<8 || birth.length>8 || month>12 || day>31){
			$('font[name=bdlengthcheck]').text(' ');
			$('font[name=bdlengthcheck]').html("생년월일을 확인해주세요.");
		}
		
		if(eng != -1 || spe != -1){
			$('font[name=bdlengthcheck]').text(' ');
			$('font[name=bdlengthcheck]').html("생년월일은 숫자만 입력해주세요.");
		}
		
	});
});



//입력확인 경고창
function check_input(){
	
	//비밀번호 조건
	var pw = $('#inputPassword').val();
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	var password = document.MemberWriteForm.password.value;
	var passwordcheck = document.MemberWriteForm.passwordcheck.value;
	var phone = document.MemberWriteForm.phone.value;
	
	//상세주소
	var adress_detail = $('#inputAddress_detail').val();
	var adeng = adress_detail.search(/[a-z]/ig);
	var adspe = adress_detail.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	//핸드폰
	var telephone=  $('#inputMobile').val();
    var phoneKorean = telephone.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g);
    var phoneEng = telephone.search(/[a-z]/ig);
    var phoneSpe = telephone.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    //이름
    var userName=  $('#inputName').val();    
    //아이디
    var idName=  $('#inputUserId').val();
    var idKorean = idName.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g);
    var idSpe = idName.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
    
	console.log("idcheck_flg : " + idcheck_flg);
	
	
	if(!document.MemberWriteForm.username.value){
		alert("성명을 입력해주세요.");
		document.MemberWriteForm.username.focus();
		return;
	}
	if(!userName.match(/^[가-힣]+$/) ){
		alert("성함을 확인해주세요!");
		document.MemberWriteForm.username.focus();
		return;
	}
	if(!document.MemberWriteForm.userId.value){
		alert("아이디를 입력하세요.");
		document.MemberWriteForm.userId.focus();
		return;
	}
	if(idKorean != -1 || idSpe != -1){
		alert("아이디는 영문, 숫자조합으로만 가능합니다.");
		document.MemberWriteForm.userId.focus();
		return;
	}	
	if(idcheck_flg != 1){
		alert("아이디 중복여부를 확인해주세요.");
		document.MemberWriteForm.userId.focus();
		return;
	}
	if(!document.MemberWriteForm.password.value){
		alert("비밀번호를 입력하세요.");
		document.MemberWriteForm.password.focus();
		return;
	}
	if(!document.MemberWriteForm.passwordcheck.value){
		alert("비밀번호 확인을 해주세요.");
		document.MemberWriteForm.passwordcheck.focus();
		return;
	}
	if(password != passwordcheck){
		alert("비밀번호가 일치하지 않습니다.");
		document.MemberWriteForm.passwordcheck.focus();
		return;
	}
	if(password == num < 0 || eng < 0 || spe < 0 || password.length<8){
		alert("비밀번호는 숫자,영문,특수문자 포함 8자 이상으로 입력해주세요.");
		document.MemberWriteForm.passwordcheck.focus();
		return;
	}
    if (!document.MemberWriteForm.address.value){
        alert("우편번호 찾기를 해주세요.");
        document.MemberWriteForm.zipcode.focus();
        return;
    }
    if (!document.MemberWriteForm.address_detail.value){
        alert("상세주소를 입력하세요!");
        document.MemberWriteForm.address_detail.focus();
        return;
    }
    if( adeng != -1 || adspe != -1 ){
		alert("상세주소는 숫자와 한글로 작성해주세요!");
		document.MemberWriteForm.address_detail.focus();
		return;
	}
    if (!document.MemberWriteForm.email.value){
        alert("이메일을 입력하세요!");
        document.MemberWriteForm.email.focus();
        return;
    }
    if (!document.MemberWriteForm.phone.value){
        alert("휴대폰번호를 입력하세요!");
        document.MemberWriteForm.phone.focus();
        return;
    }
    if( phoneKorean != -1 || phoneEng != -1 || phoneSpe != -1 ){
		alert("휴대폰번호는 숫자로 작성해주세요!");
		document.MemberWriteForm.phone.focus();
		return;
	}
    if (phone.length < 11 ){
        alert("휴대폰번호는 010부터 입력해주세요");
        document.MemberWriteForm.phone.focus();
        return;
    }
    if (!document.MemberWriteForm.birthday.value){
        alert("생년월일을 입력하세요!");
        document.MemberWriteForm.birthday.focus();
        return;
    }
   
    
   if (confirm("회원가입을 진행하시겠습니까?")) {
   	 document.MemberWriteForm.submit();
	}
    
    
    
	
};
	
	
	
</script>
</html>