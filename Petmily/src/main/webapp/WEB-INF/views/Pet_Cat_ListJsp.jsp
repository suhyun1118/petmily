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
float : left;

}
.gmd{ 
text-align:center;
}
.paging{
	margin-left:1000px;
}
.nav{
	margin-left:150px;
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
<br>
 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>고양이</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
<div class="gmd">
<a href="Pet_name?pet_name=페르시안">페르시안</a>
<a href="Pet_name?pet_name=메인쿤">메인쿤</a>
<a href="Pet_name?pet_name=브리티쉬쇼트헤어">브리티쉬쇼트헤어</a>
<a href="Pet_name?pet_name=먼치킨">먼치킨</a>
<a href="Pet_name?pet_name=시암고양이">시암고양이</a>
<a href="Pet_name?pet_name=아메리칸쇼트헤어">아메리칸쇼트헤어</a>
<a href="Pet_name?pet_name=랙돌">랙돌</a>
<a href="Pet_name?pet_name=아비시니안">아비시니안</a>
<a href="Pet_name?pet_name=러시안블루">러시안블루</a>
</div>

<div class="nav">
<c:forEach var="List" items="${Pet_List}">
<div class="caadfafaf">
<a href="Pet_Dog_View?pet_number=${List.pet_number}&page=1"><img style="width:400px; height:500px;"src="${pageContext.request.contextPath}/resources/petUploadFile/${List.pet_profile}"></a><br>

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

<div class="paging">
<c:if test="${paging.page<=1}">
	[이전]&nbsp; 
	
</c:if>
<c:if test="${paging.page>1}">
	<a href="Pet_Dog_Listall?page=${paging.page-1}&pet_kategorie=${pet_kategorie.pet_size}">[이전]</a>
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	<c:choose>
	
		<c:when test="${i eq paging.page}">
			${i}
		</c:when>
		<c:otherwise> 
		<a href="Pet_Dog_Listall?page=${i}&pet_kategorie=${pet_kategorie.pet_size}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
[다음]
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="Pet_Dog_Listall?page=${paging.page+1}&pet_kategorie=${pet_kategorie.pet_size}">[다음]</a>
</c:if>
</div>
<br>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>