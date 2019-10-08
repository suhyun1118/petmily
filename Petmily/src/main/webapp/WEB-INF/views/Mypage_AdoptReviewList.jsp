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

table {
      float : center;
    width: 1200px;
    border-top: 1px solid black;
    text-align: center;
    margin-left: auto; 
    margin-right: auto;
}
.myadopt th{
   border-top:3px solid black;
    border-bottom: 1px solid #DDDDDD;
    padding: 10px;
     text-align:center;
}
 .myadopt td{
    border-bottom: 1px solid ;
     text-align:center;
      padding: 5px;
      padding-bottom: 10px;
  
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
                        <h2>마이페이지 - 입양 후기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
<table class="myadopt">
<tr>
<th>후기글 번호</th><th>아이디</th><th>미리보기</th><th>펫 번호</th><th>펫 종류</th><th>펫 종</th><th>작성자</th><th>제목</th><th>후기 내용</th><th>작성날짜</th><th>조회수</th>
</tr>
<c:forEach var="My_arList" items="${My_arList}">
<tr>
<td>${My_arList.ar_number}</td>
<td>${My_arList.ar_id}</td>
<td><img src="${pageContext.request.contextPath}/resources/adopt/${My_arList.adoptFileName}" width="100px" height="100px"></td>
<td>${My_arList.pet_number}</td>
<td>${My_arList.pet_kategorie}</td>
<td>${My_arList.pet_name}</td>
<td>${My_arList.ar_writer}</td>
<td>${My_arList.ar_title}</td>
<td><a href="ar_view?ar_number=${My_arList.ar_number}&page=1">${My_arList.ar_contents}</a></td>
<td>${My_arList.ar_writedate}</td>
<td>${My_arList.ar_viewhit}</td>
</tr>
</c:forEach>
</table>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>