<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>

<style>                     
a{color:#333333; text-decoration:none;}
a:hover{text-decoration:none; color:#333333;}
IMG {border: none;}
th, td {border: 1px solid #006666; font-size: 14;}
</style> 

<script type="text/javascript">

	var preResize = $(window).width();

	$(document).ready(function() {
		MovieList.init('movie');

	
		$('.sort_wrap li a').each(function() {
			$(this).click(function() {
				$('.sort_wrap li a').removeClass('active');
				$(this).addClass('active');
			});
		});
		
		// 창크기에 따라 행갯수 동적변경 처리
		var item_size = 246;
		var w_size = $(window).width();
		var itemCount = parseInt(w_size / item_size);
		
		if (w_size<985){
			$('#flip_wrapper').width(984);
		} else {
			$('#flip_wrapper').width(item_size * itemCount);
		}
	});
	
	$(window).resize(function(){
		var item_size = 246;
		var w_size = $(window).width();
		var wrap_size = $('#flip_wrapper').width();
		var e_size = w_size - wrap_size;
		
		if (w_size<985){
			$('#flip_wrapper').width(984);
		} else {
			var afterResize = $(window).width();
			
			if (preResize < afterResize) {
				if (e_size > item_size) {
					$('#flip_wrapper').width(wrap_size+item_size);
				} 
			} else {
				if (w_size <= wrap_size)  {
					$('#flip_wrapper').width(wrap_size - item_size);
				}
			}
			
			preResize = afterResize;
		}		
	});
	
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 목록</title>

</head>
<body>

<font size="5">&nbsp; &nbsp; &nbsp; &nbsp; <b></b></font><p>           
<table cellpadding="12" cellspacing="10"  align="center" >
<c:forEach begin="0" end="${(fn:length(list) + 3) / 4 - 1}" var="row">   
<tr>             
	<c:forEach begin="0" end="3" var="col">
        <c:set var="dto" value="${list[row * 4 + col]}"/>
        <c:if test="${not empty dto}">
		
			<td>
				<a href="moviecontent.do?movie_id=${dto.movie_id}"><img src="/RoseCinema/movie/movie_image/${dto.movie_image}"></a>
				<hr>
				
				<%-- 더~ 좋은방법을 강구....!!! 하자하자하자하자하자하자.. 머리가 안돌아간다...  --%>
				<c:if test="${dto.grade_id eq 1}">
					전체
				</c:if>
				<c:if test="${dto.grade_id eq 2}">
					12세
				</c:if>
				<c:if test="${dto.grade_id eq 3}">
					15세
				</c:if>
				<c:if test="${dto.grade_id eq 4}">
					19세
				</c:if>
			
				
				&nbsp;&nbsp; <b>${dto.movie_name }</b> <br />
				평점 : ${dto.score } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 예매율 : ${dto.ticket_rate } <br /><br/>
				&nbsp;<a href=""><img src="/RoseCinema/movie/img/reserve.jpg"></a> &nbsp;
				&nbsp;<a href="moviecontent.do?movie_id=${dto.movie_id}"><img src="/RoseCinema/movie/img/detail.jpg"></a>
										
			</td>
		  </c:if>
    </c:forEach>
	</tr>
	</c:forEach>
	
</table>
<div class="full-width" align="center">
		<div id="flip_wrapper">
			<div class="movielist_util_wrap">
			
			</div>
			<ul id="movieList">
				
			</ul>
			<button id="moreMovieList" type="button" class="view_more full_width" onclick="MovieList.getMore()">더보기 +</button>
		</div>
	</div>


</body>
</html>




