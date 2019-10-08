<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.caadfafaf{
border: 5px solid #f5f5f5;
border-radius: 10px;
display:block;
margin : 30px;
clear : nono;
width: 20%;
}
.gmd{ 
	text-align:center;
}
.paging{
	margin-left:985px;
}
.nav{
	margin-left:150px;
}
</style>

</head>
<body>
<%@include file="header-area.jsp"%>
<br>
 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>강아지</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    
<div class="gmd">
<a href="">분양가격순정렬</a>
<a href="">인기순</a>
<a href="">최신순</a> <br><!-- 꼭해야하나  -->

<a id="1" href="Pet_Dog_Listall?page=1&pet_size=대형견">대형견</a> <a id="2" href="Pet_Dog_Listall?page=1&pet_size=중형견">중형견 </a><a id ="3" href="Pet_Dog_Listall?page=1&pet_size=소형견">소형견</a>
</div>

<div class="nav">
<c:forEach var="List" items="${Pet_Dog_allList}">

<div class="caadfafaf">
<c:choose>
<c:when test="${(not empty sessionScope.sessionId)}">
<a href="Pet_Dog_View?pet_number=${List.pet_number}&page=1&pet_like_id=${sessionScope.sessionId}"><img style="width:600px; height:500px;" src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>
</c:when>
<c:otherwise>
<a href="Pet_Dog_View2?pet_number=${List.pet_number}&page=1"><img style="width:600px; height:500px;" src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>
</c:otherwise>
</c:choose>


<c:choose>
<c:when test="${(sessionScope.sessionHit eq '1')}">
<a href="javascript:like_func2(${List.pet_number});"><img style="width:50px; height :40px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투투.png">${List.pet_hit}</a>
</c:when>

<c:otherwise>
<a href="javascript:like_func(${List.pet_number});"><img style="width : 50px; height :40px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투.JPG">${List.pet_hit}</a><br>
</c:otherwise>
</c:choose>
${List.pet_name}
</div>

</c:forEach>

</div>
<br>
<div class="paging">
<c:if test="${paging.page<=1}">

	[이전]&nbsp; 
</c:if>
<c:if test="${paging.page>1}">
	<a href="Pet_Dog_List?page=${paging.page-1}">[이전]</a>&nbsp;
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	<c:choose>
	
		<c:when test="${i eq paging.page}">
			${i}
		</c:when>
		<c:otherwise> 
		<a href="Pet_Dog_List?page=${i}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
[다음]
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="Pet_Dog_List?page=${paging.page+1}">[다음]</a>
</c:if>
</div>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>