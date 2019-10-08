<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
border-top: 1px solid #444444;
border-collapse: collapse;
 width: 1000px;
height: 150px;
}
 th, td {
border-bottom: 1px solid #dcd8d6;
 padding: 10px;
text-align: center;
      }
 th{
 background: #dcd8d6;
 }
body{

text-align: center;
}

#likeimage{
display:block;
  width:60px;
  height:55px;
 display: block; 
   margin: 30px auto;

}
#b{
text-align: center;
display:block;
}

#commentList{
padding: 5px;
text-align :center;
display:block;
background-color : white;

}

#view{
padding: 5px;
text-align :center;
display:block;
margin:50px auto;
}
#view label{ 
color : white;
margin-top: 10px;}


h1{
background-color : #034B61;
background: #dcd8d6;
text-align :center;
display:block;
padding: 5px;
}

#smailComment{
padding: 30px;
display:block;
margin:80px right;

}

.contents{

width:auto;
height:auto;
display:block; 
 margin: 0px auto;
}
.aBtn{
	background-color: #ffffff;
    border-color: #33bcc5;
    color: #33bcc5;
    border-width: 1px;
    margin-left:880px;
}
button{
	margin-left:980px;
	width:140px;
    height:38px;
    font-size:14px;
    font-weight:bold;
    /*cursor:pointer;*/
    outline:none;	
    background-color: #ffffff;
    border-color: #33bcc5;
    color: #33bcc5;
    border-width: 1px;
}
div {
	display: block;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	
     $("#deletebtn").click(function(){
		 var pet_number="${view.pet_number}";
		 console.log('게시글 번호 : '+pet_number);
		$.ajax({
		type : "get",
		url : "Pet_Delete",
		data : {"pet_number" : pet_number},
		dataType : "text",
		success : function(result){
		if(result=="OK"){
			alert("삭제성공.");
			commentList();
		}else{
			alert("삭제실패");
			history.back();
		}
		
		},
		error : function(){
			alert("ajax통신실패");
		}
	});  
	});
	
		$('#commentWriteBtn').click(function(){
	   var commentContents = $("#commentContents").val();
	   var commentWriter = $("#commentWriter").val();
	   var commentBoardNumber ="${view.pet_number}";
	   var sessionid ="${sessionScope.sessionId}";
	   var commentModifyBtn = $("#commentModifyBtn");
	   var commentDeleteBtn = $("#commentDeleteBtn");
	   var commentSecret = $('#commentSecret').is(":checked");
	   var page = "${paging.page}";
	    console.log('게시글 번호 : '+commentBoardNumber);
	    // 한줄댓글 내용이 필수이므로 검사
          if(commentContents== '') {
                alert("내용은 필수 입력입니다.");
                 $(commentContents).focus(); return; }
	    if(sessionid==''){
	    	alert("로그인시 이용할수 있습니다.");
            $(commentContents).focus(); return; }
	    if(commentSecret){
	    	   $('#commentSecret').val('secret');
	     }
	    else{
	    	 $('#commentSecret').val('no');
	    }
  $.ajax({
		   type :"get",
	      url : "commentWrite",
	      data : {"commentContents" : commentContents,
	              "commentWriter" : commentWriter,
	              "comment_PET_NUMBER": commentBoardNumber,
	              "commentSecret" : commentSecret,
	              "page" : page },
	      dataType : "json",
	      success : function(result){
	    	   console.log("댓글 등록 성공!");
	    	   $("#commentContents").val("");
	    	    commentList();
	    },
	      error : function(){
	         alert("댓글등록실패");
	      }
	   });
	});
  

	
	
	
});

