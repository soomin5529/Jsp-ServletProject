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

		<form name="findidFrm" method="post" action="userFindIdAction.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>아이디 찾기</h4></td>
				</tr>
				<tr>
					<td>이  름</td>
					<td><input name="name"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><input  name="email"></td>
				</tr>
					<tr>
					<td>휴대폰번호</td>
					<td><input  name="tel"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="입력" onclick="inputCheck()">&nbsp;
							<input type="reset" value="다시쓰기"> 
						</div>
					</td>
				</tr>
			</table>
		</form>


</body>
</html>