<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDTO" %>
<%@ page import="qna.QnaDAO" %>
<%@ page import="user.UserDAO" %>
<body>
<%	
	if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = '/jspProject/JSP/introPage.jsp'");
		script.println("</script>");
		script.close();
		return;	
	}
	String msg=null;
	String location=null;
	
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
		
		<% if(AuthorChk == 0 && id !=null){ %>
		<button class="btn03" onclick="location.href='/jspProject/JSP/front/qnaReg.jsp'">질문등록</button>
		<%
		}
		%>
	</div>
		<%
				ArrayList<QnaDTO> list = dao.getList(pageNumber);
				for(int i = 0; i<list.size(); i++){
			%>
	
	<div class="card-wrap">
		<div class="card-box">
			<div class="card-head">
				<span class="highlight01"><%=list.get(i).getId()%>님</span>
				<span class="regdate"><%=list.get(i).getRegDate()%></span>
				<img src="<%=request.getContextPath()%>/images/ic_arrow.png"/>
			</div>
			<div class="card-body">
				<div class="question">
					<div class="tit"><%=list.get(i).getQnaTitle()%></div>
					<div class="con"><%=list.get(i).getQnaCon() %></div>
				</div>
			
				
		<% 
			boolean replyChk = dao.chkReply(list.get(i).getQnaCode());
			if(replyChk != false){
		%>
			
			 	<div class="answer">
					<div class="reply-back">
						<span class="highlight01">관리자 </span>
						<span class="regdate"><%=list.get(i).getReplyDate()%></span>
						<div class="con"><%=list.get(i).getQnaReply()%></div>
					</div>
			
				</div>
				
			<%
			}
		%>
			<% if(AuthorChk == 1 && replyChk == false){ %>
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
					class="pagination float-l">이전</a>
				<%
					}
					if (dao.nextPage(pageNumber)) {
				%>
				<a href="qna.jsp?pageNumber=<%=pageNumber + 1%>"
					class="pagination float-r">다음</a>
				<%
					}
				%>
</div>
</div>
</body>


