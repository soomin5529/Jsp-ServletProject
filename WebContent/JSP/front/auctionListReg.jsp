<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div class="content-wrap memberList">
<div class="content">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
		<div class="page-name">경매등록</div>
		<button class="btn03">등록하기</button>
		<button class="btn04 margin-r" onclick="location.href='/jspProject/JSP/front/auctionList.jsp'">목록으로</button> 
	</div>
	
	<!-- 테이블 영역 -->
	<form action="">
		<table class="tbl tbl-reg">
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" placeholder="상품명을 입력하세요"/>
				</td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td>
					<textarea cols="30" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진첨부</th>
				<td>
					<input type="file"  />
				</td>
			<tr>
				<th>최소금액</th>
				<td>
					<input type="text" placeholder="최소 입찰 금액을 입력하세요"/>
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category" id="">
						<option value="전자기기">전자기기</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>오픈일</th>
				<td>
					<input type="date" placeholder="몰랑"/>
				</td>
			</tr>
			<tr>
				<th>마감일</th>
				<td>
					<input type="date" placeholder="몰랑"/>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>