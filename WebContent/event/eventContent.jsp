<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<td>
			${dto.event_name }
		</td>
	</tr>
	<tr>
		<td>
			${dto.estart_date} ~ ${dto.eend_date }
		</td>
	</tr>
	<tr>
		<td>
			<img src="RoseCinema/event/img/${dto.event_poster}" />
		</td>
	</tr>
</table>