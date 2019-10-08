<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.review-textArea {
	width: 100%;
	height: 146px;
	resize: none;
	background-color: #f2f4f8;
}

.checkboxTitle{
	width: 300px;
	display: inline-block;
	float:right;
}
.checkbox{
	width: 300px;
	display: inline-block;
	float:right;

}
.subTitle{
	margin-left: 117px;
}
.reviewimg{
	margin-left:400px;
}
.itemname{
	margin-left:100px;
	font-size:28px;
	color:grey;
}
.purreview{
	margin-left:400px;
}
#InputImg{
	margin-left:100px;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 사진미리보기 */
var sel_files= [];

$(document).ready(function(){
		$("#InputImg").on("change",handleImgsFilesSelect);
});

function handleImgsFilesSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var img_html = "<img src=\""+e.target.result+"\" width='150px;'/>";
			$(".imgs_wrap").append(img_html);
		}
		reader.readAsDataURL(f);
	});
}



</script>

<body>
	<%@include file="header-area.jsp"%>

 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>상품 리뷰 작성</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>	
<hr>
	<ul>
		<li><img
			src="${pageContext.request.contextPath}/resources/shopIMG/${purchase.item_profile}"
			width="500px" height="450px" class="reviewimg"/>&nbsp;&nbsp;&nbsp;<strong class="itemname">${purchase.item_name}</strong>

		</li>
	</ul>
	<hr>

	<!-- 구매후기 작성란 -->
	<form action="write_review" method="post" enctype="multipart/form-data" class="purreview">
		<table class="review_table">
				<tr><td><strong>후기 내용</strong></td></tr>
					<br>
					<tr><td><textArea name="review_contents" class="review-textArea"
							rows="8" cols="70" placeholder="자세한 구매후기는 고객의 구매에 많은 도움이 됩니다."></textArea></td>
				</tr>
				<!-- 사진 첨부 -->
				<tr>
					<td><strong>사진 첨부 </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input multiple="multiple"
						type="file" name="inputImages" id="InputImg"></td>
					<td> <div class="imgs_wrap" > </div> </td>	
				</tr>
			<tr>
				<!-- 상품 평가 -->
				<tr><td>
				<strong>평가</strong></td></tr>
				
				<tr><td>
				<div class="checkboxTitle">
					<strong>디자인</strong></div>
					</td></tr>
					<br>
					<tr><td>
					<div class="checkbox">
						<input type="radio" name="review_design" value="아주 마음에 들어요"/> 아주마음에 들어요<br/>
						<input type="radio" name="review_design" value="마음에 들어요"/> 마음에 들어요<br/>
						<input type="radio" name="review_design" value="마음에 들지 않아요"/> 마음에 들지 않아요
					</div>
						</td></tr>
						
					<tr><td>
					<div class="checkboxTitle">
						<strong>편리성</strong></div>
					</td></tr>
					<br>
						<tr><td>
					<div class="checkbox">
						<input type="radio" name="review_handiness" value="사용하기 편리해요"/> 사용하기 편리해요<br/>
						<input type="radio" name="review_handiness" value="그저 그래요"/> 그저 그래요<br/>
						<input type="radio" name="review_handiness" value="사용하기 불편해요"/> 사용하기 불편해요
					</div>
						</td></tr>
		</table>
		<br>
						<input type ="hidden" name= item_number value="${purchase.item_number }"/>
						<input type="submit" value="리뷰등록" class="inputBtn"/>
	</form>









	<%@include file="footer-area.jsp"%>
</body>
</html>