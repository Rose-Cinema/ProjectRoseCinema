<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<font size="5">쿠폰 테이블</font>
<form action="/RoseCinema/couponPro" method="post">
	<table border="1" align="center">
		<tr>
			
			<td>쿠폰이름</td>
		 	<td><input type="text" name="coupon_name"></td>
		</tr>
		<tr>
			<td>시작날짜</td>
			<td><input type="date" name="start_date"></td>
			<td>종료날짜</td>
			<td><input type="date" name="end_date"></td>
		</tr>
		<tr>
			<td>쿠폰타입</td>
			<td>
			<select name="coupon_type">
				<c:forEach var="typeDto" items="${typeList}">
					<option value="${typeDto.coupon_num}">${typeDto.coupon_name}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>발행수</td>
			<td><input type="number" name="coupon_count"></td>
		</tr>
		<tr>
			<td>등급</td>
			<td><input type="text" name="mgrade_id"></td>
		</tr>
		<tr>
			<td align="center">쿠폰 내용</td>
			
			<td align="center"><textarea name="coupon_content"></textarea></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="쿠폰 발급"/></td>
			
		</tr>
	</table>
</form>