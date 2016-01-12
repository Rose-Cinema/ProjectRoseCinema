<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Calendar cal = Calendar.getInstance();
//오늘 날짜 구하기
int nowYear=cal.get(Calendar.YEAR);
%>

  [DB:mgrade_history테이블에서 정보 끌어다와서 보여주기!!!]
  
  <br/>
 
  
  <table border="1">
  	<tr>
  		<td colspan="11">
  		${memName} 님의 지난 등급 이력  	
  		</td>
  	</tr>
  	
  	<tr>  	
  		<td>년도</td>   
  		<c:forEach var="dto" items="${history}">  	
  			
			<c:choose>
				<c:when test="${dto == null}">
					<td> 신규회원입니다. </td>
				</c:when>
				
				<c:otherwise>
					<td> ${dto.year} </td>
				</c:otherwise>
			 </c:choose> 			
			 
  			<!--   <td> ${dto.year} </td>  -->
  		</c:forEach>		
  	</tr>
  	
  	
  	<tr> 		 	
  		<td>등급</td>
  		<c:forEach var="dto" items="${history}">
  			<c:if test="${dto == null}">
  				<td> 신규회원입니다. </td>
  			</c:if>	
  		
  			<c:if test="${dto.mgrade_id == 1}">
  				<td> Silver </td>
  			</c:if>	
  			
  			<c:if test="${dto.mgrade_id == 2}">
  				<td> Gold </td>
  			</c:if>	
  			
  			<c:if test="${dto.mgrade_id == 3}">
  				<td> WhiteGold </td>
  			</c:if>
  			
  			<c:if test="${dto.mgrade_id == 4}">
  				<td> RoseGold </td>
  			</c:if>
  			
  		</c:forEach>
  	</tr>
  	

  	
  	
  	
  
  </table>

  
  
  <a href="memgradeinfoForm.jsp">멤버쉽 등급 기준표</a>
  
  
  
  
</body>
</html>