<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<div class="content-wrap memberList">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
	<form action="<%=request.getContextPath()%>/JSP/qnaBack/qnaRegAction.jsp"  method="post">
		<div class="page-name">질문하기</div>
		<button class="btn03" type="submit">등록하기</button>
		<button class="btn04 margin-r" type="button" onclick="location.href='/jspProject/JSP/front/qna.jsp'">돌아가기</button>
	</div>
	<!-- 테이블 영역 -->
		<table class="tbl tbl-reg">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="qnaTitle" placeholder="질문 제목을 입력하세요"/>
				</td>
			</tr>
			<tr>
				<th>질문하기</th>
				<td>
					<textarea cols="30" name="qnaCon" rows="10"></textarea>
				</td>
			</tr>			
		</table>
		
	</form>
	 
</div>
</div>
</body>