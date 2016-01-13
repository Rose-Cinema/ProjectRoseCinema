<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<br/>
<hr>

** 멤버십 카드 정보<br/>
카드 리스트  &nbsp; &nbsp; &nbsp; &nbsp; 
<input type="button" value="새로운 카드 등록" onclick="window.open('/RoseCinema/memcardRegister', 'login', 'width = 280, height = 250'); return false">

<table border="1">
	<tr>
		<td width="100">카드번호</td>
		<td width="100">카드이름</td>
		<td width="100">카드등록일</td>
		<td width="100">카드 삭제</td>
	</tr>
	
	<!-- c:if로 다시 해보기 -->

		<c:forEach var="memdto" items="${memcard}">  	 			
			<c:choose>
				<c:when test="${memdto eq null}">
					<tr><td colspan="4"> 등록된 카드가 없습니다 </td></tr>
				</c:when>
				
				<c:otherwise>
				<tr>
					<td> ${memdto.mcard_id} </td>
					<td> ${memdto.mcard_name} </td>
					<td> ${memdto.first_date} </td>
					<td> 
						<form method="post" action="memcardDelete" name="cardbutton">
						
						<input type="hidden" name="mcard_id" value ="${memdto.mcard_id}" >
						<input type="submit" name="deletecard" value="카드 해지" />
						
						</form>	
					</td>
				</tr>
				</c:otherwise>
			 
			 </c:choose> 			
			 
  		</c:forEach>

	
</table>
<br/>
 
 <hr>
 
 
 ** 멤버쉽 포인트 적립/사용 내역
 <select id="mempointType">
		<option value="all">전체</option>
		<option value="saving">적립</option>
		<option value="use">사용</option>
		<option value="event">이벤트</option>
</select>

<table border="1">	 
	 
	 [DB:mpoint테이블에서 게시판형태로 쫘르륵 불러오기!!&&select box에 따라 타입별로 불러오기 기능도!]
	 
	 <tr>
	 	<td>일자</td><td>이용내용</td><td>이용금액</td><td>적립/사용포인트</td><td>구분</td>
	 </tr>
	 
	 
	 
	 	<c:forEach var="dto" items="${mpoint}">
	 	<tr>
  			<td>${dto.change_time}</td>
  			<td>${dto.pay_content}</td>
  			<td>${dto.pay_sum}</td>
  			<td> ${dto.change_point} </td>
  			
  			<c:if test="${dto.change_type ==1}">
  				<td>영화예매 적립</td>
  			</c:if>
  			
  			<c:if test="${dto.change_type ==2}">
  				<td>이벤트 적립</td>
  			</c:if>
  			
  			<c:if test="${dto.change_type ==3}">
  				<td>영화예매 사용</td>
  			</c:if>
  			
  			<c:if test="${dto.change_type ==4}">
  				<td>매점 사용</td>
  			</c:if>
  			
  			<c:if test="${dto.change_type ==5}">
  				<td>이벤트 사용</td>
  			</c:if>		
  		
  		</tr>		
  		</c:forEach>
	 
	 	
	 
 </table>
 



</body>
</html>