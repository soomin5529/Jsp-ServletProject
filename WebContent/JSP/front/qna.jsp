<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDTO" %>
<%@ page import="qna.QnaDAO" %>
<body>
<%	
	int pageNumber=-1; //기본 페이지 넘버
	
	//페이지 넘버값이 있을때
	
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<div class="content-wrap qna">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
		<div class="page-name">Q&A</div>
		<button class="btn03" onclick="location.href='/jspProject/JSP/front/qnaReg.jsp'">질문등록</button>
	</div>
		<%
				QnaDAO dao = new QnaDAO();
			//	String id = session.getAttribute("id");
			//	boolean authorChk = dao.getAuthorCheck(id);
				ArrayList<QnaDTO> list = dao.getList(pageNumber);
				for(int i = 0; i<list.size(); i++){
			%>
	
	<div class="card-wrap">
		<div class="card-box">
			<div class="card-head">
				<span class="highlight01"><%=list.get(i).getId()%></span>
				<span><%=list.get(i).getRegDate()%></span>
				<img src="<%=request.getContextPath()%>/images/ic_arrow.png"/>
			</div>
			<div class="card-body">
				<div class="tit"><%=list.get(i).getQnaTitle()%></div>
				<div class="con"><%=list.get(i).getQnaCon() %></div>
				
			<%-- 	<div class="answer">
					<div class="reply-back">
						<span>관리자</span>
						<span><%=list.get(i).getReplyDate()%></span>
						<div class="con"><%=list.get(i).getQnaReply()%></div>
					</div>
					<div class="reply-input">
						<input type="text" />
						<button class="btn03">등록</button>
					</div>
				</div> --%>
				
			</div>
			
		</div>
	</div>
	<%
	}
	%>
	<!-- 페이지 넘기기 -->
				<%
					if (pageNumber != 1) {
				%>
				<a href="qna.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">이전</a>
				<%
					}
					if (dao.nextPage(pageNumber)) {
				%>
				<a href="qna.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
				%>
</div>
</div>
</body>