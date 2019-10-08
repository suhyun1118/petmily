<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petmily</title>
</head>

<style>
.itemList{
    display: inline-block;
	margin-left : 220px;
	width:337px;
}
.itemname{
	font-size:23px;
}
.iteminfo{
	text-align:center;
	font-size:18px;
}
.itemprice{
	text-align:center;
	font-size:18px;
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
                        <h2>펫 용품</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
	
	<c:forEach items="${ItemList}" var="ItemList">
	<div class="itemList">
	
		<div class="catagory-title">
		
		<a href="Shop_View?item_number=${ItemList.item_number}">
		<img src="${pageContext.request.contextPath}/resources/shopIMG/${ItemList.item_Profile}" width="337px" height="338px"/>
		</div>
		<br>
		<div class="itemname">${ItemList.item_name}<strong style="color:red;">[${ItemList.item_reviewCount}]</strong></div><br>
		<div class="iteminfo">
	${ItemList.item_kind} <br>
		${ItemList.item_katagorie}<br>
	<hr>
	</div>
	<div class="itemprice"><strong style="color:red;">${ItemList.item_price}원</strong></div>
		</a>
		
	
	</div>
	</c:forEach>
<br>
<br>
<br>

<%@include file="footer-area.jsp" %>

</body>
</html>