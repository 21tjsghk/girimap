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
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
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
    <link href="resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet">
  
    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>

<style>
/*


*/

h1 {
    color: #111;
    font-weight: 600;
    letter-spacing: inherit;
    font-size: 24px;
    line-height: 28px;
    padding: 0 0 20px 0;
    border-bottom: 1px solid #111;
}

h2{
  position: relative;
 
  color: #353535;
  font-size: 30px;
  font-family: "Cormorant Garamond", serif;
}


button {
  margin: 20px;
}
.custom-btn {
  width: 200px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 6 */
.btn-6 {
  background: rgb(247,150,192);
background: radial-gradient(circle, rgba(247,150,192,1) 0%, rgba(118,174,241,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-6 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-6:before,
.btn-6:after {
  position: absolute;
  content: "";
  height: 0%;
  width: 1px;
 box-shadow:
   -1px -1px 20px 0px rgba(255,255,255,1),
   -4px -4px 5px 0px rgba(255,255,255,1),
   7px 7px 20px 0px rgba(0,0,0,.4),
   4px 4px 5px 0px rgba(0,0,0,.3);
}
.btn-6:before {
  right: 0;
  top: 0;
  transition: all 500ms ease;
}
.btn-6:after {
  left: 0;
  bottom: 0;
  transition: all 500ms ease;
}
.btn-6:hover{
  background: transparent;
  color: #76aef1;
  box-shadow: none;
}
.btn-6:hover:before {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6:hover:after {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6 span:before,
.btn-6 span:after {
  position: absolute;
  content: "";
  box-shadow:
   -1px -1px 20px 0px rgba(255,255,255,1),
   -4px -4px 5px 0px rgba(255,255,255,1),
   7px 7px 20px 0px rgba(0,0,0,.4),
   4px 4px 5px 0px rgba(0,0,0,.3);
}
.btn-6 span:before {
  left: 0;
  top: 0;
  width: 0%;
  height: .5px;
  transition: all 500ms ease;
}
.btn-6 span:after {
  right: 0;
  bottom: 0;
  width: 0%;
  height: .5px;
  transition: all 500ms ease;
}
.btn-6 span:hover:before {
  width: 100%;
}
.btn-6 span:hover:after {
  width: 100%;
}
</style>

<body style= " overflow-y: auto; font: revert; ">
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
                            <h1 class="mb-4">게시글 쓰기</h1>
                            
                            <div class="form-floating mb-3">
                            	<h2>게시글타입 </h2>
                            	<h2>${detailInfo.answer_type}</h2>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <p>${detailInfo.userId}</p>
                                <p for="floatingPassword">아이디</p>
                            </div>
                            
                            <p for="floatingPassword">제목</p>
                            <div>
                                <h1>${detailInfo.subject}</h1>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <p>${detailInfo.regdate}</p>
                                <p for="floatingPassword">날짜</p>
                            </div>
                            
                            
                            <div class="form-floating mb-3">
                                <p>${detailInfo.view_cnt}</p>
                                <p for="floatingPassword">조회수</p>
                            </div>
                          
                            <div class="form-floating mb-3">
                                <textarea class="form-control" rows="5" id="content" name="content" style=" height: 390px;padding-left: 100px;width: 100%; " readonly="readonly">${detailInfo.content }</textarea>
                                <p for="floatingTextarea">내용</p>
                            </div>
                            
                            <div class="form-floating mb-3" style=" display: initial; ">
                            
                            
	                            <c:if test="${boardType ne null}">
								 	<button type="button" class="custom-btn btn-6" onclick="location.href='qnaPage?qnaNum=${qnaNum}&boardType=${boardType}'" style=" display: inline;">게시글 목록으로 돌아가기</button>
							    </c:if> 
							      
							   	<c:if test="${qnaNum ne null and boardType eq null}">
								 	<button type="button" class="custom-btn btn-6" onclick="location.href='qnaPageAll?qnaNum=${qnaNum}'" style=" display: inline;">전체 글로 돌아가기</button>
							    </c:if>   
							    
							  	<c:if test="${qnaNum eq null and boardType eq null}" >
								 	<button type="button" class="custom-btn btn-6" onclick="location.href='./'" style=" display: inline;">메인으로 돌아가기</button>
							    </c:if> 
						    
						     
						        <input type="button"  class="custom-btn btn-6" value="수정하기" class="btn btn-dark rounded-pill m-2"onclick="updateQna('${detailInfo.idx}')">
	            				<input type="button" class="custom-btn btn-6"  value="삭제하기" class="btn btn-dark rounded-pill m-2" onclick="deleteQna('${detailInfo.idx}')">
							</div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
            <!-- Form End -->
            
            <!--  댓글 영역  -->
 			<div class="container-fluid pt-4 px-4">

				<ul class="review_list">
					<c:if test="${reviewlist.size() eq 0}">
						<li><div class="text-center">등록된 리뷰가 없습니다.</div></li>
					</c:if>
					<c:forEach items="${reviewlist}" var="review">
						<li>
							<div class="writer"> 작성자 : <span class="reviewuser">${review.userId}</span> </div>
							<div class="subject">
								제목 : ${review.q_content}<br>
								내용 : ${review.content}
								<span class="date">${review.regdate}</span>
								
							</div>
							<!--
							
							<c:forEach items="${answerList}" var="answer">
								<c:if test="${answer.r_idx eq review.idx}">
								<div class="con">
									  ㄴ 관리자 : ${answer.content}
								</div>
								</c:if>
							</c:forEach>
							
							 대댓글 -->
							
						</li>
					<div style="text-align:right;padding:1%;">
					<input type="button" class="btn btn-primary" onclick="detailreviewdelete('${review.idx}','${review.userId}')" value="삭제하기" />
					</div>
					<!--  onclick="location.href='reviewdelete?idx=${review.idx}'"-->
					</c:forEach>
				</ul>
				<ul class="paging">
					
					<c:if test="${page.prev}">
					<li class="prev disabled" ><a href="qnaDetail?idx=${idx}&reviewNum=${page.endPageNum - 1}">&lt;</a></li>
					</c:if>
					 <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
					      <c:if test="${select == num}">
					      <li class="now"><span>${num}</span></li>
					      </c:if>
					      <c:if test="${select != num}">
					      <li class="num"><a href="qnaDetail?idx=${idx}&reviewNum=${num}">${num}</a></li>			     
					      </c:if>    		
					</c:forEach>
					<c:if test="${page.next}">
					      <li><a href="qnaDetail?idx=${idx}&reviewNum=${page.endPageNum + 1}">&gt;</a></li>
					</c:if>
				</ul>

			</div>
			<section class="review_wrap">
				<c:if test="${sessionScope.loginId ne null}">
					<div class="title">REVIEW WRITE</div>
					<ul class="reviewupdateForm">
						<li class="reviewuesrId">작성자 : ${sessionScope.loginId}</li>
						<li>제 &nbsp; 목 : <input type="text" class="reviewsubject" maxlength="50"/>${review.regdate}</li>
						<li class="con">
							내 &nbsp; 용 : <textarea class="reviewcontent"></textarea>
							<input type="button" class="reviewupdate" onclick="reviewupdate('${idx}','${sessionScope.loginId}')" value="등록"/>
						</li>
					</ul> 
				</c:if>
				<c:if test="${sessionScope.loginId eq null}">
					
					<ul class="reviewupdateForm text-center">
						<li class="reviewuesrId">로그인 후 리뷰작성이 가능합니다.</li>
					</ul> 
				</c:if>
			</section>
				


			<!-- 댓글영역 enD -->

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


<script type="text/javascript">
jQuery(function(){
jQuery("link[rel=stylesheet][href*='common.scss']").remove();
});
</script>



<script>

var userId = "${sessionScope.loginId}";



var msg ="${alretMsg}"
	
console.log("msg : "+ msg);

	
if (userId=="") {

	location.href="logout";
	console.log("msg : "+ msg);
	alert(msg);
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


var qnaNum = "${sessionScope.qnaNum}";
var boardType = "${sessionScope.boardType}";

console.log(qnaNum);

console.log(boardType);

function deleteQna(idx){
	
	if (confirm('해당 게시글을 삭제하시겠습니까?')) {	
		
		$.ajax({
			type:"post",
			url:"deleteQna",
			data : {
				idx: idx,						
			},
			dataType:"JSON",
			success:function(data){
				if(boardType == null){
					alert('해당 게시글이 삭제되었습니다.');
					location.href="qnaPageAll?qnaNum="+ qnaNum;
				}else if(boardType != null && qnaNum != null ){
					alert('해당 게시글이 삭제되었습니다.');
					location.href="qnaPage?qnaNum="+ qnaNum+ "&boardType="+boardType;
				}else if(boardType == null && qnaNum == null){
					alert('해당 게시글이 삭제되었습니다.');
					location.href="./";
				}
				
				
			},
			error:function(e){
				
				alert('에러발생 관리자에게 문의해주세요.');
				
			}
		});
	}	
	
}


function updateQna(idx){
	
	if (confirm('해당 게시글을 수정하시겠습니까?')) {	
		
		location.href="updateQna?idx="+idx+"&reviewNum=1";	
			
	}	
	
}


var reviewsubject = $('.reviewsubject').val();
var reviewcontent = $('.reviewcontent').val();

function reviewupdate(idx, userId){
	
	var reviewsubject = $('.reviewsubject').val();
	var reviewcontent = $('.reviewcontent').val();
	console.log("도찫");
	
	
	if(reviewsubject=='') {
		alert('리뷰 제목을 입력해주세요');
	}else if(reviewcontent=='') {
		alert('리뷰 내용을 입력해 주세요.');
	}else{
			
		if (confirm('리뷰를 작성하시겠습니까?')) {
			$.ajax({
				type:'POST',
				url:'reviewupdate',
				data:{'reviewsubject':$('.reviewsubject').val(),
					  'reviewcontent':$('.reviewcontent').val(),
						'idx': idx
					  },
				datatype:'JSON',
				success:function(data){
					
					console.log("도찫");
					
					
					if (data.success > 0) {
						alert('댓글 등록이 완료되었습니다.');				
					}
					if(data.success < 1){
						alert('댓글 작성이 불가능합니다 ');	
					}
				},
				error:function(e){
					console.log(e);
					alert('서버에 문제가 생겼습니다. 고객센터에 문의해주세요.');
				}
			});
		}
		
	window.location.reload();
	
	}
	
};




</script>


</html>