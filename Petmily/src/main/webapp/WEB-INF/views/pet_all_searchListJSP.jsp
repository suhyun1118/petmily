<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ca{
display:block;
border: 8px solid #FF6464;
border-radius: 10px;
margin : 30px;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
float: left;
text-align:center;
}

.gmd{ 
text-align:center;
}
.nav{
	margin-left:100px;
}
.paging{
	margin-left:1000px;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<%@include file="header-area.jsp"%>
<br>
<div class="nav">
<c:forEach var="List" items="${pet_all_searchList}">
<div class="ca">

<a href="Pet_Dog_View?pet_number=${List.pet_number}&page=1"><img style="width:400px; height:500px;" src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>

<c:choose>
<c:when test="${(sessionScope.sessionHit eq '1')}">
<a href="javascript:like_func2(${List.pet_number});"><img style="width:30px; height :30px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투투.png">${List.pet_hit}</a>
</c:when>

<c:otherwise>
<a href="javascript:like_func(${List.pet_number});"><img style="width : 30px; height :30px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투.JPG">${List.pet_hit}</a><br>
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
	<a href="pet_all_search?page=${paging.page-1}&search_content=${paging.search_content}
	&search_category=${paging.search_category}">[이전]</a>&nbsp;
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	<c:choose>
	
		<c:when test="${i eq paging.page}">
			${i}
		</c:when>
		<c:otherwise> 
		<a href="pet_all_search?page=${i}&search_content=${paging.search_content}
	&search_category=${paging.search_category}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
[다음]
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="pet_all_search?page=${paging.page+1}&search_content=${paging.search_content}
	&search_category=${paging.search_category}">[다음]</a>
</c:if>
</div>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>