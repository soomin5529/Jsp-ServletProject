<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%
	String id = request.getParameter("id");
	
	boolean emailChecked = new UserDAO().getUserEmailChecked(id);
	if(emailChecked == false) {
	%>
<html>
  <head>
    <title>이메일 재인증</title>
  </head>
  <body>
	<div class="container">
	    <div class="alert alert-warning mt-4" role="alert">
		  이메일 주소 인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?
		</div>
		<a href="/jspProject/JSP/introBack/emailSendAction.jsp" >인증 메일 다시 받기</a>
    </div>

    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">

    </footer>


  </body>

</html>
<%}
%>