<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.inputBtn{
	margin-left: 860px;
}
#btn:hover {
	color: white;
	background-color: skyblue;
}

.buy {
	margin-left: 500px;
}
.Infor{
	width:1000px;
	border-style: solid;
    border-color: darkslategray;
}
hr{
	width:1000px;
	border-top: inset;
}
.total{
	width:1000px;
	font-size:30px;
	/*float: right;*/
	margin-left:600px;
}
.pay{
	width:1000px;
	font-size:20px;
	/*float: right;*/
	margin-left:600px;
}
.item{
	margin-left:100px;
}
.itemname{
	font-size:20px;
	color:dimgrey;
	width: 500px;
    margin-top: 85px;
    float: right;
}
.itemInformation{
	margin-left:100px;
}
h2{
	text-align:center;
}
.buyerInformation{
	/*text-align:center;*/
}
.hr1{
	width: 400px;
	margin-left:600px;
}
td{
	width:500px;
	height:300px;
}
.pricetotal{
	margin-left:460px;
	font-size:23px;
}
.img11{
	/*margin-left:150px;*/
}
.iteminfo{
	float: right;
    margin-top: -165px;
    margin-right: 250px;
    font-size:23px;
}
.Information{
	font-size:21px;
    line-height: 1.4;
    font-family: "helveticaneuemedium";
    margin-left:100px;
}
/*input{
	width:300px;
	height:38px;
}*/
strong{
	color:cadetblue;
}
/*.pay{
	width:auto;
	height:auto;
}*/
</style>
<body>
	<script>
      function buy() {

         if (document.querySelector('input[name="paymentOption"]:checked').value == "KakaoPay") {
            code = 'imp81171428';
         } else if (document
               .querySelector('input[name="paymentOption"]:checked').value == "신용/체크카드") {
            code = 'imp49323111';
         } else if(document
               .querySelector('input[name="paymentOption"]:checked').value == "휴대폰 결제"){
            code = 'imp20402335';
         }

         var itemName = document.getElementById("item_name").value
         var totalPrice = document.getElementById("totalPrice").value

         var IMP = window.IMP; // 생략가능
         IMP.init(code); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
         var msg;

         IMP.request_pay({
            pg : "Petmily", // 실제 계약 후에는 실제 상점아이디로 변경
            merchant_uid : 'merchant_' + new Date().getTime(),
            amount : totalPrice,
            name : itemName,
            buyer_email : '${member.email}',
            buyer_name : '${member.name}',
            buyer_tel : '${member.phone}',
            buyer_addr : '${member.address}',

         //m_redirect_url : 'http://www.naver.com'
         }, function(rsp) {
            if (rsp.success) {
               //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
               jQuery.ajax({
                  url : "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                  type : 'POST',
                  dataType : 'json',
                  data : {
                     imp_uid : rsp.imp_uid
                  //기타 필요한 데이터가 있으면 추가 전달
                  }
               }).done(function(data) {
                  //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                  if (everythings_fine) {
                     msg = '결제가 완료되었습니다.';
                     msg += '\n고유ID : ' + rsp.imp_uid;
                     msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                     msg += '\결제 금액 : ' + itemPrice;
                     msg += '카드 승인번호 : ' + rsp.apply_num;

                     alert(msg);
                  } else {
                     //[3] 아직 제대로 결제가 되지 않았습니다.
                     //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                  }
               });
               //성공시 이동할 페이지
               Delivery.submit();
            } else {
               msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
               //실패시 이동할 페이지
              /*  history.go(-1); */
               alert(msg);
            }
         });
      }
   </script>


	<%@include file="header-area.jsp"%>
		
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>상품 구매하기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
		<br>
		<br>
		<br>
	<div class="buy">
        <div class="Infor">
		<br>
		<h2>구매자 정보</h2>
		<br>
				<div class="Information">
				<strong>이름</strong>&nbsp;<input type="text" value="${member.name}" readonly><br>
				<strong>이메일</strong>&nbsp;<input type="text" value="${member.email}" readonly><br>
				<strong>휴대폰 번호</strong>&nbsp;<input type="text" value="${member.phone}" readonly>
				</div>
				<br>
		</div>
		
		<br>
		
		<div class="Infor">
		<br>
		<h2>상품 정보</h2>
		<br>
		
			<input type="hidden" value="${totalPrice}" id="totalPrice" />
		<input type="hidden" id="item_name" value="${item.item_name}">

			<div class="item"><img src="${pageContext.request.contextPath}/resources/shopIMG/${item.item_Profile}"
						width="200px" height="200px" class="img11" /></div>
						
		<div class="iteminfo">
		<h4 style="color:dimgrey;">&nbsp;${item.item_name}</h4><br>
		<strong>가격</strong><input type="hidden" id="Itemprice" value="${item.item_price}">&nbsp;${item.item_price}원<br>
		<strong>배송비</strong><input type="hidden" id="delivery" value=20000>&nbsp;20000원
		</div>
		<br>
		</div>
			
			<br>
		<form action="Item_Delivery" method="post" name="Delivery">
		<div class="Infor">
		<br>
		<h2>배송지 정보</h2>
		<br>
					<div class="Information">
					<strong>이름</strong>&nbsp;<input type="text" value="${member.name}" readonly><br>
					<strong>배송주소</strong>&nbsp;<input type="text" value="${member.address}" readonly><br>
					<strong>연락처</strong>&nbsp;<input type="text" value="${member.phone}" readonly><br>
					<strong>배송 요청사항</strong>&nbsp;
					<select name="deliveryRequest">
							<option value="문앞">문앞</option>
							<option value="직접 받고 부재 시 문 앞">직접 받고 부재 시 문 앞</option>
							<option value="경비실">경비실</option>
					</select>
					</div>
					
			<br>

			<input type="hidden" name="id" value="${member.id }" /> 
			<input type="hidden" name="name" value="${member.name }" />
			<input type="hidden" name="email" value="${member.email }" /> 
			<input type="hidden" name="address" value="${member.address }" /> 
			<input type="hidden" name="phone" value="${member.phone }" /> 
			<input type="hidden" name="item_name" value="${item.item_name}" id="item_name" /> 
			<input type="hidden" name="item_number"value="${item.item_number}" /> 
			<input type="hidden" name="deliveryPrice" value=20000 /> 
			<input type="hidden" name="item_price" value="${item.item_price }" /> 
			<input type="hidden" name="item_profile" value="${item.item_Profile }" />
			
		</div>
			<br>
			<br>
			<hr>
			<br>
			<div class="pricetotal"><strong>상품 가격</strong> &nbsp;${item.item_price}원 + <strong>배송비</strong>&nbsp;20000원 = ${totalPrice}원</div>
			<br>
			<hr>
			<br>
			<div class="total"><strong>총 결제금액</strong>&nbsp;
				<strong style="color: blue;">${totalPrice}</strong>원</div>
				
			
<br>
				<hr class="hr1">
				
				<div class="pay"><strong>결제방법</strong><br>
				<input type="radio" id="paymentOption" name="paymentOption" value="신용/체크카드" required>신용/체크카드 
				<input type="radio" name="paymentOption" value="KakaoPay" required>카카오페이
				<input type="radio" name="paymentOption" value="휴대폰 결제" required>휴대폰 결제
				</div>	
		</form>
				<hr class="hr1">
				<br>
		<button class="inputBtn" onclick="buy();">결제하기</button>
	</div>

	<%@include file="footer-area.jsp"%>
</body>
</html>