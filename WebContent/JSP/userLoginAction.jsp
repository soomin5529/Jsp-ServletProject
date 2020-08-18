<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dao" class="user.UserDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String url = null;
	String msg = null;
	
	
	int result = dao.loginUser(id, pwd);
	boolean chk = dao.getUserEmailChecked(id);
	
	if(result == 1 && chk==true){
		session.setAttribute("id", id);
		msg = "환영합니다";
		url = "mainPage.jsp";
	}
	
	else if(result == 1 && chk==false){
		msg = "이메일 인증이 안되었습니다";
		url = "emailSendConfirm.jsp";
	}
	else if(result == 0){
		url="introPage.jsp";
		msg="비밀번호가 틀립니다ㅠㅠ";
	}
	else if(result == -1){
		url="introPage.jsp";
		msg="존재하지 않는 아이디입니다";
	}
	else if(result == -2){
		url="introPage.jsp";
		msg="데이터베이스 오류입니다";
	}
%>
<script>

	alert("<%=msg%>");
	location.href="<%=url%>";
</script>