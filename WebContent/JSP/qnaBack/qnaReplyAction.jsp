<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "qna.QnaDAO" %>
<%-- <%@ page import = "qna.QnaDTO" %> --%>
<%@ page import = "java.io.PrintWriter" %>
<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="qna.QnaDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="qnaReply" name="dto"/>
<jsp:setProperty property="qnaCode" name="dto"/>  
    
<%
	QnaDAO dao = new QnaDAO(); 
	String id = (String) session.getAttribute("id");
	int chkAuthor = dao.checkAuthor(id);
	String msg = null;
	String location = null;
	
	if (id == null) {
		msg = "로그인을 하세요.";
		location = "/jspProject/JSP/introPage.jsp";
	} else {
		if (chkAuthor == 0) {
			msg = "답변 등록 권한이 없습니다.관리자가 아닙니다.";
			location = "/jspProject/JSP/front/qna.jsp";
		} else {
			int result = dao.qnaReply(dto.getQnaReply(),dto.getQnaCode());
			if (result == -1) {
				msg = "답변등록을 실패했습니다.";
				location = "/jspProject/JSP/front/qnaReg.jsp";
			} else {
				msg = "관리자의 답변이 등록되었습니다";
				location = "/jspProject/JSP/front/qna.jsp";
			
			}
		}
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>




