<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	// alert("b");
	if(frm.name.value === ""){
		alert("이름 입력");
		frm.name.focus();
		return;
	}
	// 생략
	;
	frm.submit();
	
}
</script>
</head>
<body>
<h2> *댓글 쓰기 *</h2>
<form action="reply" method="post" name="frm">
<input type="hidden" name= "num" value="${data.num}"> 
<input type="hidden" name= "page"" value="${page}"> 
<input type="hidden" name= "gnum" value="${data.gnum}"> 
<input type="hidden" name= "onum" value="${data.onum}"> 
<input type="hidden" name= "nested" value="${data.nested}"> 
<input type="hidden" name= "bip" value="<%=request.getRemoteAddr() %>"> 

<table border="1">
	<tr>
	<td>작성자</td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="text" name="pass"></td>
	</tr>
	<tr>
	<td>이메일</td>
	<td><input type="text" name="mail"></td>
	</tr>
	<tr>
	<td>제 목</td>
	<td><input type="text" name="title" value= "[Re]:${data.title}" style="width: 100%"></td>
	</tr>
	<tr>
	<td>글 내용</td>
	<td>
	<textarea rows="5" style="width: 100%" name= "cont"></textarea>
	</td>
	</tr>
	<tr>
	<td colspan-"2">
		<input type="button" value="작성 완료" onclick="check()">&nbsp;
		<input type="button" value="목록 보기" onclick="location.href='list:?page=${page}'">
	</td>
	</tr>
</table>
</form>
</body>
</html>