<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*"%>
<%

	//현재페이지 선언
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 3;
	int beginRow = (currentPage-1) * rowPerPage;
	
	//Dao 객체 생성 후 메서드 호출
	TeacherDao td = new TeacherDao();
	//ArrayList<HashMap<String, Object>>에 값 담기
	ArrayList<HashMap<String, Object>> mapList = td.selectTeacherListByPage(beginRow, rowPerPage);
	
	// 전체행 메소드(교사테이블의 전체행)로 받기
	int totalRow = td.selectTeacherCnt();
	System.out.println(totalRow);
	
	// 네비게이션에 표시될 페이지 수
	int pagePerPage = 10;
	int lastPage = totalRow / rowPerPage;
	if(totalRow % rowPerPage != 0) {
		lastPage += 1; 
	}
	
	int minPage = ((currentPage - 1) / pagePerPage * pagePerPage) + 1;
	int maxPage = minPage + (pagePerPage - 1);
	if(maxPage > lastPage){
		maxPage = lastPage;
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>교사리스트</h1>
		<table border="1">
			<tr>
				<th>교사이름</th>
				<th>담당과목</th>
				<th>담당과목수</th>
			</tr>
			<%
				for(HashMap<String, Object> m : mapList) {
			%>
			<tr>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=m.get("teacherNo")%>">
						<%=m.get("teacherName")%>
					</a>
				</td>
				<td><%=m.get("subjectName")%></td>
				<td><%=m.get("cnt")%></td>
			</tr>
			<%
				}
			%>
		</table>
			<!-- 페이지네비게이션 -->
			<%
				if(minPage > 1){
			%>
				<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=minPage-1%>">이전</a>
			<%
				} for(int i=minPage; i<=maxPage; i=i+1){
					if(i == currentPage){
			%>
					<span><%=i%></span>&nbsp;
			<%			
					} else {
			%>
					<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>"><%=i%></a>&nbsp;
			<%			
					}
				}
				if(maxPage != lastPage){
			%>
				<a href ="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=maxPage+1%>">다음</a>
			<%		
				}
			%>	
	</div>
</body>
</html>