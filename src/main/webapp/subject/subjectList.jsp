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
	SubjectDao sd = new SubjectDao();
	// ArrayList에 값 담기
	ArrayList<Subject> list = sd.selectSubjectListByPage(beginRow, rowPerPage);
	
	// 전체행 메소드로 받기
	int totalRow = sd.selectSubjectCnt();
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
	<!-- 부트스트랩5 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="../style.css" type="text/css" rel="stylesheet">
</head>
<body>	
	<h1 class = "center">과목리스트</h1>
	<div class="container left" >
		<a href="<%=request.getContextPath()%>/subject/addSubject.jsp">
		과목추가
		</a>
	</div>
	<div class="container center" >
		<table class="table table-bordered">
			<tr>
				<th>과목번호</th>
				<th>과목이름</th>
				<th>과목시간</th>
				<th>생성일</th>
				<th>수정일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				for(Subject s : list) {
			%>
			<tr>
				<td><%=s.getSubjectNo()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/subject/subjectOne.jsp?subjectNo=<%=s.getSubjectNo()%>">
						<%=s.getSubjectName()%>
					</a>
				</td>
				<td><%=s.getSubjectTime()%></td>
				<td><%=s.getCreatedate()%></td>
				<td><%=s.getUpdatedate()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/subject/modifySubject.jsp?subjectNo=<%=s.getSubjectNo()%>">
					수정
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/subject/removeSubjectAction.jsp?subjectNo=<%=s.getSubjectNo()%>">
					삭제
					</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<div class="container center" >
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