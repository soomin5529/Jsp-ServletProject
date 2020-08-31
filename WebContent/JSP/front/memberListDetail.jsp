<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDTO, user.MypageDAO"%>
<%
	String memid = request.getParameter("memid");
	MypageDAO dao = new MypageDAO();
	UserDTO mem = dao.select(memid);
%>

<div class="content-wrap memberListDetail">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<form method="post" name="regFrm">
	<div class="page-top cf">
		<div class="page-name">회원 정보 상세</div>
		<button type="button" class="btn03" onclick="memberUpdate()">회원정보 수정</button>
		<button type="button" class="btn04 margin-r" onclick="location.href='<%=request.getContextPath()%>/JSP/front/memberList.jsp'">목록으로</button>
	</div>
	
	<!-- 테이블 영역 -->
	<table class="tbl tbl-reg">
			<tr>
				<th>아이디</th>
				<td>
					<input type="hidden" name="id" value="<%= mem.getId() %>" />
					<%= mem.getId() %>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="oldpwd" value="<%=mem.getPwd() %>" disabled/>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" name="pwd" placeholder="변경할 비밀번호를 입력해주세요"/>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호 확인</th>
				<td>
					<input type="password" name="repwd" placeholder="변경할 비밀번호를 다시 입력해주세요"/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="hidden" name="name" value="<%=mem.getName()%>" />
					<%=mem.getName()%>
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<input type="hidden" name="email" value="<%= mem.getEmail()%>" />
					<%= mem.getEmail()%>
				</td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td>
					<input type="hidden" name="agency" value="<%=mem.getAgency()%>" />
					<input type="hidden" name="tel" value="<%=mem.getTel()%>" />
					<%=mem.getAgency()%>&nbsp;<%=mem.getTel()%>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="hidden" name="birthdate" value="<%= mem.getBirthdate()%>" />
					<%= mem.getBirthdate()%>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="hidden" name="gender" value="<%=mem.getGender()%>" />
					<%=mem.getGender()%>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="hidden" name="zipcode" value="<%=mem.getZipcode()%>" />
					<%=mem.getZipcode()%>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="hidden" name="address" value="<%=mem.getAddress()%>" />
					<%=mem.getAddress()%>
				</td>
			</tr>
			<tr>
				<th>이메일인증여부</th>
				<td>
					<input type="hidden" name="userEmailChecked" value="<%=mem.isUserEmailChecked()%>"/>
					<%=mem.isUserEmailChecked() == true ? "완료" : "미완료"%>
					<!-- <button type="button" class="btn03 float-r" onclick="document.location.href='/jspProject/JSP/introBack/emailSendAction.jsp'">메일 재전송</button> -->
				</td>
			</tr>
			<tr>
				<th>계정권한</th>
				<td>
					<input type="radio" name="author" value="0" <%=mem.getAuthor() == 0 ? "checked" : ""%> id="author01"/> <label for="author01">일반유저</label>&nbsp;
					<input type="radio" name="author" value="1" <%=mem.getAuthor() == 1 ? "checked" : ""%> id="author02"/> <label for="author02">관리자</label>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
<script>
	function memberUpdate(){
		var regForm = document.regFrm;
	    var pwd = regForm.pwd.value;
	    var repwd = regForm.repwd.value;
	    
	   	if(pwd!=repwd){
	    	alert("변경할 비밀번호를 확인해주세요");
	    }else{
	    	regForm.action = "<%=request.getContextPath()%>/JSP/mypageBack/userUpdateProc.jsp";
	    	regForm.submit();
	    }
	}
</script>