<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.util.*" %>
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
  		<%for(int i=0; i<10;i++){%>
  			<td> <%=nowYear-i%> </td>		
  		<%}%>
  	</tr>
  	
  	
  	<tr> 		 	
  		<td>���</td>
  		<%for(int i=0; i<10;i++){%>
  			<td></td>		
  		<%}%> 
  	</tr>
  	
<form></form>
  	
  	
  	
  
  </table>
  
  
  
  <a href="memgradeinfoForm.jsp">����� ��� ����ǥ</a>
  
  
  
  
</body>
</html>