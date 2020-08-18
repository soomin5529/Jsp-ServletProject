<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String url = "introPage.jsp";
	String msg = "로그인에 실패 하였습니다";
	
	boolean result = dao.loginUser(id, pwd);
	if(result){
		session.setAttribute("id", id);
		msg = "환영합니다";
		url = "mainPage.jsp";
	}
%>
<script>

	alert("<%=msg%>");
	location.href="<%=url%>";
</script>