<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

예매 내역 리스트!!<br>
고객님의 관람 예정 내역을 보여줍니다.<br />

	
	<table border="1">	 
		 
		 <tr>
		 	<td>NO</td><td>예매번호</td><td>영화명</td><td>영화관</td><td>상영일시</td><td>예매일</td><td>예매취소버튼[DB:삭제쿼리]</td>
		 </tr>
		 
		<c:forEach var="dto" items="${ticket}">
		 	<tr>
	  			<td>${dto.ticketID}</td>
	  			<td>${dto.no}</td>
	  			<td>${dto.movie}</td>
	  			<td> ${dto.theater}, ${dto.screen} </td>
	  			<td>${dto.ticketDate}</td>
	  			<td>${dto.buyDate}</td>
	  			
	  			<td>
	  			<form method="post" action="reserveDelete" name="cancelbutton">
	  			
	  			<input type="hidden" name="ticketID" value ="${dto.ticketID}" >
	  			<input type="submit" name="deletereserve" value="예매 취소" />
	  			
	  			</td>		
	  			
	  		</tr>		
  		</c:forEach>
		 
	 </table>


</body>
</html>