<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<form>���� ����Ʈ</form>
<table border="1">
	<tr>
		<td>�����̸�</td>
		<td>������ȣ</td>
		<td>��ȿ�Ⱓ</td>
		<td>��볯¥</td>
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