<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<font size="5">쿠폰타입 테이블</font>

<form action="/RoseCinema/couponTypePro" method="post">
	<table border="1">
		<tr>
			<td>쿠폰타입명</td>
			<td>
				<input type="text" name="coupon_name">
			</td>
			<td>
				<input type="submit" value="등록">
			</td>
		</tr>
	</table>
</form>