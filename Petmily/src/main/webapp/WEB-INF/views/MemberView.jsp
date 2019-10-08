<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
/*#myview {
	margin: 0 auto;
	display: table;
	text-align-last: justify;
	text-align-last: center;
}

tr, td {
	width: 250px;
	height: 80px;
	font-size: x-large;
}*/

#modi {
	margin: 0 auto;
	display: table;
	font-size: x-large;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left:850px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}
table {
    float : center;
    width: 1800px;
    border-top: 1px solid black;
    text-align: center;
    margin-left: auto; 
    margin-right: auto;
}
.myview th{
    border-top:3px solid black;
    border-bottom: 1px solid #DDDDDD;
    padding: 10px;
     text-align:center;
}
 .myview td{
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
                        <h2>마이페이지 - 내 정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
	<table class="myview">

		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰</th>
			<th>생년월일</th>
			<th>우편번호</th>
			<th>도로명주소</th>
			<th>지번주소</th>
			<th>상세주소</th>
			<th>이메일</th>
		</tr>
		<tr>
			<td>${memberView.id}</td>
			<td>${memberView.name}</td>
			<td>${memberView.phone}</td>
			<td>${memberView.birth}${sessionBirthday.birthday}</td>
			<td>${memberView.address_number}</td>
			<td>${memberView.address_a}</td>
			<td>${memberView.address_b}</td>
			<td>${memberView.address_c}</td>
			<td>${memberView.email}${sessionEmail.email}</td>
		</tr>
	</table>
	<br>
	<br>
	<a href="Mypage_MyDataModify?id=${memberView.id}" class="btn original-btn"
		id="modi">회원 정보 수정</a>
		<br>
		<br>
	<%@include file="footer-area.jsp"%>
</body>
</html>