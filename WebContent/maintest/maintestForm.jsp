<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<jsp:include page="/top_nav.jsp"/>


<body>


회원가입 창으로 넘어가는 form 확인 ->
<input type="button" value="회원가입" onclick="location.href='/RoseCinema/inputForm'">

<br/><br/>

로그인 되는 form 확인->
<br/>
<a href="../member/loginForm.jsp"
						onClick="window.open('/RoseCinema/loginForm', 'login', 'width = 280, height = 250'); return false">로그인</a>

<br/><br/>

<c:if test="${sessionScope.logincheck == 1}">
	check값: ${sessionScope.logincheck}
	<br/>
	<h2> ${sessionScope.memName}님이 접속했습니다!<br/>
	회원 아이디: ${sessionScope.memId}  <!-- 회원넘버: ${memNum} -->  
	</h2> 
	<a href="/RoseCinema/logout">
							로그아웃</a>

	
	<hr>
	회원정보수정, 회원탈퇴<-- 나중에 mypageForm.jsp에 이 a태그 갖다 붙이기!!!!  <br/>
	<a href="/RoseCinema/modifyForm">회원정보수정</a>
	
	<a href=""
	onClick="window.open('/RoseCinema/deleteForm', 'delete', 'width = 280, height = 280'); return false">
	회원탈퇴 do로 만든 것</a>
	
	 
	 
	<a href="/RoseCinema/deleteForm">회원탈퇴</a>
	
	
	
	
	
	<hr>
	
	<form method="post" action="mypageForm" name="mypage">
		submit버튼으로 만들거:  <input type="submit" name="confirm" value="마이페이지">
		<input type=hidden name="memNum" value="${memNum}" />
		<input type=hidden name="nowYear" value="${nowYear}" />
	</form>


</c:if>







</body>
</html>