<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Calendar cal = Calendar.getInstance();
//���� ��¥ ���ϱ�
int nowYear=cal.get(Calendar.YEAR);
%>

  [DB:mgrade_history���̺��� ���� ����ٿͼ� �����ֱ�!!!]
  
  <br/>
 
  
  <table border="1">
  	<tr>
  		<td colspan="11">
  		${memName} ���� ���� ��� �̷�  	
  		</td>
  	</tr>
  	
  	<tr>  	
  		<td>�⵵</td>   
  		<c:forEach var="dto" items="${history}">
  			<td> ${dto.year} </td>
  		</c:forEach>		
  	</tr>
  	
  	
  	<tr> 		 	
  		<td>���</td>
  		<c:forEach var="dto" items="${history}">
  			<td> ${dto.mgrade_id} </td>
  		</c:forEach>
  	</tr>
  	

  	
  	
  	
  
  </table>
  
  
  
  <a href="memgradeinfoForm.jsp">����� ��� ����ǥ</a>
  
  
  
  
</body>
</html>