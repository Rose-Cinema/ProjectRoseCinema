<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table>
	<tr>
		<td>
			${dto.event_name }
		</td>
	</tr>
	<tr>
		<td>
			<fmt:formatDate value="${dto.estart_date}" pattern="yyyy.MM.dd"/> 
		    <fmt:formatDate value="${dto.eend_date}" pattern="yyyy.MM.dd"/>
			 
		  
		</td>
	</tr>
	<tr>
		<td>
			<img src="RoseCinema/event/img/${dto.event_poster}" />
		</td>
	</tr>
</table>