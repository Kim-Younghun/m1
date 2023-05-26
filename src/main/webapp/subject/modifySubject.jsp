<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	// 유효성 검사
	if(request.getParameter("subjectNo") == null || request.getParameter("subjectNo").equals("")) {
		response.sendRedirect(request.getContextPath() + "/subjectList.jsp");
		return;
	}
	// 값 받기
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// Subject 타입으로 subjectNo값 전달받기
	SubjectDao sd = new SubjectDao();
	Subject subjectOne = sd.selectSubjectOne(subjectNo);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 이용하여 수정값 전달 -->
	<form action="<%=request.getContextPath()%>/subject/modifySubjectAction.jsp">
		<input type="hidden" name="subjectNo" value=<%=subjectOne.getSubjectNo()%>>
		<table border=1>
			<tr>
				<th>과목이름</th>
				<th>과목시수</th>
				<th>수정일</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="subjectName" value="<%=subjectOne.getSubjectName()%>">
				</td>
				<td>
					<input type="number" name="subjectTime" value="<%=subjectOne.getSubjectTime()%>">
				</td>
				<td>
					<input type="datetime" name="updatedate" value="<%=subjectOne.getUpdatedate()%>" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit">과목수정</button>
	</form>
</body>
</html>