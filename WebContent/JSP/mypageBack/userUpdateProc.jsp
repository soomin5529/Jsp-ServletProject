<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="user.MypageDAO"/>
<jsp:useBean id="bean" class="user.UserDTO"/>
<jsp:setProperty property="*" name="bean"/>


<%
	boolean result = dao.updateMember(bean);
	String msg = "회원수정에 실패하였습니다.";
	if(result){
		msg="회원수정을 하였습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	window.history.back(-1);
</script>
