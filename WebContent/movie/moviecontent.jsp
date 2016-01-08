<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>��ȭ ��</title>
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
	<script>
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
	</script>
</script>


<body>
<table border="1" width="700" align="center">
	<tr>
		<td colspan="3">
		<font size="5"><b>���� :${dto.movie_name }</b></font>	</td>
	</tr>
	
	<tr>
		<td width="220" height="270" align="center">
		<img src="/RoseCinema/movie/movie_image/${dto.movie_image}">
		</td>
	
	
		<td>
		<b>������</b> : ${dto.opendate } <br/>
		<b>����</b> : ${dto.director }<br/>
		<b>�⿬��</b> : ${dto.actor } <br/>
		<b>�帣</b> : ${dto.genre_id }<br/>
		<b>������</b> : ${dto.ticket_rate }&nbsp;&nbsp;&nbsp; <b>����</b> : ${dto.score }&nbsp;&nbsp;&nbsp; <br/>
		</td>
		<td width="100" align="center">
		<a href=""><img src="/RoseCinema/movie/img/reserve2.jpg">
		</td>		
	</tr>
	
	<tr>
		<td colspan="3" height="100" >�ٰŸ� ${dto.synopsis }</td>
	</tr>
	
	<tr>
		<td colspan="3" height="300" >
		<c:forTokens var="stil" items="${dto.stilcut}" delims=",">
			<img src="/RoseCinema/movie/stilcut/${stil}">
		</c:forTokens> 
		
		
		</td>
	</tr>
	
	<tr>
		<td colspan="3" width="500" height="350" align="center">
			<b>
				<video autoplay loop  id="bgvid">
	    			<source src="/RoseCinema/movie/video/${dto.video}" type="video/mp4">
				</video>
			
			
		
		</td>
	</tr>
	
	
	<tr>
	<td height="100%" colspan="3" align="center">
	<div id="tab-Testing" style='display:inline'>
	<form id="star" action="/RoseCinema/movie/comment.do" method="get">
	<table width="100%"> 
		<tr>
  			<td valign="top" height="50px" align="left">
				<div class="Clear">
				<b>������</b>
    			<div>
    				<c:forEach begin="1" end="5" step="1" var="i">
    				<input class="hover-star" type="radio" name="score" value="${i}" title="${i}��"/>
    				</c:forEach>
   				</div>
   				</div> 
  			</td>
  		</tr>
  		
  		<tr>
  			<td valign="top" width="5">
  				<textarea name="content" width="500" height="200"></textarea>
   				<input type="submit" value="����" />  
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