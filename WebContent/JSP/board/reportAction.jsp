<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="util.SHA256"%>
<%@page import="util.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = null;
	String msg = null;
	String location = null;
	
	if(session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	if(id == null){
		 msg = "로그인을 해주세요";
		 location = "introPage.jsp";
	}

	request.setCharacterEncoding("UTF-8");
	String reportTitle=null;
	String reportContent=null;
	
	if(request.getParameter("reportTitle") != null){
		reportTitle= (String) request.getParameter("reportTitle");
	}
	
	if (reportTitle == null || reportContent == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
//사용자에게 보낼 메시지

	String host=""
	
	%>
	
	
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>