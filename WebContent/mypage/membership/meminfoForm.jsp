<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

����Ʈ ��Ȳ
<br/>
���� ���� ����Ʈ: [DB:mpoint_history�� point������ �̿�]P
<br/>
<hr>

** ����� ī�� ����<br/>
ī�� ����Ʈ  &nbsp; &nbsp; &nbsp; &nbsp; <input type="button" value="ī�� ��� �� ����" onclick="location.href='memcardModify.jsp'">

<table border="1">
	<tr>
		<td width="100">NO</td>
		<td width="100">ī���ȣ</td>
		<td width="100">�����</td>
	</tr>
	
	<tr>
		<td colspan="3"> [DB:ī�� ����Ʈ DB���� �����ֱ�]</td>
	</tr>
</table>
<br/>
 <hr>
 ** ����� ����Ʈ ����/��� ����
 <select id="mempointType">
		<option value="all">��ü</option>
		<option value="saving">����</option>
		<option value="use">���</option>
		<option value="event">�̺�Ʈ</option>
</select>

<table border="1">	 
	 
	 <tr>
	 	<td>����</td><td>�̿볻��</td><td>�̿�ݾ�</td><td>��������Ʈ</td><td>�������Ʈ</td><td>����</td>
	 </tr>
	 
	 
	 <tr>
	 	[DB:mpoint���̺��� �Խ������·� �Ҹ��� �ҷ�����!!&&select box�� ���� Ÿ�Ժ��� �ҷ����� ��ɵ�!]
	 </tr>
 </table>
 



</body>
</html>