<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

* 멤버쉽 카드 등록하기


<form method="post" action="memcardRegisterPro" name="memcardregister" onSubmit="return checkIt()">
	<table border="1">
		<tr>
			<td>카드번호</td>
			<td><input type=text name="mcard_id" size="16"></td>
		</tr>
		
		<tr>
			<td>카드이름 설정</td>
			<td><input type=text name="mcard_name" size="16"></td>
		</tr>
		
		<input type=hidden name="member_id" value="${sessionScope.memNum}" />
		
		<input type=hidden name="isactive" value=1 />
		
		
		<!-- hidden으로 member_id, first date,isactive 넘기기 -->
		
		<tr>
			<td colspan="2">
			<input type="button" value="취소">
			<input type="submit" value="등록">
			</td>
		</tr>
	</table>

</form>

<br/>





</body>
</html>