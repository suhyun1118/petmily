<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
table {
    float : center;
    width: 1200px;
    border-top: 1px solid black;
    text-align: center;
    margin-left: auto; 
    margin-right: auto;
}
.purchase th{
   border-top:3px solid black;
    border-bottom: 1px solid #DDDDDD;
    padding: 10px;
     text-align:center;
}
 .purchase td{
    border-bottom: 1px solid ;
     text-align:center;
      padding: 5px;
      padding-bottom: 10px;
  
}

</style>


<body>

<%@include file="header-area.jsp" %>
<br>
 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>마이페이지 - 구매 내역</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
<table class="purchase">
<tr>
<th>상품</th><th>상품 이름</th><th>상품 가격</th><th>배송비</th><th>결제 방법</th><th>구매 날짜</th><th>상품 후기</th> 
</tr>
<c:choose>
<c:when test = "${not empty purchase}" >
<c:forEach items="${purchase}" var="purchase">
<tr>
	<td><img src="${pageContext.request.contextPath}/resources/shopIMG/${purchase.item_profile}" width="80px" height="80px"></td>
	<td>${purchase.item_name}</td>
	<td>${purchase.item_price}</td>
	<td>${purchase.deliveryPrice}</td>
	<td>${purchase.paymentOption}</td>
	<td>${purchase.purchaseDate}</td>
	<td><a href="purchase_select?delivery_number=${purchase.delivery_number}">상품 후기 쓰러가기</a></td>
</tr>
</c:forEach>
</c:when>
<c:otherwise>
<tr>
	 <h3><strong>구매 내역이 없습니다.</strong></h3>
	</tr>
</c:otherwise>
</c:choose>
</table>

<br>
<br>
<%@include file="footer-area.jsp"%>


</body>
</html>