<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<font size="5">발행쿠폰 테이블</font>
<form action="/RoseCinema/couponNumPro" method="post">
<table border="1">
	<tr>
		<td>쿠폰번호</td>
		<td>
		<select name="coupon_num">
				<c:forEach var="numDto" items="${couponNumList}">
					<option value="${numDto.coupon_num}">${numDto.coupon_id}</option>
				</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td>사용날짜</td>
		<td><input type="date" name="used_date"></td>
	</tr>
	<tr>
		<td>사용자</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td align="center"><input type="submit" value="등록"/></td>
	</tr>
</table>
</form>	