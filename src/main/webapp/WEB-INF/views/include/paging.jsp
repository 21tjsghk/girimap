<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


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
<body>

					<c:if test="${boardType eq null}">
                        <!--  page -->
				      	<div class="block-27">
				          <ul>
					      <c:if test="${qnaPage.prev}">
					      <li><a href="qnaPageAll?qnaNum=${qnaPage.startPageNum - 1}">&lt;</a></li>
					      </c:if>
					      
					      <c:forEach begin="${qnaPage.startPageNum}" end="${qnaPage.endPageNum}" var="num">
					      <c:if test="${qnaSelect == num}">
					      <li class="selected  active"><span>${num}</span></li>
					      </c:if>
					      <c:if test="${qnaSelect != num}">
					      <li class="selected"><a href="qnaPageAll?qnaNum=${num}">${num}</a></li>			     
					      </c:if>    		
					      </c:forEach>
					      
					      <c:if test="${qnaPage.next}">
					      <li><a href="qnaPageAll?qnaNum=${qnaPage.endPageNum + 1}">&gt;</a></li>
					      </c:if>
					    </ul>
				      </div>
				     </c:if>
				     
				     <c:if test="${boardType ne null}">
                        <!--  page -->
				      	<div class="block-27">
				          <ul>
					      <c:if test="${qnaPage.prev}">
					      <li><a href="qnaPage?qnaNum=${qnaPage.startPageNum - 1}&boardType=${boardType}">&lt;</a></li>
					      </c:if>
					      
					      <c:forEach begin="${qnaPage.startPageNum}" end="${qnaPage.endPageNum}" var="num">
					      <c:if test="${qnaSelect == num}">
					      <li class="selected  active"><span>${num}</span></li>
					      </c:if>
					      <c:if test="${qnaSelect != num}">
					      <li class="selected"><a href="qnaPage?qnaNum=${num}&boardType=${boardType}">${num}</a></li>			     
					      </c:if>    		
					      </c:forEach>
					      
					      <c:if test="${qnaPage.next}">
					      <li><a href="qnaPage?qnaNum=${qnaPage.endPageNum + 1}&boardType=${boardType}">&gt;</a></li>
					      </c:if>
					    </ul>
				      </div>
				     </c:if>



</body>
</html>