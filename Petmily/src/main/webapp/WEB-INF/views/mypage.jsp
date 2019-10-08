<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#mypage{
    margin: 0 auto;
    display: table;
    text-align: -webkit-center;
}
#mypage a{
	margin:20px;
}


</style>
<script>
function Mypage_Withdrawal(){
	location.href("")
}

</script>
<body>
<%@include file="header-area.jsp" %>
<br>
 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>마이페이지</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
<div id="mypage">
<a href="my_adoptlist" class="btn original-btn">분양 예약 현황</a>
<a href="purchase" class="btn original-btn">구매내역</a>
<a href="my_arlist" class="btn original-btn">내가 쓴 후기</a><br>
<a href="#" class="btn original-btn">내가 쓴 리뷰</a>
<a href="Mypage_MyData?id=${sessionId}" class="btn original-btn">회원 정보 보기</a>
<a href="memberdelete" class="btn original-btn">회원탈퇴</a>
</div>
<br>
<br>
<%@include file="footer-area.jsp" %>
</body>
</html>