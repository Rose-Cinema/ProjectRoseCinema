<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

**����������**



<br>

	<font size = "8"> ȸ���̸�: ${memName} </font> 
	<br/>
	<font size="5">ȸ�����̵�: ${memId}</font>
	<hr>
	����(${nowYear})�⵵ ������ ����� [[[${grade}]]]�Դϴ�.<br/>
	
	<form method="post" action="gradehistoryForm" name="gradehistory">
		<input type=hidden name="memNum" value="${memNum}" />
		<input type=hidden name="nowYear" value="${nowYear}" />
			<input type="submit" name="confirm" value="MY ��������̷� ���� submit">
		<br/><br/>
	</form>
	
	
	*�� ����� ����Ʈ: [DB:mpoint_history�� point������ �̿�]��<br/>
	<input type="button" value="�� ����� ���� ����" onclick="location.href='mypage/membership/meminfoForm.jsp'">
	 <--���� Ŭ���ϸ� �� �ȿ� ����� ī�� ����, ����� ī�� ���/���� ���, ����� ����Ʈ ����, ����� ��� ���� �� ���´�.
	
	<hr>
	
**�� ��ȭ ����** <br/>
	
	
	**���� ����<br/>
	
	 <select id="ticketinghistory">
		<option value="latest">���ų���</option>
		<option value="before">��������</option>
		<option value="cancel">��ҳ���</option>
	</select>

	<table border="1">	 
		 
		 <tr>
		 	<td>NO</td><td>���Ź�ȣ</td><td>��ȭ��</td><td>����</td><td>���Ͻ�</td><td>������</td><td>������ҹ�ư[DB:��������]</td>
		 </tr>
		 
		 <tr>
		 
		 	<td colspan="7">
		 	[DB:�������̺��� ������ select type���� �Խ������·� �Ҹ��� �ҷ�����!!]<br/>
		 	'��ȭ��' Ŭ���ϸ� �ش� ��ȭ������������ �Ѿ��, ���Ź�ȣ Ŭ���ϸ� �ش� ���Ż����� �������� �Ѿ�� ��!! 
		 	</td>
		 </tr>
	 
	 </table>
	
	<hr>
	
	**���� ���� �����丮<br/>
	
	���� �� ��ȭ ����Ʈ - �� ��ȭ���� ������ ����, ����/������ �ޱ� ���, ���������� ������ �߰��ؾ���!!! ������ �߰��� �� ����!!
	
	<br/><br/>
	
	
	**���忡�� ��������� ���Ÿ� �ϼ̳���? ������ �ϴ��� ���Ź�ȣ�� ����ϰ� �� ���� �����丮�� ���&�������� �Ẹ����!<br/>
	����ϱ�
	<table border="1">
		<tr>
			<td>������ ��ȣ</td> <td><input type="text" size="15"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="����ϱ�">[DB:������ <---DB���� ���� �ʿ��ҵ�!!! ���� ���̺��� ��ȸ������ ���� �÷��� �ٽ� ȸ�����ŷ� �ٲ�� ������]
			</td>
		</tr>
	</table>
	
	
	<c:foreach>
		
	</c:foreach>
<form></form>

</body>
</html>