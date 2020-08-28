<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="user.MypageDAO"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("oldpwd");
	String name = request.getParameter("name");
	boolean result = dao.deleteMember(id, pwd, name);
	String msg = "회원 탈퇴실패";
	String location = "../front/userMypage.jsp";
	if(result){
		msg="탈퇴되었습니다. 다음에 다시 가입해주세요ㅜㅜ";
		location = "../introPage.jsp";
	}
%>

<script>
	alert("<%=msg%>");
	location.href="<%=location%>";
</script>