function commentModify(commentNumber){
	 console.log("수정commentNumber값 넘어오나여?"+commentNumber);
	var commentModifyBtn = $("#commentModifyBtn");
	var commentDeleteBtn = $("#commentDeleteBtn");
	var sessionid ="${sessionScope.sessionId}";
	var commentContents = $("#commentContents2").val();
	var commentWriter = $("#commentWriter").val();
	var commentNumber = commentNumber;
	console.log("수정commentContents값 넘어오나여?"+commentContents);
	console.log("수정commentWriter값 넘어오나여?"+commentWriter);
	$.ajax({
	type : "post",
	url :"commentModifyUpdate",
	data : {"commentNumber" : commentNumber,"commentContents":commentContents},
	dataType :"text",
	success:function(result){
	      if(result=="OK"){
		    	 alert("수정성공.");
		    	 commentList();
				}else{
					alert("수정실패");
					history.back();
				}
	      $("#commentList").html(output);
	},
	error : function(){
		alert("ajax통신실패");
	}
});
 }

function commentList(){
	 var commentNumber ="${cList.commentNumber}";
     var commentBoardNumber ="${view.pet_number}";
	 var sessionid ="${sessionScope.sessionId}";
	 var commentsDate = "${cList.commentsDate}";
	 var commentWriter="${cList.commentWriter}"
	 var commentSecret ="${cList.commentSecret}";
	 var page = "${paging.page}";
	 console.log("page????????????"+page);
	  $.ajax({
		   type :"post",
	      url : "commentList2",
	      data : { "comment_PET_NUMBER" : commentBoardNumber ,"page" :page},
	      dataType : "json",
	      success : function(result){
	    		var output="";
	        for(var i in result){
	        	 if(result[i].commentSecret=="secret" && sessionid!= result[i].commentWriter){
	        		 output += "<ol>";
	        		 output += "<p>";
	        		 output += "비밀댓글입니다.";
	        	 }else{
	        		    output += "<ol>";
		 	        	output += "<p>";
		 	        	output += "<h2>";
		 	        	output+= "("+ result[i].commentNumber +")";
		 	        	output += result[i].commentsDate+"<br>";
		 	            output +=result[i].commentWriter+"<br>";
		 	            output +=result[i].commentContents+"<br>";
		 	           output += "</h2>";
		 	            if(sessionid ==result[i].commentWriter){
		 	            	output +="<button id='commentModifyBtn' onclick='commentModifyList("+commentNumber+")'>"+"수정"+
		 	            	"</button>"+"<button id='commentDeleteBtn' onclick='commentDelete("+commentNumber+")'>"+"X"+"</button>";
		 	             }
		 	        
		 	            
	        	 }
	        	  output += "</p>";
	             output += "</ol>";
	            
	       }
	        
	      
	        if (page<=1){
           	 output += "[이전]";
           	 output += "&nbsp;";
            }
            if (page>1){
           	output += "<a href='Pet_Dog_View?page="+"page-1"+"&"+"pet_number="+'${view.pet_number}'+"'>" +"[이전]"+"</a>";
            }
            var begin="${paging.startPage}";
            var end = "${paging.endPage}";
            var step = "1";
            for(var i = "${paging.startPage}" ; i<"${paging.endPage}"; i++){
            	if(i==page){
            		output += i;
            		 output += "&nbsp;";
            	}
            	else{
            	output += "<a href='Pet_Dog_View?page="+"${paging.page}"+"&"+"pet_number="+'${view.pet_number}'+"'>"+i+"</a>";
            	 output += "&nbsp;";
            	}
            }
         
          if("${paging.page<paging.maxPage}"){
        	 output += "<a href='Pet_Dog_View?page="+'${paging.page+1}'+"&"+"pet_number="+'${view.pet_number}'+"'>"+"[다음]"+"</a>";
        	 output += "&nbsp;";
          }
          $("#commentList").html(output);
          
	      },
	      error : function(){
	         alert("댓글리스트불러오기실패");
	      }
	   });
}

