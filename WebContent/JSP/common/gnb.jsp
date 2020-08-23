<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/201901_reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<script src = "http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js" charset="utf-8"></script>
</head>
<body>
	<!-- 왼쪽 메뉴 영역 -->
	<div class="gnb">
		<div class="logo pointer" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMain.jsp'">
			<b>BLUE</b><br />OCEAN
		</div>
		<ul class="gnb-list">
			<!-- 사용자 권한 메뉴 -->
			<li id="userMain"><a href="<%=request.getContextPath()%>/JSP/front/userMain.jsp">Home</a></li>
			<li id="schedule"><a
				href="<%=request.getContextPath()%>/JSP/front/userSchedule.jsp">Schedule</a></li>
			<li id="mypage"><a href="<%=request.getContextPath()%>/JSP/front/userMypage.jsp">My page</a></li>
			<!-- 관리자 권한 메뉴 -->
			<li id="adminMain"><a href="<%=request.getContextPath()%>/JSP/front/adminMain.jsp">Home</a></li>
			<li id="auctionList"><a
				href="<%=request.getContextPath()%>/JSP/front/auctionList.jsp">Auction</a></li>
			<!-- 공통 권한 메뉴 -->
			<li id="memberList"><a
				href="<%=request.getContextPath()%>/JSP/front/memberList.jsp">Member</a></li>
			<li id="qna"><a href="<%=request.getContextPath()%>/JSP/front/qna.jsp">Q&A</a></li>
		</ul>
		<div class="gnb-bottom"></div>
	</div>
	
	<!-- 상단 헤더 영역-->
	<div class="header">
		<div class="info">
			<span class="highlight01 pointer" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMypage.jsp'"><%=id%></span>님 반갑습니다
		</div>
		<div class="right">
			<a href="<%=request.getContextPath()%>/JSP/introBack/userLogOut.jsp">logout</a>
		</div>
	</div>