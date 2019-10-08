<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.myadopt{
	text-align:center;
	margin:0 auto;
}
h1{
	text-align:center;
}
.aBtn{
   width:140px;
   height:38px;
   border:none;
   background-color:#346aff;
   font-size:14px;
   font-weight:bold;
   color:#fff;
   cursor:pointer;
   outline:none;
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
                        <h2>마이페이지 - 분양 신청 현황</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
<table class="myadopt">
<tr>
<th>아이디</th><th>신청글 번호</th><th>펫 번호</th><th>펫 종류</th><th>펫 종</th><th>신청 이름</th><th>신청 날짜</th>
<th>처리상태</th><th>분양 후기</th>
</tr>
<c:forEach var="My_aList" items="${My_aList}">
<tr>
<td><input type="hidden" name="myid" value="${sessionId}">${My_aList.a_id}</td>
<td>${My_aList.a_number}</td>
<td>${My_aList.a_petnumber}</td>
<td>${My_aList.a_petcategorie}</td>
<td>${My_aList.a_petname}</td>
<td>${My_aList.a_name}</td>
<td>${My_aList.a_Date}</td>
<c:if test="${My_aList.a_confirm eq '1' && My_aList.a_adminconfirm eq '0'}">
<td><p>처리중</p></td>
</c:if>
<c:if test="${My_aList.a_confirm eq '1' && My_aList.a_adminconfirm eq '1'}">
<td><p>분양 완료</p></td>
<c:if test="${My_aList.ar_confirm eq '0'}">
<td>
<form action="goar_write" method="get">
		<input type="hidden" name="a_number" value="${My_aList.a_number}">
		<input type="hidden" name="pet_number" value="${My_aList.a_petnumber}">
		 <input type="hidden" name="pet_kategorie" value="${My_aList.a_petcategorie}"> 
		 <input type="hidden" name="pet_name" value="${My_aList.a_petname}"> 
		 <input type="hidden" name="ar_writer" value="${My_aList.a_name}">
		<button type="submit" class="aBtn">분양 후기 쓰러가기</button>
	</form>
</td>
</c:if>
<c:if test="${My_aList.ar_confirm eq '1'}">
<td><a href="#">분양 후기보러가기</a></td>
</c:if>
</c:if>
</tr>
</c:forEach>
</table>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>