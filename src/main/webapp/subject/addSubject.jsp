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
	<!-- 부트스트랩5 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="../style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- form 형식 사용해서 값 받기 -->
	<form action="<%=request.getContextPath()%>/subject/addSubjectAction.jsp">
		<table>
			<tr>
				<td>과목이름</td>
				<td>과목시수</td>
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