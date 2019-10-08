<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h1{
	text-align:center;
}
.page{
	text-align:center;
}
.writer{
	position: relative;
    display: block;
    font-size: 15px;
}
a{
	font-size:25px;
}
.list{
    border-color: dimgray;
    display: inline-block;
    margin-left:150px;
}
.all{ 
	width:1500px;
	margin-left:250px;
}
</style>
<body>
<%@include file="header-area.jsp"%>
<br>
 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>입양 후기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
<div class="all">
<c:forEach var="arList" items="${arList}">
<div class="list">
<a href="ar_view?ar_number=${arList.ar_number}&page=${paging.page}" style="font-size:25px;">
<img src="${pageContext.request.contextPath}/resources/adopt/${arList.adoptFileName}" width="337px" height="338px">
<div class="title">${arList.ar_number} ${arList.ar_title}</div>
<div class="writer">${arList.ar_writer}  ${arList.ar_writedate} <p style="color:gray;">조회 ${arList.ar_viewhit}</p></div>
</a>
</div>
</c:forEach>
</div>
<!-- 페이징 처리 -->
<div class="page">
<c:if test="${paging.page<=1}">
<&nbsp;
</c:if>
<c:if test="${paging.page>1}">
<a href="ar_list?page=${paging.page-1}"><</a>&nbsp;
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
<c:choose>
<c:when test="${i eq paging.page}">
${i}
</c:when>
<c:otherwise>
<a href="ar_list?page=${i}">${i}</a>
</c:otherwise>
</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
&nbsp;>
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="ar_list?page=${paging.page+1}">></a>
</c:if>
</div>
<!--  <a href="ar_gowrite">글쓰기</a>-->
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>