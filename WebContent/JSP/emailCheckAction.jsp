<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "util.SHA256" %>
<%@ page import = "java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	UserDAO userDAO = new UserDAO();
	String id = null;
	String msg = null;
	String location = null;
	
	
	if(session.getAttribute("id") != null){
		 id = (String) session.getAttribute("id");
	}
	if(id == null){
		 msg = "로그인을 해주세요";
		 location = "introPage.jsp";
	}
	

	String userEmail = userDAO.getUserEmail(id);
	
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	
	if(isRight == true){
		userDAO.setUserEmailChecked(id);
		 msg = "인증에 성공했습니다";
		 location = "mainPage.jsp";
		 
	}
	else{
		 msg = "유효하지 않는 코드입니다";
		 location = "introPage.jsp";
	}
	

%>

<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>
