<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
text-align:center;

}
table {
      float : center;
    width: 1200px;
    border-top: 1px solid black;
    text-align: center;
    margin-left: auto; 
    margin-right: auto;
}
.hiaa th{
   border-top:3px solid black;
    border-bottom: 1px solid #DDDDDD;
    padding: 10px;
     text-align:center;
}
 .hiaa td{
    border-bottom: 1px solid ;
     text-align:center;
      padding: 5px;
      padding-bottom: 10px;
  
}
.hiaa #title:hover {
  background-color: #ddd;
}
.paging{
    padding: 10px;
  text-align:center;
   border-top:100px solid white;
    float : center;
}
.notice{
   padding: 10px;
  text-align:center;
   border-top:10px solid white;
    border-bottom: 100px solid white;
    float : center;
}
.search-wrapper{
   text-align:center;
 float : center;
 display:block;
 }

</style>
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
                        <h2>공지사항</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>
	<div id="search-wrapper">
									   <form action="notice_search">
									 
									   <input type="hidden" name="page" value="1">
										  <input type="text" id="search" name="search_notice"
												placeholder="제목명 검색">
												
											<div id="close-icon"></div>
											<input class="d-none" type="submit" value="">
										</form>
									</div>
<table class="hiaa">
<tr>
<th>NO</th> <th>제목</th>  <th>작성자</th>
</tr>
<c:forEach var="List" items="${noticeList}">
<tr>
<td>${List.notice_number}</td>

<td id="title"><a style="color:black" href="NoticeView?notice_number=${List.notice_number}">${List.notice_title}</a></td>

<td>${List.notice_writer}</td>
</tr>
</c:forEach>
</table>

<div class="paging">
<c:if test="${paging.page<=1}">

	[이전]&nbsp; 
</c:if>
<c:if test="${paging.page>1}">
	<a href="NoticeList?page=${paging.page-1}">[이전]</a>&nbsp;
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	<c:choose>
	
		<c:when test="${i eq paging.page}">
			${i}
		</c:when>
		<c:otherwise> 
		<a href="NoticeList?page=${i}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
[다음]
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="NoticeList?page=${paging.page+1}">[다음]</a>
</c:if>
</div>
<div class="notice">
<c:if test="${(sessionScope.sessionId eq 'admin')}">
<a href="admin_Notice_WritView">공지사항 쓰러가기</a><br>
</c:if>
</div>
<%@include file="footer-area.jsp"%>
</body>
</html>