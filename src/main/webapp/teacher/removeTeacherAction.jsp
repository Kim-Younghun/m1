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
	int row = td.deleteTeacher(teacherNo);
	
	if(row == 1) {
		System.out.println("교사정보 삭제 완료");
	} else {
		System.out.println("교사정보 삭제 실패");
	}
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>    
