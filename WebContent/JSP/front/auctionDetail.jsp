<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="auction.auctionDAO"%>
<%@page import="auction.auctionDTO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="dao" class="auction.auctionDAO" />
<style>
img {
    width: 40%;
    max-width: 100%;
    height: auto;
}

</style>
<%
	String auctioncode1 = request.getParameter("auctioncode");
    int auctioncode = Integer.parseInt(auctioncode1);
    ArrayList<auctionDTO> articleList = null;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    String today = sdf.format(date);

    Date toDay = sdf.parse(today);

int auctionState = 1;

articleList = dao.getAllArticles(auctioncode);
%>
<%
	auctionDAO auctiontDao = new auctionDAO();

auctionDAO db = auctionDAO.getInstance();
%>
<%
	for (int i = 0; i < articleList.size(); i++) {

	auctionDTO article = (auctionDTO) articleList.get(i);
	String s = article.getOpenDate();

	Date retime1 = sdf.parse(article.getOpenDate());
	Date retime2 = sdf.parse(article.getCloseDate());
	int beforeCompare = toDay.compareTo(retime1);
	int afterCompare = toDay.compareTo(retime2);
	if (beforeCompare < 0) {
		auctionState = 1;
	}
	if (beforeCompare > 0 && afterCompare < 0) {
		auctionState = 2;
	}
	if (afterCompare > 0) {
		auctionState = 3;
	}
%>

<body>
	<div class="content-wrap memberList">
		<div class="content">
			<!-- 상단 페이지이름/버튼 영역 -->
			<div class="page-top cf">
				<div class="page-name">경매 상세정보</div>

				<button class="btn04 margin-r"
					onclick="location.href='/jspProject/JSP/front/auctionList.jsp'">목록으로</button>
			</div>

			<!-- 테이블 영역 -->
			<form method="post" action="userMain.jsp">
				<table class="tbl tbl-reg">
					<tr>
						<th>상품코드</th>
						<td>
							<input type="hidden" name="auctioncode" value="<%=auctioncode%>"/>
							<%=article.getAuctionCode()%>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><%=article.getProduct()%></td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td><%=article.getDetail()%></td>
					</tr>
					<tr>
						<th>상세사진</th>
						<td><%=article.getFilename()%> <img
							src="<%=request.getContextPath()%>/uploadFile/<%=article.getFilename()%>"
							/></td>
					<tr>
						<th>최소금액</th>
						<td><%=article.getMinPrice()%></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><%=article.getCategory()%></td>
					</tr>
					<tr>
						<th>시작일</th>
						<td><%=article.getOpenDate()%></td>
					</tr>
					<tr>
						<th>마감일</th>
						<td><%=article.getCloseDate()%></td>
					</tr>
					<tr>
						<th>상태</th>
						<td><%=auctionState == 1 ? "<span class='highlight04'>대기</span>" : auctionState == 2 ? "<span class='highlight02'>진행</span>" : "<span class='highlight03'>마감</span>"%></td>
					</tr>
					<tr>
						<th>참여자 수</th>
						<td><%=article.getBetCnt()%></td>
					</tr>

				</table>

				<%
					} 
                       if(auctionState ==2) {
				%>
				<br>
				<button class="btn03" type="submit"	onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMain.jsp?auctioncode=<%=auctioncode%>'">경매 등록하기</button>
					<% } %>
			</form>
		</div>
	</div>
</body>
<!-- <meta http-equiv="Refresh" content="0; url=auctionList.jsp"> -->