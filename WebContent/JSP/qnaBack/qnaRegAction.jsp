<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "qna.QnaDAO" %>
<%-- <%@ page import = "qna.QnaDTO" %> --%>
<%@ page import = "java.io.PrintWriter" %>
<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="qna.QnaDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="qnaTitle" name="dto"/>
<jsp:setProperty property="qnaCon" name="dto"/> 
    
<%
	String id = (String) session.getAttribute("id");
	String msg = null;
	String location = null;
	
	if (id == null) {
		msg = "로그인을 하세요.";
		location = "/jspProject/JSP/introPage.jsp";
	} else {
		if (dto.getQnaTitle()== null || dto.getQnaCon() == null) {
			msg = "입력이 안 된 사항이 있습니다.";
			location = "/jspProject/JSP/front/qnaReg.jsp";
		} else {
			QnaDAO dao = new QnaDAO();
			int result = dao.writeQna(dto.getQnaTitle(), id, dto.getQnaCon());
			if (result == -1) {
				msg = "글쓰기가 실패했습니다.";
				location = "/jspProject/JSP/front/qnaReg.jsp";
			} else {
				msg = "질문이 등록되었습니다 답변을 기다려용~.";
				location = "/jspProject/JSP/front/qna.jsp";
			
			}
		}
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>




