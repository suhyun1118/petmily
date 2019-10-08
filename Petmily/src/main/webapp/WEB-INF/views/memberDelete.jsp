<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2 {
	font-color: red;
	font-size: 22px;
}

#deleteform {
	margin: 0 auto;
	display: table;
	text-align: -webkit-right;
}

#fofo {
	font-size: 30px;
	text-align: center;
}
.buy {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: -3px;
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}

.buy:hover {
	color: #ddd;
	background-color: skyblue;
}

#gogo {
	font-size: x-large;
}
.inputB{
	width:300px;
	height:38px;
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
                        <h2>마이페이지 - 회원 탈퇴</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<br>
	<br>
	<h2 style="color: red;" id="fofo"><b>회원 탈퇴를 하게되면 모든 서비스를 이용할수없습니다.</b><br><br>
	그래도 진행하신다면 개인 정보를 위해 비밀번호를 입력해주세요.</h2>
	<br>
	<br>
	<form id="deleteform" name="deleteform" method="post"
		action="Mypage_Withdrawal" onsubmit="return checkValue()">
		
		아이디 &nbsp;<input class="inputB" name="id" value="${sessionId}" readonly><br>
		비밀번호 &nbsp;<input class="inputB" type="password" name="password" maxlength="50"> <br>
		
		<div id="gogo">
			<input type="submit" value="탈퇴" class="buy" /> 
			<input type="button" value="취소" onclick="location='home'" class="buy">
		</div>
		
	</form>
	
	<br>
	<br>
	<%@include file="footer-area.jsp" %>
</body>
</html>