function commentModifyList(num){
	  console.log("수정num값 넘어오나여?"+num);
	  var commentNumber ="${cList.commentNumber}";
	   var commentContents = $("#commentContents").val();
	   var commentWriter = $("#commentWriter").val();
	   var commentBoardNumber = "${view.pet_number}";
	   var sessionid ="${sessionScope.sessionId}";
	   var commentModifyBtn = $("#commentModifyBtn");
	   var commentDeleteBtn = $("#commentDeleteBtn");
	   var commentNumber = num;
	   var commentDate = "${cList.commentDate}";
	   var page = "${paging.page}";
	   
	     $.ajax({
		   type :"post",
	      url : "commentList2",
	      data : { "comment_PET_NUMBER" : commentBoardNumber , "commentNumber" : commentNumber ,"page" :page},
	      dataType : "json",
	      success : function(result){
	    	var output="";
	    	 for(var i in result){
	    		 var ha= result[i].commentContents;
	        	  var ah =result[i].commentWriter;
	        	    output += "<ol>";
	        		output += "<p>";
	        		output += "<h2>";
	        		output += "("+ result[i].commentNumber +")";
	        	    output += result[i].commentsDate+"<br>";
		            output += result[i].commentWriter;
		            output += "</h2>";
		          if(commentNumber==result[i].commentNumber){
		            	 output +="<input type='text' value='"+result[i].commentContents+"'id='commentContents2'>";
		            	 if(sessionid == ah){
		            		 output +="<button id='commentModifyBtn' onclick='commentModify("+commentNumber+")'>"+"수정"+
			 	            	"</button>"+"<button id='commentDeleteBtn' onclick='commentDelete("+commentNumber+")'>"+"X"+"</button>";
		             }
		            }else{
		            	output += result[i].commentContents;
		            }
		            output += "</p>";
		            output += "</ol>";
		   }
	          $("#commentList").html(output);
	      },
	      error : function(){
	         alert("댓글수정리스트불러오기실패");
	      }
	   });
}
function commentDelete(num){
	  console.log("num값 넘어오나여?"+num);
	   var commentNumber = num;
	   $.ajax({
		type : "get",
		url :"commentDelete",
		data : {"commentNumber" : commentNumber},
		dataType : "text",
		success : function(result){
			if(result=="OK"){
				alert("삭제성공.");
				commentModifyList();
			}else{
				alert("삭제실패");
				history.back();
			}
			},
			error : function(){
			alert("ajax통신실패");
		}
	}); 

}


function like_func(){
  var pet_number ="${view.pet_number}";
  var pet_like_id = "${sessionScope.sessionId}";
console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
    $.ajax({
			type: "post",
		    url: "Pet_Like",
		    data:{ "pet_number" : pet_number,"pet_like_id" : pet_like_id},
		     dataType:"text",
		    success: function(data){
		    	var output ="";
		    	console.log("data값이 뭐냐ㅕ"+data);
		    if(data == "OK"){
		    	output +="<img src=${pageContext.request.contextPath}/resources/petUploadFile/LOVEE.png>"+"1";
		     }else{
					alert("추천 실패");
					history.back();
				} 
		    $("#aaaaefefeqwfe").html(output);
		    },
		    error: function(){
		      alert("아주뭔가 잘못이야");
		    }
		  });
	}



function like_func2(){
  var pet_number ="${view.pet_number}";
  var pet_like_id ="${sessionScope.sessionId}";
 
 console.log("pet_number값은 넘어가냐 ㅅㅂ"+pet_number);
  $.ajax({
	type: "post",
    url: "likecancle",
    data:{"pet_number" : pet_number,"pet_like_id":pet_like_id},
     dataType: "text",
    success: function(data){
    	var output ="";
    if(data =="NO"){
    	output += "<img src=${pageContext.request.contextPath}/resources/petUploadFile/LOVE.JPG>"+"0";
    	
    	}else{
			alert("추천취소  실패");
			history.back();
		}  
    $("#aaaaefefeqwfe").html(output);
    },
    error: function(){
      alert("아주뭔가 잘못이야2");
    }
  });
}

