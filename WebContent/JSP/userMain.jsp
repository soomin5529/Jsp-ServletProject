<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/201901_reset.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
</head>
<body>
	<div class="main userMain">
		<!-- 왼쪽 메뉴 영역 -->
		<div class="gnb">
			<div class="logo">
				<b>BLUE</b><br/>OCEAN
			</div>
			<ul class="gnb-list">
				<li class="on"><a href="userMain.jsp">Home</a></li>
				<li><a href="userMypage.jsp">My page</a></li>
				<li><a href="userQna">Q&A</a></li>
			</ul>
			<div class="gnb-bottom"></div>
		</div>

		<!-- 오른쪽 콘텐츠 영역 -->
		<div class="content-wrap">
			<div class="header">
				<div class="info">
					<span class="highlight">홍길동</span>님 반갑습니다
				</div>
				<div class="right">
					<a href="introPage.jsp">logout</a>
				</div>
			</div>
			<div class="content cf">
				<div class="p-thumb"
					style="background-image: url(../images/thumbnail01.jpeg)"></div>
				<div class="p-text">
					<div class="timer">01일 12시간 30분</div>
					<div class="tit">콩나물 두쪽</div>
					<div class="desc">이건 사과가 만든 콩나물 두쪽임</div>
					<div class="input-wrap">
						<input type="text" name="price" placeholder="경매가를 입력하세요" />
						<button class="btn03-reverse">참여하기</button>
						<div class="mem">
							<span>현재 경매 참여자 수</span> <span class="highlight">0</span>
						</div>
					</div>
				</div>
				
				<!-- 채팅영역 -->
				<div class="chat-wrap">
					채팅 영역
				</div>
			</div>
		</div>
</body>
</html>