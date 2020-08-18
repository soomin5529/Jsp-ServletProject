<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "util.SHA256" %>
<%@ page import = "java.io.PrintWriter" %>

<jsp:useBean id="user" class="user.UserDTO"/>
<jsp:setProperty property="*" name="user"/>

<% request.setCharacterEncoding("UTF-8"); 
	String id = request.getParameter("id");
%>
	

<%
	UserDAO userDAO = new UserDAO();
	boolean result = userDAO.join(user);
	String msg = "회원가입에 실패 하였습니다";
	String location = "introPage.jsp";
	if(result){
		session.setAttribute("id", id);
		msg = "회원가입이 되었습니다 반갑습니다.";
		location = "emailSendAction.jsp";
	}

%>

<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>