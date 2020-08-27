<%@page import="user.listDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, user.UserDTO"%>
<jsp:useBean id="dao" class="user.UserDAO" />
<%
	String category = request.getParameter("category");
	String sentence = request.getParameter("sentence");
	String boardid = "memberList";

	listDAO listDao = new listDAO();
	int pageSize = 5;
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List articleList = null;
	listDAO dbPro = listDAO.getInstance();
	count = listDao.getArticleCount(boardid, category, sentence);
	if (count > 0) {
		articleList = dbPro.memberList(startRow, endRow, boardid, category, sentence);
	}
	number = count - (currentPage - 1) * pageSize; 
%>
<div class="content-wrap memberList">
	<div class="content">
		<!-- 상단 페이지이름/버튼 영역 -->
		<div class="page-top cf">
			<div class="page-name">회원관리</div>
		</div>

		<!-- 테이블 영역 -->
		<form action="" method="post" name="memberList">
			<table class="tbl">
				<tr>
					<th>번호</th>
					<th>ID</th>
					<th>회원명</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>이메일인증여부</th>
					<th>계정권한</th>
				</tr>
				<% if(count == 0) {%>
				<tr>
					<td colspan="11">검색된 회원이 없습니다.</td>
				</tr>
				<%}else{ 
					for (int i = 0; i < articleList.size(); i++) {
						UserDTO bean = (UserDTO) articleList.get(i);
						String memid = bean.getId();
						String memname = bean.getName();
						String email = bean.getEmail();
						String tel = bean.getBirthdate();
						String birthdate = bean.getBirthdate();
						String gender = bean.getGender();
						String zipcode = bean.getZipcode();
						String address = bean.getAddress();
						boolean emailcheck = bean.isUserEmailChecked();
						int author = bean.getAuthor();
				%>
				<tr>
					<td><%=number--%></td>
					<td><%=memid%></td>
					<td><%=memname%></td>
					<td><%=email%></td>
					<td><%=tel%></td>
					<td><%=birthdate%></td>
					<td><%=gender%></td>
					<td><%=zipcode%></td>
					<td><%=address%></td>
					<td><%=emailcheck == true ? "완료" : "미완료"%></td>
					<td><%=author == 0 ? "일반유저" : "관리자"%></td>
				</tr>
				<%
					}}
				%>
			</table>
		</form>

		<!-- 페이지번호 영역 -->		
		<div class="page-num" align="center">
		<%
			int bottomLine = 3;
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
				int endPage = startPage + bottomLine - 1;
				if (endPage > pageCount)
					endPage = pageCount;
				if (startPage > bottomLine) {%>
		<a href="memberList.jsp?pageNum=<%=startPage - bottomLine%>">[이전]</a>
		<%}%>
		<%for (int i = startPage; i <= endPage; i++) {%>
		<a href="memberList.jsp?pageNum=<%=i%>"> <%
	 	if (i != currentPage){
 				out.print("[" + i + "]");
	 	}else{
 				out.print("<span class='on'>[" + i + "]</span>");}%>
		</a>
		<%}
			if (endPage < pageCount) {%>
		<a href="memberList.jsp?pageNum<%=startPage + bottomLine%>">[다음]</a>
		<%}}%>
		</div>

		<!-- 검색 영역 -->
		<div class="page-bottom" align="center">
			<form name="searchForm" method="post">
				<select name="category" class="category">
					<option value="id">ID</option>
				</select> <input type="text" size="16" name="sentence" class="sentence" />
				<button type="submit" class="btn03-reverse">찾기</button>
				<input type="hidden" name="nowPage" value="1" />
			</form>
		</div>
	</div>
</div>
</body>