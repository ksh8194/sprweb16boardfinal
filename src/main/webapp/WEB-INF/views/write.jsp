<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	//alert("a");
	if(frm.name.value ===""){
		alert("이름 입력");
		frm.name.focus();
		return;
	}
	//생략
	frm.submit();
}
</script>
</head>
<body>
<h2>**글 쓰기**</h2>
<form action="write" method="post" name="frm">
<table border="1" style="width: 80%">
	<tr>
		<td width="100">이 름</td>
		<td><input type= "text" name="name"></td>
	</tr>
	<tr>
		<td width="100">비밀번호</td>
		<td><input type= "text" name="pass"></td>
	</tr>
	<tr>
		<td width="100">이메일</td>
		<td><input type= "eamil" name="mail"></td>
	</tr>
	<tr>
		<td width="100">글 제목</td>
		<td><input type= "text" name="title"></td>
	</tr>
	<tr>
		<td width="100">글 내용</td>
		<td>
			<textarea rows="10" cols="50" name="cont"></textarea>
		</td>
	</tr>
	<td colspan="2">
	<input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>">
	<input type= "button" value="작 성" onclick="check()">
	<input type= "button" value="목 록" onclick="history.back()">
	</td>
</table>
</form>
</body>
</html>