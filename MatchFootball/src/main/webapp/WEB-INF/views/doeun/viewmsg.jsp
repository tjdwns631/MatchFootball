<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지창 모달 띄울거임!!!!!!!!!</title>
</head>
<body>
<form id="viewmsg" action="../message" method="post">
<table style="align-content: center;" border="1">
<tr>
<td><input type="hidden" value="${msg.m_no}"></td>
<td><label>보낸 사람 </label><input type="text" id="toMsg" name="to_id" value="${msg.to_id}">
<td><label>제목</label><input type="text" id="toMsgTitle" name="m_title" value="${msg.m_title}">  </td>
</tr>
<tr>
<td colspan="3">
<textarea cols="100%" rows="10" id="toMsgCon" name="m_con" >${msg.m_con}</textarea>
</td>
</tr>
<tr>
<td colspan="3" align="center"><button type="submit">답장</button> <button type="reset" >취소</button> </td>
</tr>
</table>
</form>
</body>
</html>