<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDTO" %>
<%@ page import="qna.QnaDAO" %>
<%@ page import="user.UserDAO" %>

<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/201901_reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css"> --%>
<body>
<%	
	int pageNumber=1; //기본 페이지 넘버
	//페이지 넘버값이 있을때
	if(request.getParameter("pageNumber")!=null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	QnaDAO dao = new QnaDAO();
	int AuthorChk = dao.checkAuthor(id);
%>
<div class="content-wrap qna">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
		<div class="page-name">Q&A</div>
		
		<% if(AuthorChk == 0){ %>
		<button class="btn03" onclick="location.href='/jspProject/JSP/front/qnaReg.jsp'">질문등록</button>
		<%
		}
		%>
	</div>
		<%
				
			//	UserDAO user = new UserDAO();
			//  String userID = (String) session.getAttribute("id");
			//	String chkID = user.getID("userID");
			//	boolean authorChk = dao.getAuthorCheck(id);
				
				
				ArrayList<QnaDTO> list = dao.getList(pageNumber);
				for(int i = 0; i<list.size(); i++){
			%>
	
	<div class="card-wrap">
		<div class="card-box">
			<div class="card-head">
				<span class="highlight01"><%=list.get(i).getId()%></span>
				<span><%=list.get(i).getRegDate()%></span>
				<%-- <img src="<%=request.getContextPath()%>/images/ic_arrow.png"/> --%>
			</div>
			<div class="card-body">
				<div class="tit"><%=list.get(i).getQnaTitle()%></div>
				<div class="con"><%=list.get(i).getQnaCon() %></div>
		<%-- 
			 	<div class="answer">
					<div class="reply-back">
						<span>관리자</span>
						<span><%=list.get(i).getReplyDate()%></span>
						<div class="con"><%=list.get(i).getQnaReply()%></div>
					</div>
				
				</div>  --%>
				
				<% if(AuthorChk == 1){ %>
				<form action="<%=request.getContextPath()%>/JSP/front/qnaReply.jsp" method="post">
				<div class="reply-input">
						<button class="btn03" type="submit">답변하기</button>
						<input type="hidden" name="qnaCode" value="<%=list.get(i).getQnaCode()%>">
					</div>
				</form>
				<%
				}
				%>
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
				
	<%-- 	<%
			if(userID == chkID){
		%>
				<a href="update.jsp" class="btn btn-primary">수정</a>
				<a href="delete.jsp" class="btn btn-primary">삭제</a>
		<%					
			}
		%> --%>
</div>
</div>
</body>