function smailCommentBtn(num){ 
	  
	    var smail_commentWriter = "${sessionScope.sessionId}";
	   var smail_comment_PET_NUMBER =num;
	   var not_smail_commentNumber = "${view.pet_number}";
	   var page = "${paging.page}";
	   var smail_commentContents = $("#smail_commentContents").val();
	   console.log('게시글 번호 : '+not_smail_commentNumber);
	    console.log('댓글 번호 : '+smail_comment_PET_NUMBER);
	    // 한줄댓글 내용이 필수이므로 검사
       if(smail_commentContents== '') {
             alert("내용은 필수 입력입니다.");
              $(smail_commentContents).focus(); return; }
	
      $.ajax({
		   type :"get",
	      url : "SmailcommentWrite",
	      data : {"smail_commentWriter" : smail_commentWriter,
	              "smail_comment_PET_NUMBER": smail_comment_PET_NUMBER,
	              "not_smail_commentNumber":not_smail_commentNumber,
	              "smail_commentContents" : smail_commentContents},
	      dataType : "json",
	      success : function(result){
	    	   console.log("대댓글 등록 성공!");
	    	   $("#smail_commentContents").val("");
	    	    commentList();
	    },
	      error : function(){
	         alert("댓글등록실패");
	      }
	   });
	}


function smail_comment_see(num){
	
	   var smail_commentWriter = "${sessionScope.sessionId}";
	   var smail_comment_PET_NUMBER =num;
	   var page = "${paging.page}";
	  
	
	    console.log('댓글 번호 : '+smail_comment_PET_NUMBER);
	
	  $.ajax({
		   type :"post",
	      url : "smail_commentList",
	      data : { "smail_comment_PET_NUMBER" : smail_comment_PET_NUMBER},
	      dataType : "json",
	      success : function(result){
	    		var output="";
	        for(var i in result){
	        	
	        		    output += "<ol>";
		 	        	output += "<p>";
		 	        	output+= "("+ result[i].smail_commentNumber +")";
		 	        	output += result[i].smail_commentsDate+"<br>";
		 	        	output += "답글:";
		 	            output +=result[i].smail_commentWriter+"<br>";
		 	            output +=result[i].smail_commentContents+"<br>";
		 	          
	        	 
	        	  output += "</p>";
	             output += "</ol>";
	       }
	      $("#smail_comment_seeList").html(output);
         
	      },
	      error : function(){
	         alert("댓글리스트불러오기실패");
	      }
	   });
}

