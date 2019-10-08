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
	 var review_File = $("#pet_profile_file").val();
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
<style>
#writeform{
	margin-top:100px;
	margin-left:680px;
}
</style>
<body>

<%@include file="header-area.jsp"%>
<br>
<form action="ar_write" method="post" id="writeform" encType="multipart/form-data">
<table>
<h1>분양 후기</h1>
<br>
<tr>
<td> <b>작성자 아이디</b> <input type="text" name="ar_id" value="${sessionId}" readonly></td>
</tr>
<tr>
<td><b>분양신청글 번호</b><input type="text" name="a_number" value="${AdoptNumber}" readonly></td>
</tr>
<tr>
<td><b>펫 번호 </b><input type="text" name="pet_number" value="${AdoptPetNumber}" readonly></td>
</tr>
<tr>
<td><b>펫 종류 </b><input type="text" name="pet_kategorie" value="${AdoptPetCategorie}" readonly></td>
</tr>
<tr>
<td> <b>펫 종</b> <input type="text" name="pet_name" value="${AdoptPetName}" readonly></td>
</tr>
<tr>
<td> <b>작성자</b> <input type="text" name="ar_writer" value="${AdoptName}" readonly></td>
</tr>
<tr>
<td> <b>글 제목</b>  <input type="text" name="ar_title" required></td>
</tr>
<tr>
<td><b> 글 내용 </b><textarea cols="70" rows="5" name="ar_contents" required></textarea></td>
</tr>
<tr>
<td>
  <b>후기사진 </b> <input type="file" name ="adoptFile" id ="pet_img_file"
 onchange="fileInfo2(this)"><br>
 <div id="img_box"></div>
</td>
</tr>
<tr>
<td><input type="submit" value="작성완료">
<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
<br>
<br>
<%@include file="footer-area.jsp"%>
</body>
</html>