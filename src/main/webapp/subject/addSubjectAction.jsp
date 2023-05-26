<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*"%>
<%
	// 유효성 검사
	if(request.getParameter("subjectName") == null || request.getParameter("subjectTime") == null
		|| request.getParameter("subjectName").equals("") || request.getParameter("subjectTime").equals("")) {
		response.sendRedirect("request.getContextPath()"+"/subject/subjectList.jsp");
		return;
	}

	// 값 전달받기
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	System.out.println(subjectName);
	System.out.println(subjectTime);

	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	SubjectDao sb = new SubjectDao();
	// row(입력유무) 값을 저장
	int row = sb.insertSubject(subject);
	System.out.println(row);
	
	if(row == 1) {
		System.out.println("과목추가성공");
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
	} else {
		System.out.println("과목추가실패");
		response.sendRedirect(request.getContextPath() + "/subject/addSubject.jsp");
	}
%>   