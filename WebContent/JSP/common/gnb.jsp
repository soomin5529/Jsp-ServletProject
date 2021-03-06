<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userdao" class="user.UserDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");	
	String id = (String) session.getAttribute("id");
	String name= (String) session.getAttribute("name");
	
	String board = "";
	
	if(request.getParameter("pageNum") != null){
		session.setAttribute("pageNum", request.getParameter("pageNum"));
	}
	if(request.getParameter("boardid") != null){
		session.setAttribute("boardid", request.getParameter("boardid"));
		session.setAttribute("pageNum", "1");
	}
	String pageNum = (String)session.getAttribute("pageNum");
	if(pageNum == null) pageNum = "1";
	
	int authorCheck = userdao.checkAuthor(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUE OCEAN</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/201901_reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<script src = "http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jcommon.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js" charset="utf-8"></script>
</head>
<body>
	<!-- 왼쪽 메뉴 영역 -->
	<div class="gnb">
	<%if(authorCheck == 0) { %>
		<div class="logo pointer" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMainList.jsp'">
		<%}
	else{%>
	<div class="logo pointer" onclick="location.href='<%=request.getContextPath()%>/JSP/front/adminMain.jsp'">
	<%} %>
			<b>BLUE</b><br />OCEAN
		</div>
		<ul class="gnb-list">
			<%if(authorCheck == 0){%>
				<!-- 사용자 권한 메뉴 -->
				<li id="userMain"><a href="<%=request.getContextPath()%>/JSP/front/userMainList.jsp">Home</a></li>
				<%-- <li id="schedule"><a
					href="<%=request.getContextPath()%>/JSP/front/userSchedule.jsp">Schedule</a></li> --%>
				<li id="mypage"><a href="<%=request.getContextPath()%>/JSP/front/userMypage.jsp">My page</a></li>
			<%} else if(authorCheck == 1){ %>
				<!-- 관리자 권한 메뉴 -->
				<li id="adminMain"><a href="<%=request.getContextPath()%>/JSP/front/adminMain.jsp">Home</a></li>
				<li id="auctionList"><a	href="<%=request.getContextPath()%>/JSP/front/auctionList.jsp">Auction</a></li>
				<li id="memberList"><a href="<%=request.getContextPath()%>/JSP/front/memberList.jsp">Member</a></li>
			<%} %>
			<!-- 공통 권한 메뉴 -->
			<li id="qna"><a href="<%=request.getContextPath()%>/JSP/front/qna.jsp">Q&A</a></li>
		</ul>
		<div class="gnb-bottom"></div>
	</div>
	</div>
	
	<!-- 상단 헤더 영역-->
	<div class="header">
		<div class="info">
		<%if(authorCheck == 1){ %>
			<span class="highlight01 pointer" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMypage.jsp'"><b>관리자</b></span>님 반갑습니다
			<%} else{ %>
			<span class="highlight01 pointer" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMypage.jsp'"><%=name%></span>님 반갑습니다
			<%} %>
		</div>
		<div class="right">
			<a href="<%=request.getContextPath()%>/JSP/introBack/userLogOut.jsp">logout</a>
		</div>
	</div>