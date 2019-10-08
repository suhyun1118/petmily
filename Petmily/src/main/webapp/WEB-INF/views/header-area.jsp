<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header-area</title>

<!-- Style CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css?ver=7">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=4">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/classy-nav.css?ver=4">
</head>
<style>
.searchcategory{
	width: 100px;
    height: 32px;
}
.searchform{
width:500px;
/*height:500px;*/
margin-left:380px;
}

.searchIn,
.BtnIn {
  position: relative;
  width: 200px;
  height: 50px;
  padding: 0;
  display: inline-block;
  float: left;
}
.BtnIn {
  z-index: 1;
  width: 50px;
  border: 0 none;
  background: #ceb980;
  cursor: pointer;
  border-radius: 0 5px 5px 0;  
  -webkit-transform: translate(-50px, 0);
      -ms-transform: translate(-50px, 0);
          transform: translate(-50px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}
.searchIn {
  color: #666;
  z-index: 2;
  border: 0 none;
  background-color: whitesmoke;
}
.searchIn:focus {
  outline: 0 none;
}
.searchIn:focus + .BtnIn {
  -webkit-transform: translate(0, 0);
      -ms-transform: translate(0, 0);
          transform: translate(0, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}
.searchIn:focus + .BtnIn .fa {
  -webkit-transform: translate(0px, 0);
      -ms-transform: translate(0px, 0);
          transform: translate(0px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  color: #fff;
}
.fa-search {
  font-size: 1.4rem;
  color: #29abe2;
  z-index: 3;
  top: 25%;
  -webkit-transform: translate(-190px, 0);
      -ms-transform: translate(-190px, 0);
          transform: translate(-190px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
  -webkit-transition: all 0.1s ease-in-out;
          transition: all 0.1s ease-in-out;
}
.select{
	float:left;
	margin-right:60px;
	width:100px;
	height:50px;
}

</style>
<body>

	<!-- 로그인 모달창 -->
	<div class="subscribe-newsletter-area">
		<div class="modal fade" id="subsModal" tabindex="-1" role="dialog"
			aria-labelledby="subsModal" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-body">
						<!--  <h5 class="title">Login</h5> -->
						<form action="Login_Login" class="newsletterForm" method="post">
							ID <input type="text" name="id" id="id" placeholder="아이디"
								required> PASSWORD <input type="password"
								name="password" id="password" placeholder="비밀번호" required>
							<button type="submit" class="btn original-btn">Login</button>
						</form>
					</div>
					<a href="Join_Naverlogin" class="btn original-btn">네이버 로그인 하러가기</a>
					<a href="/petmily/find_id_fromJSP" class="btn original-btn">아이디
						찾기</a> <a href="/petmily/find_pw_fromJSP" class="btn original-btn">비밀번호
						찾기</a> <input type="button" class="btn original-btn" onclick="join();"
						value="회원가입">
				</div>
			</div>
		</div>
	</div>

	<header class="header-area">



		<!-- Top Header Area -->
		<div class="top-header">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<!-- Breaking News Area -->
					<div class="col-12 col-sm-8">
						<div class="breaking-news-area">
							<div id="breakingNewsTicker" class="ticker">
								<ul>
									<li><a href="#">최대 20%할인!</a></li>
									<li><a href="#">새로운 펫 입소</a></li>
									<li><a href="#">펫 분양시 사은품 증정!</a></li>
									<li><a href="#">두 마리 입양시 추가할인</a></li>
									<li><a href="#">04.25 ~ 10.18 멤버쉽</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Top Menu Area -->
					<div class="col-12 col-sm-4">
						<div class="top-social-area" style="width: 400px;">

							<c:choose>

								<c:when test="${not empty sessionScope.sessionId}">
									<a>'${sessionScope.sessionId}'님 환영합니다! </a>
									<a href="Login_LoginOut">로그아웃</a>
									<c:if test="${sessionScope.sessionId ne 'admin'}">
										<a href="Mypage" class="btn subscribe-btn" title="마이페이지">Mypage</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<a href="JoinForm" class="btn subscribe-btn"
										data-placement="bottom" title="회원가입">Join</a>
									<a href="#" class="btn subscribe-btn" data-toggle="modal"
										data-target="#subsModal" title="로그인">Login</a>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Logo Area -->
		<div class="logo-area text-center">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
					<br>
					<br>
						<a href="http://localhost:8090/petmily/" class="original-logo"><img
							src="${pageContext.request.contextPath}/resources/logo/mainlogo.png"></a>
							<br>
							<br>
				<div class="searchform">
                    <form action="pet_all_search">
                      	  <select name="search_category" class="select">
                              <option selected ="selected">선택</option>
                                       <option value="pet_name">품종</option>
                                       <option value="item_name">상품명</option>
                              </select>
                              <input type="hidden" name="page" value="1">
                        <input type="search"  name="search_content" class="searchIn"/>
                        <button type="submit" class="BtnIn"><i class="fa fa-search"></i></button>
					</form>
				</div>
<br>
<br>
<br>
                           </div>
                     </div>
                     
					</div>
				</div>
			</div>
		</div>

		<!-- Nav Area -->
		<div class="original-nav-area" id="stickyNav">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Classy Menu -->
					<nav class="classy-navbar justify-content-between">

						<!-- Subscribe btn -->
						<div class="subscribe-btn">
							<a href="#" class="btn subscribe-btn" data-toggle="modal"
								data-target="#subsModal">1:1 문의</a>
						</div>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu" id="originalNav">
							<!-- close btn -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<c:if test="${sessionScope.sessionId eq 'admin'}">
										<li><a href="#">Admin</a>
											<ul class="dropdown">
												<li><a href="Shop_InputPage">펫 용품 등록</a></li>
												<li><a href="admin_pet">펫 등록</a></li>
												<li><a href="admin_adoptList?page=1">분양 신청 현황 내역</a></li>
											</ul></li>
									</c:if>


									<li><a href="#">About</a>
										<ul class="dropdown">
											<li><a href="aboutUs">회사 소개</a></li>
											<li><a href="NoticeList?page=1">공지사항</a></li>
										</ul></li>

									<li><a href="#">Pets</a>
										<ul class="dropdown">
											<li><a href="AdoptionprocedureJsp">분양 안내</a></li>
											<li><a href="ApplicationJSP">분양 절차</a></li>
											<li><a href="Pet_Dog_List?page=1">강아지</a>
												<ul class="dropdown">
													<li><a href="Pet_Dog_Listall?page=1&pet_size=대형견">대형견</a></li>
													<li><a href="Pet_Dog_Listall?page=1&pet_size=중형견">중형견</a></li>
													<li><a href="Pet_Dog_Listall?page=1&pet_size=소형견">소형견</a></li>
												</ul>
											<li><a href="Pet_List?page=1&pet_kategorie=고양이">고양이</a></li>

											<li><a href="Pet_List?page=1&pet_kategorie=파충류">파충류</a></li>
										</ul></li>
									<li><a href="Shop_List">Pet Shop</a>
										<ul class="dropdown">

											<li><a href="pet_Item?item_kind=강아지 용품">강아지 용품</a>
												<ul class="dropdown">

													<li><a
														href="pet_Items?item_kind=강아지 용품&item_katagorie=장난감">강아지
															장난감</a></li>

													<li><a
														href="pet_Items?item_kind=강아지 용품&item_katagorie=미용">강아지
															미용용품</a></li>

													<li><a
														href="pet_Items?item_kind=강아지 용품&item_katagorie=옷/잡화">강아지
															옷/잡화</a></li>

													<li><a
														href="pet_Items?item_kind=강아지 용품&item_katagorie=사료">강아지
															사료</a></li>

													<li><a
														href="pet_Items?item_kind=강아지 용품&item_katagorie=기타">기타</a></li>

												</ul></li>

											<li><a href="pet_Item?item_kind=고양이 용품">고양이 용품</a>
												<ul class="dropdown">
													<li><a
														href="pet_Items?item_kind=고양이 용품&item_katagorie=장난감">고양이
															장난감</a></li>
													<li><a
														href="pet_Items?item_kind=고양이 용품&item_katagorie=미용">고양이
															미용용품</a></li>
													<li><a
														href="pet_Items?item_kind=고양이 용품&item_katagorie=옷/잡화">고양이
															옷/잡화</a></li>
													<li><a
														href="pet_Items?item_kind=고양이 용품&item_katagorie=기타">기타</a></li>
												</ul></li>

											<li><a href="#">파충류 용품</a>
												<ul class="dropdown">
													<li><a href="#">파충류 장난감</a></li>
													<li><a href="#">파충류 미용용품</a></li>
													<li><a href="#">파충류 옷/잡화</a></li>
												</ul></li>
										</ul></li>

									<li><a href="#">Story</a>
										<ul class="dropdown">
											<li><a href="#">Q & A</a></li>
											<li><a href="ar_list?page=1">입양 후기</a></li>
										</ul></li>

									<li><a href="#">All Menu</a>
										<div class="megamenu">
											<ul class="single-mega cn-col-4">
												<li class="#"><b>&nbsp;About</b></li>
												<hr>
												<li><a href="aboutUs">▶ 회사 소개</a></li>
											<li><a href="NoticeList?page=1">▶ 공지사항</a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="#"><b>&nbsp;Pets</b></li>
													<hr>
												<li><a href="AdoptionprocedureJsp">▶ 분양 안내</a></li>
												<li><a href="ApplicationJSP">▶ 분양 절차</a></li>
												<li><a href="Pet_Dog_List?page=1">▶ 강아지</a>
													<li><a href="Pet_Dog_Listall?page=1&pet_size=대형견">&nbsp;&nbsp;&nbsp;>대형견</a></li>
													<li><a href="Pet_Dog_Listall?page=1&pet_size=중형견">&nbsp;&nbsp;&nbsp;>중형견</a></li>
													<li><a href="Pet_Dog_Listall?page=1&pet_size=소형견">&nbsp;&nbsp;&nbsp;>소형견</a></li>
													<li><a href="Pet_List?page=1&pet_kategorie=고양이">▶ 고양이</a></li>
													<li><a href="Pet_List?page=1&pet_kategorie=파충류">▶ 파충류</a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="#"><b>&nbsp;Pet Shop</b></li>
													<hr>
												<li><a href="pet_Item?item_kind=강아지 용품">▶ 강아지 용품</a></li>
												<li><a href="pet_Items?item_kind=강아지 용품&item_katagorie=장난감">&nbsp;&nbsp;&nbsp;>강아지 장난감</a></li>
												<li><a href="pet_Items?item_kind=강아지 용품&item_katagorie=미용">&nbsp;&nbsp;&nbsp;>강아지 미용용품</a></li>
												<li><a href="pet_Items?item_kind=강아지 용품&item_katagorie=옷/잡화">&nbsp;&nbsp;&nbsp;>강아지 옷/잡화</a></li>
												<li><a href="pet_Items?item_kind=강아지 용품&item_katagorie=사료">&nbsp;&nbsp;&nbsp;>강아지 사료</a></li>
												<li><a href="pet_Items?item_kind=강아지 용품&item_katagorie=기타">&nbsp;&nbsp;&nbsp;>기타</a></li>
												<li><a href="pet_Item?item_kind=고양이 용품">▶ 고양이 용품</a></li>
												<li><a href="pet_Items?item_kind=고양이 용품&item_katagorie=장난감">&nbsp;&nbsp;&nbsp;>고양이 장난감</a></li>
												<li><a href="pet_Items?item_kind=고양이 용품&item_katagorie=미용">&nbsp;&nbsp;&nbsp;>고양이 미용용품</a></li>
												<li><a href="pet_Items?item_kind=고양이 용품&item_katagorie=옷/잡화">&nbsp;&nbsp;&nbsp;>고양이 옷/잡화</a></li>
												<li><a href="pet_Items?item_kind=고양이 용품&item_katagorie=기타">&nbsp;&nbsp;&nbsp;>기타</a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="#"><b>&nbsp;Story</b></li>
													<hr>
												<li><a href="#"><strong>▶ Q & A</strong></a></li>
												<li><a href="ar_list?page=1"><strong>▶ 입양 후기</strong></a></li>
											</ul>
										</div></li>
								</ul>

						   <!-- Search Form  -->
                     <!-- Widget Area
                        <div class="sidebar-widget-area">
                            <form action="#" class="search-form">
                                <input type="search" name="search" id="searchForm" placeholder="Search">
                                <input type="submit" value="submit">
                            </form>
                        </div> -->

							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
</body>
</html>