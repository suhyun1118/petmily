<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
a{
	text-align:center;
}
.writer{
	position: relative;
    display: block;
    font-size: 15px;
}
.title{
	font-size:30px;
	color:#4b6398;
}
.date{
	position: relative;
    display: block;
    font-size: 15px;
    color:dimgrey;
}
.navcontent{
	margin-left:200px;
}
.golist{
	margin-left:900px;
}
hr{
	width:1500px;
}
.contents{
	font-size:30px;
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
	<div class="navcontent">
			<div class="title"><strong>${arView.ar_title}</strong></div><br>
			<hr>
			<div class="writer">${arView.ar_writer}  ${arView.pet_kategorie} ${arView.pet_name}</div>
			<div class="date">${arView.ar_writedate} 조회수 ${arView.ar_viewhit}</div><br>
			<div><img src="${pageContext.request.contextPath}/resources/adopt/${arView.adoptFileName}" width="500px" height="450px"></div>
			<br><div class="contents">${arView.ar_contents}</div>
	<br>
	</div>
 	<a class="golist" href="ar_list?page=${page}">목록으로</a><br>
	<br>
	<%@include file="footer-area.jsp"%>
</body>
</html>