<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");
%>
<html>
<head>
<title>아이디 찾기</title>
<script type="text/javascript">

	function inputCheck() {
		if (document.findidFrm.name.value == "") {
			alert("이름을 입력해 주세요");
			document.findidFrm.name.focus();
			return;
		}
		if (document.findidFrm.email.value == "") {
			alert("이메일을 입력해 주세요");
			document.findidFrm.email.focus();
			return;
		}
		if (document.findidFrm.tel.value == "") {
			alert("전화번호를 입력해 주세요");
			document.findidFrm.tel.focus();
			return;
		}
		document.findidFrm.submit();
	}
</script>
</head>
<body>
<center>
		<form name="findidFrm" method="post" action="<%=request.getContextPath()%>/JSP/introBack/userFindIdAction.jsp">
			<table frame="void" align="center" style="margin-top:20%; border-bottom: 1px solid #C7C9D2; border-collapse: collapse; background-color: white;">
				<tr>
					<td align="left" colspan="2">
					<h2 style="color: #C7C9D2">아이디 찾기</h2>
					</td>
				</tr>
				<tr style="border-top: 1px solid #C7C9D2; border-collapse: collapse; height:60px;">
					<td>이  름</td>
					<td><input name="name"></td>
				</tr>

				<tr style="height:60px;">
					<td>이메일</td>
					<td><input  name="email"></td>
				</tr>
				<tr style="height:60px;">
					<td>휴대폰번호</td>
					<td><input  name="tel"></td>
				</tr>
				<tr style="border-top: 1px solid #C7C9D2; border-collapse: collapse; height:60px;">
					<td>
						<div align="left">
							<button style="background-color:transparent; border:1px solid #2f66ff; color: #2f66ff; " onclick="inputCheck()">입력</button>
						</div>
					</td>
					<td>
						<div align="right">
							<button type="reset" style="background-color:transparent; border:1px solid #2f66ff; color: #2f66ff; ">다시쓰기</button> 
						</div>
					</td>
				</tr>
			</table>
		</form>
</center>
</body>
</html>