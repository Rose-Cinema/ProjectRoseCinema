<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>
<form>

	<table border="1" align="center">
	<tr>
		<td>
			<font>�̺�Ʈ �з�</font>
		</td>
		<td colspan="3" cellspacing="0" cellpadding="0">
		<select name="event_id">
		    <option>�����λ�</option>
		    <option>����</option>
		    <option>1+1</option>
		    <option>�ַ�Ż��</option>
	    </select>
	    </td>
	 </tr>
	 <tr>
	 	<td>���۳�¥</td>
	 	<td>
			<input type="date" name="estart_date">
		</td>
		<td>���ᳯ¥</td>
		<td>
			<input type="date" name="eend_date">
		</td>
	</tr>
	<tr>
		<td>�̺�Ʈ��</td>
		<td colspan="3">
			<input type="text" name="event_name">
		</td>
	</tr>
	<tr>
		<td>�̹���</td>
		<td colspan="3">
			<input type="file" name="event_image">
		</td>
	</tr>
	<tr>
		<td>������</td>
		<td colspan="3">
			<input type="text" name="coupon_name">
		</td>
	</tr>
	<tr>
		<td>�������۳�¥</td>
	 	<td>
			<input type="date" name="cstart_date">
		</td>
		<td>�������ᳯ¥</td>
		<td>
			<input type="date" name="cend_date">
		</td>
	</tr>
	<tr>
		<td>�ַ�Ż�� �ο�</td>
		<td>
			<input type="text" name="event_count">
		</td>
	
		<td>��ȭ����</td>
		<td>
			<select name="screen_id">
				<option>�������</option>
				<option>��Ÿ����:�������</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center"><input type="submit" value="�̺�Ʈ ���"/></td>
	</tr>
	</table>
	
</form>
</body>