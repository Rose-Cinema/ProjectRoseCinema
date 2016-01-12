<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${logincheck == 0}">

	<script> 
	  alert("아이디나 비밀번호가 틀렸습니다.");
      history.go(-1);
	</script>
</c:if>


<c:if test="${logincheck == 1}">
	 <script language="javascript">
	  alert("로그인 성공!");
		
	 
	  opener.parent.location.reload(); 
		self.close(); 
		
	  //history.go(-1);
	</script>
	
</c:if>


check값: ${logincheck}
<br/><br/>

<h2>${sessionScope.memId} 님이 접속했습니다.!</h2>



</body>
</html>