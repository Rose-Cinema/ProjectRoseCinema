<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

회원가입 창으로 넘어가는 form 확인 ->
<input type="button" value="회원가입" onclick="location.href='/RoseCinema/inputForm.do'">

<br/><br/>

로그인 되는 form 확인->
<br/>
<a href="../member/loginForm.jsp"
						onClick="window.open('/RoseCinema/loginForm.do', 'login', 'width = 280, height = 250'); return false">로그인</a>

<br/><br/>

<c:if test="${logincheck == 1}">
	check값: ${logincheck}
	<br/>
	<h2>${sessionScope.memId} 님이 접속했습니다.! &nbsp; &nbsp; &nbsp; &nbsp;   이름: ${memName}, 회원넘버: ${memNum}  </h2> 
	<hr>
	회원정보수정, 회원탈퇴<-- 나중에 mypageForm.jsp에 이 a태그 갖다 붙이기!!!!  <br/>
	<a href="/RoseCinema/modifyForm.do">회원정보수정</a>
	
	<a href=""
	onClick="window.open('/RoseCinema/deleteForm.do', 'delete', 'width = 280, height = 280'); return false">
	회원탈퇴 do로 만든 것</a>
	
	 
	 
	<a href="/RoseCinema/deleteForm.do">회원탈퇴</a>
	
	
	<hr>
	
	<form method="post" action="mypageForm.do" name="mypage">
		submit버튼으로 만들거:  <input type="submit" name="confirm" value="마이페이지">
		<input type=hidden name="memNum" value="${memNum}" />
		<input type=hidden name="nowYear" value="${nowYear}" />
	</form>


</c:if>








</body>
</html>