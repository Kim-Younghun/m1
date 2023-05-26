<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 형식 사용해서 값 받기 -->
	<form action="<%=request.getContextPath()%>/subject/addSubjectAction.jsp">
		<table border=1>
			<tr>
				<th>과목이름</th>
				<th>과목시수</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="subjectName">
				</td>
				<td>
					<input type="number" name="subjectTime">
				</td>
			</tr>
		</table>
		<button type="submit">과목추가</button>
	</form>
</body>
</html>