<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<form>쿠폰 리스트</form>
<table border="1">
	<tr>
		<td>쿠폰이름</td>
		<td>쿠폰번호</td>
		<td>유효기간</td>
		<td>사용날짜</td>
	<c:forEach var="couponDTO" items="${couponlist }">
		<tr>
			<td>${couponDTO.coupon_name }</td>
			<td>${couponDTO.coupon_id }</td>
			<td>${couponDTO.end_date }</td>
			<td>${couponDTO.used_date }</td>
		</tr>
	</c:forEach>
</table>
</body>