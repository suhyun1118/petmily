<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
#btn {
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

#btn:hover {
   color: white;
   background-color: skyblue;
}
.reviewImg{
   display : flex;
}
.reviewSubTitle{
   margin-right : 35px;
   font-size:20px;
   color:#8c8686;
}
.itemImg{
	float:left;
	margin-left:350px;
}
.iteminfor{
	/*width:70%;*/
	height:350px;
	margin-left:1000px;
	margin-top:150px;
}
.iteminfo{
    margin-left: 800px;
}
.iteminfoImg{
	height:auto;
}
.itemreview{
	margin-left:200px;
}
.reviewh1{
	width:1600px;
	height:70px;
	font-size:50px;
	margin-left:150px;
}
hr{
	width:1600px;
	margin-left:200px;
}
</style>


<body>
   <script>
      function buy(){
         
         if(${sessionScope.sessionId == null}){
            alert("로그인 후 이용 가능합니다 !");
            
         }else{
            location.href="Item_Buy?item_number=${Item.item_number}&id=${sessionId}";
         }
         
      }
    </script>


   <%@include file="header-area.jsp"%>
   <br>
     <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>상품 상세보기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
   <img
      src="${pageContext.request.contextPath}/resources/shopIMG/${Item.item_Profile}"
      width="500px" height="400px" class="itemImg"/>
      <div class="iteminfor">
   <h2>${Item.item_name}</h2>
   <br>
   <br>
   <br>
   <p>${Item.item_reviewCount}개상품평</p>
   <strong>${Item.item_price}원</strong>
   <button onclick="buy();" class="inputBtn">구매하기</button>
   </div>
   <hr>
   <br>
   <br>
<div class="iteminfo">
   <c:forEach items="${multyImg}" var="multyImg">
      <img
         src="${pageContext.request.contextPath}/resources/shopIMG/multyImg/${multyImg.multiImg}"
         width="500px" class="iteminfoImg"/>
      <br>
      <br>
   </c:forEach>
</div>
<br>
<br>
   <input type="hidden" id="item_name" value="${Item.item_name }" />
   <input type="hidden" id="item_price" value="${Item.item_price }" />
   <hr>
   <h1 class="reviewh1">&nbsp;&nbsp;&nbsp;구매 후기</h1>
   <hr>
   <br>
   <br>
<div class="itemreview">
   <c:forEach items="${Review}" var="review">
      <!-- 구매후기 첨부파일 -->
      <div class="reviewImg">
      <c:forEach items="${reviewImg}" var="reviewImg" >
         <img src="${pageContext.request.contextPath}/resources/
            purchase_Review_IMG/${reviewImg}" width="300px;" height="250px;"><br>
      </c:forEach>
      </div>
      <br>
      <!--                -->
      <strong class="reviewSubTitle">디자인</strong>${review.review_design} <br>
      <strong class="reviewSubTitle">편리성</strong>${review.review_handiness} <br>
      <strong class="reviewSubTitle">한줄평</strong>${review.review_contents} <br>
   </c:forEach>
   </div>

<br>

   <%@include file="footer-area.jsp"%>
</body>
</html>