<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>

EVENT <br /> 
��ü ����ó׸��̺�Ʈ ��ȭ���� �����λ� ��

<a href="/RoseCinema/eventList" ><h3>�����̺�Ʈ</h3> </a> 
<a href="/RoseCinema/eventEndList" ><h3>�����̺�Ʈ</h3> </a> 
<a href="/RoseCinema/event" ><h3>�̺�Ʈ���</h3></a> <br /> 
<%-- 
<c:if test="${sessionScope.memId eq 'admin' }">
	<a href="/RoseCinema/event" >�̺�Ʈ���</a> <br />
</c:if>
--%>

<table>

	<c:forEach begin="0" end="${(fn:length(eventlist) + 3) / 4 - 1}" var="row">
	<tr>
	    <c:forEach begin="0" end="3" var="col">
	        <c:set var="eventDTO" value="${eventlist[row * 4 + col]}"/>
	        <c:if test="${not empty eventDTO}">
				<td>
					<a href="/RoseCinema/eventContent?event_id=${eventDTO.event_id}">
						<img src="/RoseCinema/event/img/${eventDTO.event_image}" width="100" height="150" /> 
					</a><br />
					${eventDTO.event_name} <br />
					
					${eventDTO.estart_date} ~ ${eventDTO.eend_date }
				</td>
	        </c:if>
	    </c:forEach>
	</tr>
	</c:forEach>
</table>




