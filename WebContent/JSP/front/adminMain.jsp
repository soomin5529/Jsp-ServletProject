<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("id") != null){
	 id = (String) session.getAttribute("id");
}

if(id == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요');");
	script.println("location.href = '/jspProject/JSP/introPage.jsp'");
	script.println("</script>");
	script.close();
	return;	
}
%>
<body>
	<div class="content-wrap admin">
		<div class="content">
			<%@ include file="/JSP/front/chart.jsp" %>	
			<%@ include file="/JSP/front/calender.jsp" %>
		</div>
	</div>
	

</body>