<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Faq Form</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function insertFaq(faq) {
		$.ajax({
			url:"/RoseCinema/insertFaq",
			type: "POST",
			data:"faq",
			
		})
	}
</script>
</head>
<body>
	<form action="/RoseCinema/insertFaq" method="post">
		<table border="1">
			<tr>
				<td>분류</td>
				<td>
					<select name="faqType">
						<option value="1">영화예매</option>
						<option value="2">할인/신용카드</option>
						<option value="3">멤버십</option>
						<option value="4">영화관</option>
						<option value="5">홈페이지</option>
						<option value="6">인재채용</option>
						<option value="7">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="faqTitle"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="25" name="faqContent"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록" onclick="window"/></td>
				<td><input type="button" value="취소" onclick="window.close()"/></td>
			</tr>
		</table>
	</form>
</body>
</html>