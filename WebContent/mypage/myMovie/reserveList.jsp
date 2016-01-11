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
오늘날짜 기준으로 그 이후 날짜 예매한 것들 뽑아준다!!

**예매 내역<br/>
	<input type="button">
	
	
	 <select id="ticketinghistory">
		<option value="latest">예매내역</option>
		<option value="before">지난내역</option>
		<option value="cancel">취소내역</option>
	</select>

	<table border="1">	 
		 
		 <tr>
		 	<td>NO</td><td>예매번호</td><td>영화명</td><td>영화관</td><td>상영일시</td><td>예매일</td><td>예매취소버튼[DB:삭제쿼리]</td>
		 </tr>
		 
		<c:forEach var="dto" items="${ticket}">
		 	<tr>
	  			<td>${dto.ticketid}</td>
	  			<td>${dto.no}</td>
	  			<td>${dto.movie}</td>
	  			<td> ${dto.theater}, ${dto.screen} </td>
	  			<td>${dto.ticketdate}</td>
	  			<td>예매일</td>
	  			<td>취소버튼</td>		
	  		</tr>		
  		</c:forEach>
		 
		 
		 <tr>
		 
		 	<td colspan="7">
		 	[DB:예매테이블에서 각각의 select type별로 게시판형태로 쫘르륵 불러오기!!]<br/>
		 	'영화명' 클릭하면 해당 영화정보페이지로 넘어가고, 예매번호 클릭하면 해당 예매상세정보 페이지로 넘어가야 함!! 
		 	</td>
		 </tr>	 
	 
	 </table>


</body>
</html>