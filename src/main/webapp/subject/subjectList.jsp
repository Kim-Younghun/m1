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
	// 표시할 게시글 수
	int rowPerPage = 3;
	
	// 시작행
	int beginRow = (currentPage-1) * rowPerPage;

	// Dao 객체추가
	SubjectDao sb = new SubjectDao();
	// ArrayList에 값 담기
	ArrayList<Subject> list = sb.selectSubjectListByPage(beginRow, rowPerPage);
	
	// 전체행 메소드로 받기
	int totalRow = sb.selectSubjectCnt();
	System.out.println(totalRow);
	
	// 네비게이션에 표시될 페이지 수
	int pagePerPage = 10;
	int lastPage = totalRow / rowPerPage;
	if(totalRow%rowPerPage != 0){
		lastPage = lastPage + 1;
	}
	// 라스트페이지 확인
	System.out.println(lastPage);
	int minPage = (((currentPage - 1) / pagePerPage) * pagePerPage) + 1;
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
		<h1>과목리스트</h1>
		<table border="1">
			<tr>
				<th>과목번호</th>
				<th>과목이름</th>
				<th>과목시간</th>
				<th>생성일</th>
				<th>수정일</th>
			</tr>
			<%
				for(Subject s : list) {
			%>
			<tr>
				<td><%=s.getSubjectNo()%></td>
				<td><%=s.getSubjectName()%></td>
				<td><%=s.getSubjectTime()%></td>
				<td><%=s.getCreatedate()%></td>
				<td><%=s.getUpdatedate()%></td>
			</tr>
			<%
				}
			%>
		</table>
			<!-- 페이지네비게이션 -->
			<%
				if(minPage > 1){
			%>
				<a href="<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=minPage-1%>">이전</a>
			<%
				} for(int i=minPage; i<=maxPage; i=i+1){
					if(i == currentPage){
			%>
					<span><%=i%></span>&nbsp;
			<%			
					} else {
			%>
					<a href="<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=i%>"><%=i%></a>&nbsp;
			<%			
					}
				}
				if(maxPage != lastPage){
			%>
				<a href ="<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=maxPage+1%>">다음</a>
			<%		
				}
			%>	
	</div>
</body>
</html>