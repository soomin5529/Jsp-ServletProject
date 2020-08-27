<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDAO" %>
<%
    request.setCharacterEncoding("UTF-8");
	
	int qnaCode = Integer.parseInt(request.getParameter("qnaCode"));
	
	QnaDAO qna = new QnaDAO();
	String Context = qna.getQna(qnaCode);
%>
<body>
<div class="content-wrap memberList">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
	<form action="<%=request.getContextPath()%>/JSP/qnaBack/qnaReplyAction.jsp"  method="post">
	
		<button class="btn03" type="submit">답변하기</button>
	</form>
	<button class="btn04 margin-r" onclick="location.href='/jspProject/JSP/front/qna.jsp'">Q&A</button>
	
	</div>
	<!-- 테이블 영역 -->
	
		<table class="tbl tbl-reg">
			<tr>
				<th>질문내용</th>
				<td>
					<%=Context%>
				</td>
			</tr>
			<tr>
				<th>답변하기</th>
				<td>
					<textarea cols="30" name="qnaCon" rows="10"></textarea>
				</td>
			</tr>			
		</table>
	</form>
</div>
</div>
</body>