<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function  chk() {
	//alert("a");
	if(frm.pass.value == ""){
		frm.pass.focus();
		alert("비밀번호를 입력하시오");
		return;
	}
	if(confirm("정말 수정할까요?")){
		frm.submit();
	}
}
</script>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg != null}">
<script type="text/javascript">
(function msg(){
	alert("${msg}");
})();
</script>
</c:if>
<h2> * 글 수정 * </h2>
<form action= "edit" method="post" name="frm">
<input type="hidden" name="num" value="${data.num}">
<input type="hidden" name="page" value="${page}">
<table border="1">
	<tr>
	<td>이 름</td>
	<td>
		<input type="text" name="name" value="${data.name}">
	</td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td>
		<input type="text" name="pass">
	</td>
	</tr>
	<tr>
	<td>메 일 </td>
	<td>
		<input type="text" name="mail" value="${data.mail}">
	</td>
	</tr>
	<tr>
	<td>타이틀 </td>
	<td>
		<input type="text" name="title" value="${data.title}">
	</td>
	</tr>
	<tr>
	<td>내 용</td>
	<td>
		<textarea rows="5" cols="50" name="cont"> ${data.cont}</textarea>
	</td>
	</tr>
	<tr>
	<td colspan="2" style="text-align: center;">
		<input type="button" value="수정 완료" onclick="chk()">&nbsp;
		<input type="button" value="목록 보기" onclick="location.href='list?page=${page}'">
	</td>
	
	</tr>
</table>
</form>
</body>
</html>