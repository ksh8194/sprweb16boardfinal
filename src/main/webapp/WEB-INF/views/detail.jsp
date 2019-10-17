<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 상세 보기 *<p/>
<table>
	<tr>
	<td>비밀번호: ${data.pass}</td>
	<td style="text-align: right;">
		<a href="reply?num=${data.num}&page=${page}"><img src="./resources/images/reply.gif"></a>
		<a href="edit?num=${data.num}&page=${page}"><img src="./resources/images/edit.gif"></a>
		<a href="delete?num=${data.num}&page=${page}"><img src="./resources/images/del.gif"></a>
		<a href="list?num=${data.num}&page=${page}"><img src="./resources/images/list.gif"></a>
	</td> 
	</tr>
</table> 
<table>
	<tr>
		<td>작성자 : <a href="mailto:${data.name}">${data.name} </a> (ip:${data.bip})</td>
		<td>작성일 : ${data.bdate}</td>
		<td>조회수 : ${data.readcnt}</td>
	</tr>
	<tr>
		<td colspan="3" style="background-color: skyblue;"> 제목: ${data.title}</td>
	</tr>
	<tr>
		<td colspan="3">
		<textarea rows="10" style="width: 99%" readonly="readonly">${data.cont}</textarea>
		</td>
	</tr>

</table>
</body>
</html>