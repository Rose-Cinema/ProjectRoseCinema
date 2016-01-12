<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>

<style>                     
a{color:#333333; text-decoration:none;}
a:hover{text-decoration:none; color:#333333;}
IMG {border: none;}
th, td {border: 1px solid #006666; font-size: 14;}
</style> 



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



</body>
</html>




