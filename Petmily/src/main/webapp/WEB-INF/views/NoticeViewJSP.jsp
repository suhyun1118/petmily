<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{

text-align: center;
}
#7{
font-size:50px;

}
.ldkjgnrlekgneqlrkgnl{
font-size:10px;
text-align:center;
   border-top:100px solid white;
}
#cavawlsWK{

    padding: 10px;
  text-align:center;
   border-top:100px solid white;
}
.dflqeorknqlekfnqlkfnqlk{
 border-top:3px solid black;
    padding: 200px;
  text-align:center;
   border-top:100px solid white;
    width: 1200px;
      margin-left: auto; 
    margin-right: auto;
}
#efefefefe:hover,#efefefefe2{
  margin-left: auto; 
    margin-right: auto;
    width:580px;

}
#efefefefe:hover,#efefefefe2:hover{
    border-top:10px solid #ddd;
    border-bottom: 10px solid #ddd;
    background-color: #ddd;
     width: 1200px;
       margin-left: auto; 
    margin-right: auto;

}

</style>
</head>
<body>
<%@include file="header-area.jsp"%>

<div id="cavawlsWK">
<h2 id="7" style=" border-bottom: 4px solid #DDDDDD;padding: 10px;">${noticeView.notice_title} </h2> <br>
<img id="hi" src="${pageContext.request.contextPath}/resources/notice/${noticeView.notice_FILE}"><br>
<div class="ldkjgnrlekgneqlrkgnl">
<h2 style="font-size:20px">${noticeView.notice_contents} </h2>
</div>
<div id="dflqeorknqlekfnqlkfnqlk">
<br>
<br>
<a class="a" style="color:black" id="efefefefe" href="NoticeView?notice_number=${notice_Previous_View.notice_number}">▲ &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ${notice_Previous_View.notice_title}</a><br>
<a class="a" style="color:black" id="efefefefe2"  href="NoticeView?notice_number=${notice_next_View.notice_number}">▼ &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;${notice_next_View.notice_title}</a>
<br>
<br>
</div>
</div>



<%@include file="footer-area.jsp"%>
</body>
</html>