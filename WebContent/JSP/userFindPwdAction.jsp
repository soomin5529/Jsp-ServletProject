<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String url = null;
	String msg = null;
	
	String pwd = dao.findPwd(id, name, email, tel);
	if(pwd == null){
		 url = "introPage.jsp";
		 msg = "존재하지 않은 계정입니다";
	}
	else{
		url = "introPage.jsp";
		 msg = pwd + " 입니다";
	}
%>
<script>
	alert("찾으시는 비밀번호는 <%=msg%>");
	location.href="<%=url%>";
</script>