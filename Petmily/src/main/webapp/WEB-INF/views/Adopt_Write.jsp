<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#adoptwrite{
	margin-top:100px;
	margin-left:680px;
}
.Btn{
	background-color: #ffffff;
    border-color: #33bcc5;
    color: #33bcc5;
    border-width: 1px;
    width:140px;
    height:38px;
}
input{
	width:285px;
	height:40px;
    border: 1px solid #787878;
    font-size: 13px;
    font-family: "Open Sans", sans-serif;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    color: #1f1e23;
    margin-bottom: 15px;
    padding: 0 25px;
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
                        <h2>분양 신청</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
<form action="a_write" method="post" id="adoptwrite">
<table>
<br>
<tr>
<td><b>신청자 아이디</b><br><input type="text" name="a_id" value="${sessionScope.sessionId}" readonly></td>
</tr>
<tr>
<td><b>신청자 이름 </b><br><input type="text" name="a_name" required></td>
</tr>
<tr>
<td><b>펫번호</b><br><input type="text" name="a_petnumber" value="${petNumber}" readonly></td>
</tr>
<tr>
<td><b>펫 종류</b><br><input type="text" name="a_petcategorie" value="${petCategorie}" readonly></td>
</tr>
<tr>
<td><b>펫 종</b><br><input type="text" name="a_petname" value="${petName}" readonly></td>
</tr>
<tr>
<td><b>분양 가격</b><br><input type="text" name="a_petprice" value="${petPrice}" readonly></td>
</tr>
<tr>
<td><input class="Btn" type="submit" value="예약신청">
<input class="Btn" type="reset" value="다시작성"></td>
</tr>
</table>
</form>
<br>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>