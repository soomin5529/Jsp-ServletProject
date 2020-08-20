<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<div class="content-wrap auction-list">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
		<div class="page-name">경매관리</div>
		<button class="btn03" onclick="location.href='/jspProject/JSP/front/auctionListReg.jsp'">경매등록</button>
	</div>
	
	<!-- 테이블 영역 -->
	<form action="">
		<table class="tbl">
			<tr>
				<th>경매코드</th>
				<th>제품이름</th>
				<th>최초가격</th>
				<th>종류</th>
				<th>올린날짜</th>
				<th>시작일</th>
				<th>마감일</th>
				<th>참여자수</th>
				<th>상태</th>
			</tr>
			<tr>
				<td>a200820</td>
				<td>콩나물</td>
				<td>3000</td>
				<td>전자기기</td>
				<td>2020-08-20</td>
				<td>2020-02-20</td>
				<td>2020-02-30</td>
				<td>20</td>
				<td><span class="highlight02">진행</span></td>
			</tr>
			<tr>
				<td>a200820</td>
				<td>콩나물</td>
				<td>3000</td>
				<td>전자기기</td>
				<td>2020-08-20</td>
				<td>2020-02-20</td>
				<td>2020-02-30</td>
				<td>20</td>
				<td><span class="highlight03">마감</span></td>
			</tr>
			<tr>
				<td>a200820</td>
				<td>콩나물</td>
				<td>3000</td>
				<td>전자기기</td>
				<td>2020-08-20</td>
				<td>2020-02-20</td>
				<td>2020-02-30</td>
				<td>20</td>
				<td><span class="highlight04">대기</span></td>
			</tr>
		</table>
	</form>
	
	<!-- 페이지번호 영역 -->
	<div class="page-num" align="center">
		<a href="#">[이전]</a>
		<a href="#">1</a>
		<a href="#" class="on">2</a>
		<a href="#">[다음]</a>
	</div>
	
	<!-- 검색 영역 -->
	<div class="page-bottom" align="center">
		<form name="searchForm" method="post">
			<select name="category" class="category">
				<option value="writer">이름</option>
			</select>
			<input type="text" size="16" name="sentence" class="sentence" />
			<button type="submit" class="btn03-reverse">찾기</button>
			<input type="hidden" name="nowPage"	value="1" />
		</form>
	</div>
</div>
</div>
</body>