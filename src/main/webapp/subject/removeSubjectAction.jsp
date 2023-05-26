<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*"%>
<%
	// 유효성 검사
	if(request.getParameter("subjectNo") == null 
		|| request.getParameter("subjectNo").equals("")) {
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
 	// 요청값 받기
 	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// dao 메소드 추가 및 row값 받기
	SubjectDao sd = new SubjectDao();
	int row = sd.deleteSubject(subjectNo);
	
	if(row == 1) {
		System.out.println("삭제성공");
	} else {
		System.out.println("삭제실패");
	}
	response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
%>
   
