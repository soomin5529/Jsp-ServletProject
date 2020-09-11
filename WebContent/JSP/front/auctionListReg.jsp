<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="content-wrap memberList">
		<div class="content">
			<!-- 상단 페이지이름/버튼 영역 -->
			<div class="page-top cf">
				<div class="page-name">경매등록</div>

				<button class="btn04 margin-r"
					onclick="location.href='/jspProject/JSP/front/auctionList.jsp'">목록으로</button>
				<button class="btn03 margin-r" type="reset">다시작성</button>

			</div>

			<!-- 테이블 영역 -->
			<form method="post"
				action="<%=request.getContextPath()%>/JSP/auctionBack/auctionUploadPro.jsp"
				enctype="multipart/form-data">
				<table class="tbl tbl-reg">
					<tr>
						<th>상품명</th>
						<td><input type="text" name="product"
							placeholder="상품명을 입력하세요" /></td>
					</tr>
					<tr>
						<th>실제상품명</th>
						<td><input type="text" name="realProduct"
							placeholder="실제 상품명을 입력하세요" /></td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td><textarea cols="30" name="detail" rows="10"></textarea></td>
					</tr>
					<tr>
						<th>사진첨부</th>
						<td><input type="file" name="uploadfile" /></td>
					<tr>
						<th>최소금액</th>
						<td><input type="text" name="minPrice"
							placeholder="최소 입찰 금액을 입력하세요" /></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select name="category">
								<option value="전자제품">전자제품</option>
								<option value="화장품">화장품</option>
								<option value="휴대용품">휴대용품</option>
								<option value="자동차">자동차</option>
								<option value="기타">기타</option>
						</select></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><input type="datetime-local" name="openDate"
							placeholder="시작일을 입력해주세요" /></td>
					</tr>
					<tr>
						<th>마감일</th>
						<td><input type="datetime-local" name="closeDate"
							placeholder="마감일을 입력해주세요" /></td>
					</tr>

				</table>
				<br/>
				
					<div class="page-top cf">
				<button class="btn03 margin-r" type="submit">등록하기</button></div>

			</form>
		</div>
	</div>
</body>