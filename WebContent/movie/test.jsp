<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='/RoseCinema/resource/jquery.js' type="text/javascript"></script>
<script src='/RoseCinema/resource/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
<script src='/RoseCinema/resource/jquery.rating.js' type="text/javascript" language="javascript"></script>
<link href='/RoseCinema/resource/jquery.rating.css' type="text/css" rel="stylesheet"/>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>

</head>
<body>
   <div id="tab-Testing">
    <h2>평점을 매겨주세요</h2>
    
<script type="text/javascript" language="javascript">
$(function(){ 
 $('#form :radio.star').rating(); 
});
</script>

<script>
$(function(){
 $('.hover-star').rating({
  focus: function(value, link){
    var tip = $('#hover-test');
    tip[0].data = tip[0].data || tip.html();
    tip.html(link.title || 'value: '+value);
  },
  blur: function(value, link){
    var tip = $('#hover-test');
    $('#hover-test').html(tip[0].data || '');
  }
 });
});
</script>
<form id="star" action="/RoseCinema/movie/comment.do" method="get">
<table width="100%"> 
<tr>
  <td valign="top" height="50px">
	<div class="Clear">
	나의 점수는?
    <div>
    <c:forEach begin="1" end="5" step="1" var="i">
    	<input class="hover-star" type="radio" name="score" value="${i}" title="${i}점"/>
    </c:forEach>
    </div>
   </div> 
  </td>
  </tr>
  <tr>
  <td valign="top" width="5">
  <textarea name="comment"></textarea>
   <input type="submit" value="전송!" />  </td>
   </tr>
</table>
</form>
</div>