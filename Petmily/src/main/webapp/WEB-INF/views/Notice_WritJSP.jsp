<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//이미지 정보들을 담을 배열
function fileInfo(f){
	
	var file = f.files; 
	 var review_File = $("#notice_FILE").val();
	 for(var i=0; i<file.length; i++){
  	var review_File =new FileReader(); 
		review_File.onload = function(rst){
			$('#img_box').append('<img src="' + rst.target.result + '">'+"<br>");
			}
		review_File.readAsDataURL(file[i]); 
		}
		
	
	  }

</script>
</head>
<body>
<%@include file="header-area.jsp"%>
<br>
 <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/titleimage.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcumb-content text-center">
                        <h2>공지사항 등록</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
    

<form action="admin_Notice_Writ" method="post" enctype="multipart/form-data">
제목 : <input type="text" name ="notice_title"><br>
작성자 : <input type="text" name ="notice_writer"><br>
본문 내용 : 
<textarea rows="5" cols="30" name ="notice_contents" placeholder="소개내용"></textarea><br>
<div style="text-align:center; margin:0 0 100px 0; background:whilt; line-height:60px;">
본문 이미지 :  <input type="file" name ="notice_filename" id ="notice_filename"
 style= "width:500px;" onchange="fileInfo(this)"><br>
 <div id="img_box"></div>
 
 </div>
  <input type="submit" value="공지사항올리기"><br>
</form>

<%@include file="footer-area.jsp"%>
</body>
</html>