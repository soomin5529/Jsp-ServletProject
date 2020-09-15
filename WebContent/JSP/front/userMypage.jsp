<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDTO, user.MypageDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	MypageDAO dao = new MypageDAO();
	UserDTO mem = dao.select(id);
	
	if(session.getAttribute("id") != null){
		 id = (String) session.getAttribute("id");
	}
	
	if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = '/jspProject/JSP/introPage.jsp'");
		script.println("</script>");
		script.close();
		return;	
	}
%>
<body>
<div class="content-wrap usermypage">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<form method="post" name="regFrm">
	<div class="page-top cf">
		<div class="page-name">마이페이지</div>
		<button type="button" class="btn02" onclick="memberDelete()">탈퇴하기</button>
		<button type="button" class="btn03 margin-r" onclick="memberUpdate()">회원정보 수정</button>
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
				<th>기존 비밀번호</th>
				<td>
					<input type="password" name="oldpwd" placeholder="회원정보 수정, 탈퇴 시 기존 비밀번호를 입력해주세요"/>
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
					<input type="text" name="name" value="<%=mem.getName()%>" />
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="email" value="<%= mem.getEmail()%>" /></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td>
					<input type = "radio" name = "agency" value="skt" id="agency01" <%=mem.getAgency().equals("skt") ? "checked" : "" %>> <label for="agency01">SKT </label> &nbsp;
	                <input type = "radio" name = "agency" value="kt" id="agency02" <%=mem.getAgency().equals("kt") ? "checked" : "" %>> <label for="agency02">KT </label> &nbsp;
	                <input type = "radio" name = "agency" value="lgu+" id="agency03" <%=mem.getAgency().equals("lgu+") ? "checked" : "" %>> <label for="agency03">LGU+</label> &nbsp;<br> 
	                <input type="text" name="tel" placeholder="-빼고 입력해주세요" value="<%=mem.getTel()%>">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="birthdate" size="6" value="<%= mem.getBirthdate()%>" placeholder="ex)950101"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" id="male" value="남" <%=mem.getGender().equals("남") ? "checked" : "" %> /> <label for="male">남</label> &nbsp;
					<input type="radio" name="gender" id="female" value="여" <%=mem.getGender().equals("여") ? "checked" : "" %>/> <label for="female">여</label>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="zipcode" style="width:100px;" id="sample4_postcode" value="<%=mem.getZipcode()%>" readonly/>
					<button type="button" onClick="sample4_execDaumPostcode()" class="btn03">우편번호찾기</button>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="sample4_roadAddress" value="<%=mem.getAddress()%>"/></td>
			</tr>
		</table>
		<input type="hidden" name="author" value="<%=mem.getAuthor()%>" />
	</form>
</div>
</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>
<script>
	//회원정보 수정
	function memberUpdate(){
		var regForm = document.regFrm;
	    var oldpwd = regForm.oldpwd.value;
	    var pwd = regForm.pwd.value;
	    var repwd = regForm.repwd.value;
	    
	    if(oldpwd==""){
	        alert("비밀번호를 입력해주세요.");
	    }else if(oldpwd != <%=mem.getPwd()%>){
	    	alert("기존 비밀번호가 맞지 않습니다.")
	    }
	    else if(pwd!=repwd){
	    	alert("변경할 비밀번호를 확인해주세요");
	    }else{
	    	regForm.action = "<%=request.getContextPath()%>/JSP/mypageBack/userUpdateProc.jsp";
	    	regForm.submit();
	    }
	}
	
	//회원탈퇴
	function memberDelete(){
		var regForm = document.regFrm;
		var oldpwd = regForm.oldpwd.value;
		if(oldpwd==""){
	        alert("비밀번호를 입력해주세요.");
		}else if(oldpwd != <%=mem.getPwd()%>){
	    	alert("기존 비밀번호가 맞지 않습니다.")
	    }else{
	    	regForm.action = "<%=request.getContextPath()%>/JSP/mypageBack/userDeleteProc.jsp";
	    	regForm.submit();
	    }
	}
	
</script>