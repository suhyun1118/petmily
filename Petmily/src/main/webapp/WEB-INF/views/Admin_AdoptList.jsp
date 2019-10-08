<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/*.adopt{
	text-align:center;
	margin:0 auto;
}*/
h1{
	text-align:center;
}
body{
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
 
.adopt th{
   border-top:3px solid black;
    border-bottom: 1px solid #DDDDDD;
    padding: 10px;
     text-align:center;
}
  
.adopt td{
    border-bottom: 1px solid ;
     text-align:center;
      padding: 5px;
      padding-bottom: 10px;
  
}
.adopt #zezezezegfgtd:hover {
  background-color: #ddd;
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
                        <h2>관리자 - 분양 신청 현황</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
<table class="adopt">
<tr>
<th>신청자 아이디</th><th>신청글 번호</th><th>펫 번호</th><th>펫 종류</th><th>펫 종</th><th>신청자</th><th>신청 날짜</th><th>관리자 승인 여부</th>
</tr>
<c:forEach var="aList" items="${aList}">
<tr>
<td>${aList.a_id}</td>
<td>${aList.a_number}</td>
<td>${aList.a_petnumber}</td>
<td>${aList.a_petcategorie}</td>
<td>${aList.a_petname}</td>
<td>${aList.a_name}</td>
<td>${aList.a_Date}</td>
<c:if test="${aList.a_confirm eq '1' && aList.a_adminconfirm eq '0'}">
<td><a href="admin_AdoptOk?a_number=${aList.a_number}">승인</a></td>
</c:if>
<c:if test="${aList.a_confirm eq '1' && aList.a_adminconfirm eq '1'}">
<td><p>승인 완료</p></td>
</c:if>
</tr>
</c:forEach>
</table>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>