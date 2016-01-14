<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>영화 상세</title>
<link href="style.css" rel="stylesheet" type="text/css">
<html>
<style> 
html{height:100%;} 
body{height:100%;}
textarea {width:500px; height:80px; overflow:visible;} 
</style>

<head>
<script src='/RoseCinema/resource/jquery.js' type="text/javascript"></script>
<script src='/RoseCinema/resource/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='/RoseCinema/resource/jquery.rating.js' type="text/javascript" language="javascript"></script>
<link href='/RoseCinema/resource/jquery.rating.css' type="text/css" rel="stylesheet"/>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	$(function(){
	 $('.hover-star').rating({
	  focus: function(value, link){
	    var tip = $('#hover-test');
	    tip[0].data = tip[0].data || tip.html();
	    tip.html(link.title || 'value: '+value);
	  },
	  blur: function(value, link){
	    var tip = $('#hover-test');
	    $('#hover-test').html(tip[0].data || '');
	  }
	 });
	});
	
	$(document).ready(function(){
		  $('.imagebox').bxSlider({
		  auto: true,
		  autoControls: true
		  });
	})
</script>


<body>
<table border="0" width="700" align="center">
	<tr>
		<td colspan="3" class="line03">
		<font size="5"><b>${dto.movie_name }</b></font>	</td>
	</tr>
	
	<tr>
		<td width="220" height="270" align="center" class="line03">
		<img src="/RoseCinema/movie/movie_image/${dto.movie_image}">
		</td>
	
	
		<td class="line03">
		<b>개봉일</b> : ${dto.opendate } <br/>
		<b>감독</b> : ${dto.director }<br/>
		<b>출연진</b> : ${dto.actor } <br/>
		<b>등급</b> : 
		<c:if test="${dto.grade_id eq 1}">전체</c:if>
		<c:if test="${dto.grade_id eq 2}">12세</c:if>
		<c:if test="${dto.grade_id eq 3}">15세</c:if>
		<c:if test="${dto.grade_id eq 4}">19세</c:if><br/>
		<b>장르</b> : 
		<c:if test="${dto.genre_id eq 1}">멜로/로맨스</c:if>
		<c:if test="${dto.genre_id eq 2}">액션</c:if>
		<c:if test="${dto.genre_id eq 3}">코미디</c:if>
		<c:if test="${dto.genre_id eq 4}">드라마</c:if>
		<c:if test="${dto.genre_id eq 5}">범죄</c:if>
		<c:if test="${dto.genre_id eq 6}">스릴러</c:if>
		<c:if test="${dto.genre_id eq 7}">공포</c:if>
		<c:if test="${dto.genre_id eq 8}">판타지</c:if>
		<c:if test="${dto.genre_id eq 9}">애니메이션</c:if>				
		<br/>
		<br/>
		
		<b>평점</b>  : ${avgScore }&nbsp;&nbsp;&nbsp; <br/>
		</td>
		<td width="100" align="center" class="line03">
		<a href=""><img src="/RoseCinema/movie/img/reserve2.jpg">
		</td>		
	</tr>
	
	<tr>
		<td colspan="3" height="100" class="line03" ><b>줄거리</b><br/>${dto.synopsis }</td>
		
	</tr>
	
	<tr>
		<td colspan="3" height="300" class="line03"><b>스틸컷</b><br/>
				
		<c:forTokens var="stil" items="${dto.stilcut}" delims=",">
		<ul class="imagebox">
			<li><img src="/RoseCinema/movie/stilcut/${stil}"></li> 
		</ul>
		</c:forTokens> 
		
		
		</td>
	</tr>
	
	<tr>
		<td colspan="3" width="500" height="350" class="line03"><b>동영상</b><br/>
			
				<video autoplay loop  id="bgvid">
	    			<source src="/RoseCinema/movie/video/${dto.video}" type="video/mp4">
				</video>
			
			
		
		</td>
	</tr>
	
	
	<tr>
	<td height="100%" colspan="3" align="center" >
	<div id="tab-Testing" style='display:inline'>
	<form id="star" action="/RoseCinema/movie/commentinsert.do" method="post">
		<input type="hidden" name="movie_id"  value="${dto.movie_id}" />
	<table width="100%"> 
		<tr>
  			<td valign="top" height="50px" align="left">
				<div class="Clear">
				<b>한줄평</b>
    			<div>
    				<c:forEach begin="1" end="5" step="1" var="i">
    				<input class="hover-star" type="radio" name="score" value="${i}" title="${i}점"/>
    				</c:forEach>
   				</div>
   				</div> 
  			</td>
  		</tr>
  		
  		<tr>
  			<td valign="top" width="5" >
  				<textarea name="content" width="500" height="200"></textarea>
   				<input type="submit" value="전송" />   <br />
   				<br/>
   				
   				
   				<c:forEach var="commentDto" items="${commentList}">
   				
   					<b>작성자</b> : ${commentDto.id} &nbsp;
   						<b>작성일</b> : ${commentDto.reg_date }&nbsp;
   					<b>내용</b> : ${commentDto.content } &nbsp;
   					<b>별점</b> : ${commentDto.score} &nbsp;&nbsp;<br/>
   				
   					
   				</c:forEach>
   			
   			</td>
   		</tr>
	</table>
	</form>
	</div>
	</td>
	</tr>
</table>
</body>
</html>