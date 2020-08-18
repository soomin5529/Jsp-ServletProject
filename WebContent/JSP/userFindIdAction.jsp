<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String url = null;
	String msg = null;
	
	String id = dao.findId(name, tel, email);
	if(id == null){
		 url = "introPage.jsp";
		 msg = "존재하지 않은 계정입니다";
	}
	else{
		url = "introPage.jsp";
		 msg = id + " 입니다";
	}
%>
<script>
	alert("찾으시는 계정은 <%=msg%>");
	location.href="<%=url%>";
</script>