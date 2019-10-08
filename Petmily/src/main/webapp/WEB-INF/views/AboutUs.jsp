
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Petmily</title>

</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBt5_aiC-EvW15AysqqNwsr912NBpybnDk&callback=initMap"></script>     
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94955528495edea0c3e6aaf23f6c337b"></script>

<body>
     <!-- ##### Header Area  ##### -->
   <%@include file="header-area.jsp" %>
<br>
    <!-- Preloader -->
    <div id="preloader">
        <div class="preload-content">
            <div id="original-load"></div>
        </div>
    </div>



    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/LUI7.jpeg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>회사 소개</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->
    
     <!-- ##### Blog Wrapper Start ##### -->
    <div class="blog-wrapper section-padding-100-0 clearfix">
        <div class="container">
            <div class="row align-items-end">
                <!-- Single Blog Area -->
                <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content">
                            <div class="line"></div>
                            <a href="#" class="post-tag">Petmily</a>
                            <h4><a href="#" class="post-headline"><strong>Welcome to Petmily</strong></a></h4>
                            <p class="mb-3">2019년 반려동물 산업을 시작으로 국내 최초 안락사없는 유기동물 보호소 "팻밀리"를 설립 및 운영하며 대한민국 반려 동물 산업에 지속적인 향후 발전방안을 끈입없이 고민하고 실천하는 반려동물분야의 선두업체로 자리매김하고 있습니다. 팻밀리에서는 설립 당시 모토는 유지하며 반려동물들의 행복과 동시에 고객만족을 위해 항상 변화하며 발전을 위하여 노력을 기울이고 있습니다. 건강하고 올바른 반려동물문화를 지향하고 항상 처음과 같이 곧은 길로 나아가고자 지속적인 노력에 힘을 기울이고 있습니다.</p>
                        </div>
                    </div>
                </div>
                <!-- Single Blog Area -->
                <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content">
                            <p class="mb-3">팻밀리는 반려동물이 고객님의 가족이 되기까지 최고의 환경에서 항상 좋은 컨디션을 유지할 수 있도록, 아가들과 365일 같은 공간에서 정성을 다해 케어하고 있습니다. 반려동물에게 온전한 사랑을 주신다면, 고객님의 삶에 언제나 함께 할 평생의 동반자가 될 것입니다. 반려동물을 사랑하는 모든 분들께 귀한 인연을 이어드리고, 고객님과 반려동물의 따뜻함과 행복, 그리고 가슴저린 순간까지 모든 것을 사랑하고 지원하며 동행할 것을 약속 드립니다. 팻밀리에 방문하셔서 건강하고 이쁜 애완동물 많이 분양하시기 바랍니다. 항상 고객님의 만족을 최우선으로 언제나 노력하는 팻밀리가 되도록 노력하겠습니다.</p>
                        </div>
                    </div>
                </div>
                <!-- Single Blog Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-catagory-area clearfix mb-100">
                        <img src="${pageContext.request.contextPath}/resources/img/bg-img/kamja13.jpeg" alt="">
                        <!-- Catagory Title -->
                      <!--   <div class="catagory-title">
                            <a href="#">Lifestyle posts</a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Blog Wrapper End ##### -->

   

    <!-- ##### Cool Facts Area Start ##### -->
    <div class="cool-facts-area section-padding-100-0 bg-img background-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/kamja13.jpeg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="single-blog-area blog-style-2 text-center mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content">
                            <div class="line"></div>
                            <a href="#" class="post-tag">Petmily</a>
                            <h4><a href="#" class="post-headline">Welcome to Petmily</a></h4>
                            <p>2019년 반려동물 산업을 시작으로 국내 최초 안락사없는 유기동물 보호소 "팻밀리" 를 설립 및 운영하며 대한민국 반려 동물 산업에 지속적인 향후 발전방안을 끈입없이 고민하고 실천하는 반려동물분야의 선두업체로 자리매김하고 있습니다. 팻밀리에서는 설립 당시 모토는 유지하며 반려동물들의 행복과 동시에 고객만족을 위해 항상 변화하며 발전을 위하여 노력을 기울이고 있습니다. 건강하고 올바른 반려동물문화를 지향하고 항상 처음과 같이 곧은 길로 나아가고자 지속적인 노력에 힘을 기울이고 있습니다.

팻밀리는 반려동물이 고객님의 가족이 되기까지 최고의 환경에서 항상 좋은 컨디션을 유지할 수 있도록, 아가들과 365일 같은 공간에서 정성을 다해 케어하고 있습니다. 반려동물에게 온전한 사랑을 주신다면, 고객님의 삶에 언제나 함께 할 평생의 동반자가 될 것입니다. 반려동물을 사랑하는 모든 분들께 귀한 인연을 이어드리고, 고객님과 반려동물의 따뜻함과 행복, 그리고 가슴저린 순간까지 모든 것을 사랑하고 지원하며 동행할 것을 약속 드립니다. 팻밀리에 방문하셔서 건강하고 이쁜 애완동물 많이 분양하시기 바랍니다. 항상 고객님의 만족을 최우선으로 언제나 노력하는 팻밀리가 되도록 노력하겠습니다.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100">
                        <h2><span class="counter">2019.09</span></h2>
                        <p>Since</p>
                    </div>
                </div>
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100">
                        <h2><span class="counter">12</span>K</h2>
                        <p>Instargram Followers</p>
                    </div>
                </div>
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100">
                        <h2><span class="counter">4</span></h2>
                        <p>Team members</p>
                    </div>
                </div>
                <!-- Single Cool Facts Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-facts-area text-center mb-100">
                        <h2><span class="counter">2019.10</span></h2>
                        <p>End</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Cool Facts Area End ##### -->
<div class="blog-wrapper section-padding-100-0 clearfix">
        <div class="container">
            <div class="row align-items-end">
                <!-- Single Blog Area -->
                <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content">
                            <div class="line"></div>
                            <a href="#" class="post-tag">Petmily</a>
                            <h4><a href="#" class="post-headline"><strong>오시는길</strong></a></h4>
     <!--  <div id="kakaomap" style="width:500px;height:380px;"></div>        -->        
       <div id="googleMap" style="width:1100px;height:380px;"></div>  
                    <div style="width:1100px;height:120px;">
                    <br>
      <h5> Location. 인천 미추홀구 학익동 663-1 태승빌딩 5층</h5>
       <h5>TEL. 032-876-3332 </h5> 
       </div>     
                        </div>
                    </div>
                </div>
                <!-- Single Blog Area -->
            </div>
        </div>
    </div>
<!--  <script>
var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.438815, 126.675081), // 지도의 중심좌표
    level: 1 // 지도의 확대 레벨
};
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.438815, 126.675081); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    
</script> -->
<script>

function initialize() {

  var LatLng = new google.maps.LatLng(37.438815, 126.675081);

  var mapProp = {

    center: LatLng, // 위치

    zoom:19, // 어느정도까지 세세하게 볼 것인지.

    mapTypeId:google.maps.MapTypeId.ROADMAP

  };

  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

  var marker = new google.maps.Marker({

   position: LatLng,

   map: map,

  });

}

google.maps.event.addDomListener(window, 'load', initialize);

</script>
<br>
   <!-- ##### footer Area  ##### -->
   <%@include file="footer-area.jsp" %>
    
</body>

</html>