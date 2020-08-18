<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="DAO" class="user.UserDAO"></jsp:useBean>
<!-- amkdoasdasdsadasd -->
<script>
	function idCheckOk(check){
		if(!check){
			opener.document.reg_form.idCheckOk.value="yes"
		}
		else{
			opener.document.reg_form.idCheckOk.value="no";
			opener.document.reg_form.id.value="";
		}
		self.close();
	}

</script>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean result = DAO.checkId(id);
	
%>

<html>
<head>

<title>ID 중복체그</title>
</head>
<body bgcolor = "#FFFFCC">
	<div align="center">
		<br/><b><%=id %></b>
		<%
			if(result){
				out.println("는 이미 존재하는 ID입니다<p/>");
			}
			else{
				out.println("는 사용 가능합니다<p/>");
			}
		%>
		<a href="#" onclick="idCheckOk(<%=result%>)">닫기</a>
	</div>
</body>
</html>