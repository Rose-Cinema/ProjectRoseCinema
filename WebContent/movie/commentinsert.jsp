<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
  			  <c:forEach var="commentDto" items="${commentList}">
   					<b>�ۼ���</b> : ${commentDto.id} &nbsp;
   						<b>�ۼ���</b> : ${commentDto.reg_date }&nbsp;
   					<b>����</b> : ${commentDto.content } &nbsp;
   					<b>����</b> : ${commentDto.score} &nbsp;&nbsp;<br/>
   				</c:forEach>