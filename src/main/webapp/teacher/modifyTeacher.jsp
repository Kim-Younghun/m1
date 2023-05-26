<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*"%>
<%
	//유효성
	if(request.getParameter("teacherNo") == null || request.getParameter("teacherNo").equals("")) {
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	System.out.println(teacherNo);
	
	TeacherDao td = new TeacherDao();
	Teacher teacherOne = td.selectTeacherOne(teacherNo);
	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 형식 사용해서 값 받기 -->
	<form action="<%=request.getContextPath()%>/teacher/modifyTeacherAction.jsp">
		<input type="hidden" name="teacherNo" value="<%=teacherOne.getTeacherNo()%>">
		<table border=1>
			<tr>
				<th>교사ID</th>
				<th>교사이름</th>
				<th>교사이력</th>
				<th>수정이력</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="teacherId" value="<%=teacherOne.getTeacherId()%>">
				</td>
				<td>
					<input type="text" name="teacherName" value="<%=teacherOne.getTeacherName()%>">
				</td>
				<td>
					<input type="text" name="teacherHistory" value="<%=teacherOne.getTeacherHistory()%>">
				</td>
				<td>
					<input type="datetime" name="updatedate" value="<%=teacherOne.getUpdatedate()%>" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit">교사수정</button>
	</form>
</body>
</html>