<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*"%>
<%
	//유효성
	if(request.getParameter("teacherNo") == null || request.getParameter("teacherNo").equals("")
		|| request.getParameter("teacherName") == null || request.getParameter("teacherName").equals("")
		|| request.getParameter("teacherHistory") == null || request.getParameter("teacherHistory").equals("")
		|| request.getParameter("teacherId") == null || request.getParameter("teacherId").equals("")) {
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}

	// 값 전달 받기
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	String teacherId = request.getParameter("teacherId");
	
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	teacher.setTeacherId(teacherId);
	
	TeacherDao td = new TeacherDao();
	int row = td.updateTeacher(teacher);
	
	if(row == 1) {
		System.out.println("교사 수정 완료");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherOne.jsp?teacherNo="+ teacher.getTeacherNo());
	} else {
		System.out.println("교사 수정 실패");
		response.sendRedirect(request.getContextPath()+"/teacher/modifyTeacher.jsp");
	}
%>   