/* 로그인 안했을 시 확인하는 메소드 */
function idconfirm(){
	if(${sessionScope.sessionId == null}){
		alert('로그인 후 신청가능합니다.로그인 후 이용해주세요.');
		history.back();
	} else if(${sessionScope.sessionId != null}){
		idid.submit;
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
                        <h2>반려동물 정보</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    
<div id = "b">
<table style="margin-left: auto; margin-right: auto;">
<tr>
<th>견종</th><th>나이</th><th>분양가</th> 
</tr>
<tr>
<td>${view.pet_name}</td>
<td>${view.pet_live}개월</td>
<td>${view.pet_price}원~</td>
</tr>
</table>
<br>
<div class="contents">
 ${view.pet_contents}
</div>
<br>
<iframe width="700" height="505" src="${view.pet_trailer}?autoplay=1" frameborder="0"></iframe><br>
<br>
<br>
<br>
<img id="hi" src="${pageContext.request.contextPath}/resources/petUploadFile/${view.pet_img}">
<br>

<div id ="likeimage">
<c:choose>
<c:when test="${(not empty JudgmentLike)}">
<a href="javascript: like_func2();"><img src="${pageContext.request.contextPath}/resources/petUploadFile/LOVEE.png">${view.pet_hit}</a>
</c:when>
<c:otherwise>
<a href="javascript: like_func();"><img src="${pageContext.request.contextPath}/resources/petUploadFile/LOVE.JPG">${view.pet_hit}</a>
</c:otherwise>
</c:choose>
</div>

</div>
<c:if test="${(sessionScope.sessionId eq 'admin')}">
<a href="Pet_ModifyView?pet_number=${view.pet_number}" class="aBtn">글수정하기 </a><br>
<button id ="deletebtn" class="aBtn">글 삭제</button><br>
</c:if>
<br>
<input type="hidden" value="${view.pet_number}">
	<form action="goadopt" method="post" id="idid">
		<input type="hidden" name="a_petnumber" value="${view.pet_number}">
		 <input type="hidden" name="a_petcategorie" value="${view.pet_kategorie}"> 
		 <input type="hidden" name="a_petname" value="${view.pet_name}"> 
		 <input type="hidden" name="a_petprice" value="${view.pet_price}">
	<c:if test="${sessionScope.sessionId ne 'admin'}">
		<button onclick="idconfirm()" class="aBtn">분양신청</button>
	</c:if>
	</form>
	<br>

<h1>분양	Q&A </h1>
<div id="commentArea">
<div id="view">
<input type="text" id="commentWriter" value="${sessionScope.sessionId}" readonly /><br>
<input type="hidden" id="pet_number" value="${view.pet_number}" />
<textarea rows="6" cols="80" id ="commentContents" placeholder="댓글내용"></textarea><br>
 <input type="checkbox" id="commentSecret" />비밀댓글<br>
<button id="commentWriteBtn">댓글작성</button>
</div>
</div>


<div id="commentList">
<c:forEach items="${commentList}" var ="cList">
<c:choose>
<c:when test="${(cList.commentSecret eq 'secret' && sessionScope.sessionId ne cList.commentWriter)}">
<p>비밀댓글입니다.</p>
</c:when>
<c:otherwise>
<ol>
<p>댓글
<br>
<h2>(${cList.commentNumber})
${cList.commentsDate}<br>
작성자 : ${cList.commentWriter} <br>
${cList.commentContents}<br></h2>

<c:if test="${(sessionScope.sessionId eq cList.commentWriter)}">
<button id="commentModifyBtn" onclick="commentModifyList(${cList.commentNumber})">수정</button>
<button id="commentDeleteBtn" onclick="commentDelete(${cList.commentNumber})">X</button><br>
</c:if>

<c:choose>
<c:when test="${(sessionScope.sessionId eq 'admin')}">
<button id="smail_comment_see" onclick="smail_comment_see(${cList.commentNumber})">답글보기</button>
<div id="smail_comment_seeList">
</div>

</c:when>
<c:otherwise>
<p>비밀댓글입니다.</p>
</c:otherwise>
</c:choose>

<c:if test="${(sessionScope.sessionId eq 'admin')}">
<h2>>>대댓글</h2>
<div id="smailComment">
<input type="text" name="smail_commentWriter" id ="smail_commentWriter" value="${sessionScope.sessionId}" readonly />
<input type="hidden" name="smail_comment_PET_NUMBER"  value="${cList.commentNumber}"/>
<input type="hidden" name="not_smail_commentNumber" value="${view.pet_number}"/>
<input type="text" name ="smail_commentContents" id="smail_commentContents" placeholder="댓글내용">
<button onclick="smailCommentBtn(${cList.commentNumber})">대댓글작성</button><br>
===================================================================================================================
</div>
</c:if>
</p>
</ol>
</c:otherwise>
</c:choose>
</c:forEach>



<!-- 댓글 페이징 처리  -->

<c:if test="${paging.page<=1}">
	[이전]&nbsp; 
	
</c:if>
<c:if test="${paging.page>1}">
	<a href="Pet_Dog_View?page=${paging.page-1}&pet_number=${view.pet_number}">[이전]</a>
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	<c:choose>
	
		<c:when test="${i eq paging.page}">
			${i}
		</c:when>
		<c:otherwise> 
		<a href="Pet_Dog_View?page=${i}&pet_number=${view.pet_number}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${paging.page>=paging.maxPage}">
[다음]
</c:if>
<c:if test="${paging.page<paging.maxPage}">
<a href="Pet_Dog_View?page=${paging.page+1}&pet_number=${view.pet_number}">[다음]</a>
</c:if>

</div>



<%@include file="footer-area.jsp"%>
</body>
</html>