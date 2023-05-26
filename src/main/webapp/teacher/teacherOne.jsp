<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*"%>
<%
	// 유효성
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
	<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp">
		교사리스트
	</a>
	<div>
		<h1>교사상세정보</h1>
		<table border="1">
			<tr>
				<th>교사번호</th>
				<th>교사ID</th>
				<th>교사이름</th>
				<th>교사이력</th>
				<th>입사이력</th>
				<th>수정이력</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr>
				<td><%=teacherOne.getTeacherNo()%></td>
				<td><%=teacherOne.getTeacherId()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=teacherNo%>">
						<%=teacherOne.getTeacherName()%>
					</a>
				</td>
				<td><%=teacherOne.getTeacherHistory()%></td>
				<td><%=teacherOne.getCreatedate()%></td>
				<td><%=teacherOne.getUpdatedate()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/modifyTeacher.jsp?teacherNo=<%=teacherNo%>">
						수정
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/removeTeacherAction.jsp?teacherNo=<%=teacherNo%>">
						삭제
					</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>