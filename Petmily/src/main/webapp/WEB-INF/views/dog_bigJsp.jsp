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
fdisplay:block;
border: 8px solid #FF6464;
border-radius: 10px;
margin : 30px;
clear : nono;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
float : left;
}
.ca a:hover{
display:block;
margin : 30px;
float : left;
clear : nono;
border: 8px solid #800080;
border-radius: 10px;
-moz-border-radius: 7px;
-khtml-border-radius: 7px;
-webkit-border-radius: 7px;
margin : 30px;

}

.te{

text-align:center;


}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>

</head>
<body>
<jsp:include page="header-area.jsp" flush="true"></jsp:include>


<div class="te">
<h2>대형견 리스트  </h2>
<a href="Pet_name?pet_name=골든리트리버">골든리트리버</a>
<a href="Pet_name?pet_name=그레이트데인">그레이트데인</a>
<a href="Pet_name?pet_name=도베르만">도베르만</a>
<a href="Pet_name?pet_name=그레이트피레니즈">그레이트피레니즈</a>
<a href="Pet_name?pet_name=올드잉글리시쉽독">올드잉글리시쉽독</a>
<a href="Pet_name?pet_name=시베리안허스키">시베리안허스키</a>
<a href="Pet_name?pet_name=아이리쉬세터">아이리쉬세터</a>
<a href="Pet_name?pet_name=포인터">포인터</a>
<a href="Pet_name?pet_name=콜리">콜리</a>
<a href="Pet_name?pet_name=아프간하운드">아프간하운드</a>
</div>

<c:forEach var="List" items="${Pet_Dog_List}">

<div class="ca">
<a href="Pet_Dog_View?pet_number=${List.pet_number}&page=1&id=${sessionScope.sessionId}"><img style="width:300px; height:400px;" src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>

<c:choose>
<c:when test="${(sessionScope.sessionHit eq '1')}">
<a href="javascript:like_func2(${List.pet_number});"><img style="width:50px; height :40px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투투.png">${List.pet_hit}</a><br>
</c:when>
<c:otherwise>
<a href="javascript:like_func(${List.pet_number});"><img style="width :50px; height :40px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투.JPG">${List.pet_hit}</a>
</c:otherwise>
</c:choose>
${List.pet_name}
</div>
</c:forEach>

<c:if test="${paging.page<=1}">
	[이전]&nbsp; 
	
</c:if>
<c:if test="${paging.page>1}">
	<a href="Pet_Dog_Listall?page=${paging.page-1}&pet_size=${paging.pet_size}">[이전]</a>
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	<c:choose>
	
		<c:when test="${i eq paging.page}">
			${i}
		</c:when>
		<c:otherwise> 
		<a href="Pet_Dog_Listall?page=${i}&pet_size=${paging.pet_size}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
[다음]
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="Pet_Dog_Listall?page=${paging.page+1}&pet_size=${paging.pet_size}">[다음]</a>
</c:if>
<%@include file="footer-area.jsp"%>
</body>
</html>