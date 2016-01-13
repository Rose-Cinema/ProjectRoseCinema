<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/top_nav.jsp"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

**My page**



<br>

	<font size = "5"> 회원이름: ${memName} </font> 
	<br/>
	<font size="5">회원아이디: ${memId} </font>
	<hr>
	올해(${nowYear})년도 고객님의 등급은 [[[${grade}]]]입니다.<br/>
	
	<form method="post" action="gradehistoryForm" name="gradehistory">
		<input type=hidden name="memNum" value="${memNum}" />
		<input type=hidden name="nowYear" value="${nowYear}" />
			<input type="submit" name="confirm" value="MY 지난등급이력 보기 submit">
		<br/><br/>
	</form>
	
	
	*내 멤버쉽 포인트: [DB:mpoint_history의 point데이터 이용]점<br/>
	
	<form method="post" action="meminfoForm" name="meminfo">
		<input type=hidden name="memNum" value="${memNum}" />
		<input type="submit" value="내 멤버쉽 정보 보기" > <!-- onclick="location.href='mypage/membership/meminfoForm.jsp'" -->
		 -->여기 클릭하면 이 안에 멤버쉽 카드 정보, 멤버쉽 카드 등록/해지 기능, 멤버쉽 포인트 정보, 멤버쉽 사용 내역 등 나온다.
	</form>
	
	<hr>
	
**내 영화 내역**  <br/>
<input type="button" value="나의 무비히스토리" onclick="window.open('/RoseCinema/movieHistory', 'login', 'width = 500, height = 500'); return false">
<br/>
<input type="button" value="예매 내역" onclick="window.open('/RoseCinema/reserveList', 'login', 'width = 500, height = 500'); return false">
<input type="button" value="취소 내역" onclick="window.open('/RoseCinema/cancelList', 'login', 'width = 500, height = 500'); return false">

<br/><hr>
*현장에서 멤버쉽없이 예매를 하셨나요? 영수증 하단의 예매번호를 등록하고 내 무비 히스토리에 기록&감상평을 써보세요!
<input type="button" value="영수증번호 등록하기"><br/>



</body>
</html>