<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.supp{
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

.asdfagaga{
text-align:center;

}



</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 좋아요 */
function like_func(num){
 
console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
var pet_number = num;
  $.ajax({
	type: "GET",
    url: "liketo",
    data:{"pet_number" : pet_number},
     dataType: "text",
    success: function(data){
    	var output ="";
    if(data =="1"){
    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투투.png'>";
    	} else { 
    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투.JPG'>";
    }      
    $("#a").html(output);
    },
    error: function(){
      alert("아주뭔가 잘못이야");
    }
  });
}

/* 분ㅇ양추천 취소 */
function like_func2(num){
 console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
 var pet_number = num;
  $.ajax({
	type: "GET",
    url: "likecancle",
    data:{"pet_number" : pet_number},
     dataType: "text",
    success: function(data){
    	var output ="";
    if(data =="0"){
    	output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투.JPG'>";
    	} 
    
    if(data =="1"){
    		output += "<img src='"${pageContext.request.contextPath}+"/resources/petUploadFile/하투투.png'>";
    }      
    $("#a").html(output);
    },
    error: function(){
      alert("아주뭔가 잘못이야2");
    }
  });
}

</script>
</head>
<body>
<%@include file="header-area.jsp"%>
<div class="asdfagaga">
<h2>소형견 리스트  </h2>
<a href="Pet_name?pet_name=포메라니안">포메라니안</a>
<a href="Pet_name?pet_name=치와와">치와와</a>
<a href="Pet_name?pet_name=미니핀">미니핀</a>
<a href="Pet_name?pet_name=파피용">파피용</a>
<a href="Pet_name?pet_name=토이푸들">토이푸들</a>
<a href="Pet_name?pet_name=닥스훈트">닥스훈트</a>
<a href="Pet_name?pet_name=요크셔테리어">요크셔테리어</a>
<a href="Pet_name?pet_name=말티즈">말티즈</a>
<a href="Pet_name?pet_name=비숑프리제">비숑프리제</a>
<a href="Pet_name?pet_name=슈나우저">슈나우저</a>
<a href="Pet_name?pet_name=시츄">시츄</a>
<a href="Pet_name?pet_name=아펜핀셔">아펜핀셔</a>
</div>
<c:forEach var="List" items="${Pet_Dog_List}">
<div class="supp">
<a href="Pet_Dog_View?pet_number=${List.pet_number}&page=1"><img style="width:300px; height:400px;"src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>

<c:choose>
<c:when test="${(sessionScope.sessionHit eq '1')}">
<a href="javascript:like_func2(${List.pet_number});"><img style="width:10px; height :20px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투투.png">${List.pet_hit}</a>
</c:when>
<c:otherwise>
<a href="javascript:like_func(${List.pet_number});"><img style="width : 10px; height :20px;" src="${pageContext.request.contextPath}/resources/petUploadFile/하투.JPG">${List.pet_hit}</a><br>
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


</body>
</html>