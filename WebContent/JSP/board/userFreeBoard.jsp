<%@page import="java.text.SimpleDateFormat"%>
<%@page import="freeBoard.userFreeBoardDTO"%>
<%@page import="freeBoard.userFreeBoardDAO"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = null;
	String msg = null;
	String location = null;

	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	if (id == null) {
		msg = "로그인을 해주세요";
		location = "introPage.jsp";
	}
	
	 String titleName=null;
	 String freeContent=null;
	 String totalScore=null;
	 String comfortableScore=null;
	 String productScore=null;
	 String siteScore=null;
	 
	 if(request.getParameter("titleName") != null){
		 titleName = request.getParameter("titleName");
	 }
	 if(request.getParameter("freeContent") != null){
		 freeContent = request.getParameter("freeContent");
	 }
	 if(request.getParameter("totalScore") != null){
		 totalScore = request.getParameter("totalScore");
	 }
	 if(request.getParameter("comfortableScore") != null){
		 comfortableScore = request.getParameter("comfortableScore");
	 }
	 if(request.getParameter("siteScore") != null){
		 siteScore = request.getParameter("siteScore");
	 }

		if (titleName == null || freeContent == null || 
				totalScore == null || comfortableScore == null || siteScore == null ||
				titleName.equals("") || freeContent.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		else{
			userFreeBoardDAO userFreeBoardDAO = new userFreeBoardDAO();
			int result = userFreeBoardDAO.write(new userFreeBoardDTO(0,id,titleName,freeContent,totalScore,comfortableScore,productScore,siteScore,0));

			if (result == -1) {
				msg = "평가 등록에 실패했습니다";
				location = "userFreeBoard.jsp";
			}
			else{
				msg = "평가 등록에 성공했습니다";
				location = "userFreeBoard.jsp";
			}
	}
	
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>