<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
  			  <c:forEach var="commentDto" items="${commentList}">
   					<b>작성자</b> : ${commentDto.id} &nbsp;
   						<b>작성일</b> : ${commentDto.reg_date }&nbsp;
   					<b>내용</b> : ${commentDto.content } &nbsp;
   					<b>별점</b> : ${commentDto.score} &nbsp;&nbsp;<br/>
   				</c:forEach>