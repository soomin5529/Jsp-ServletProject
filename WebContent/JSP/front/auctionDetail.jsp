<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="auction.auctionDAO"%>
<%@page import="auction.auctionDTO"%>
<%@page import="auction.auctionDetailDAO"%>
<%@page import="auction.auctionDetailDTO"%>
<%@page import="auction.winnerDAO"%>
<%@page import="auction.winnerDTO"%>
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
    ArrayList<winnerDTO> articleList2 = null;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
   
    int auctionState = 1;

articleList = dao.getAllArticles(auctioncode);
%>
<%
	auctionDAO auctiontDao = new auctionDAO();

    auctionDAO db = auctionDAO.getInstance();
    
    winnerDAO winnerDao = new winnerDAO();
    winnerDAO db2 = winnerDAO.getInstance();
    articleList2 = winnerDao.getAllArticles(auctioncode);
    
    
%>
<%
	for (int i = 0; i < articleList.size(); i++) {

	auctionDTO article = (auctionDTO) articleList.get(i);
	String s = article.getOpenDate();

	Date retime1 = sdf.parse(article.getOpenDate());
	Date retime2 = sdf.parse(article.getCloseDate());
	Date to_day = new Date();
	
	
	
	
	int beforeCompare = to_day.compareTo(retime1);
	int afterCompare = to_day.compareTo(retime2);
	
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
						<th>실제 상품명</th>
						<td><%=article.getRealProduct()%></td>
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
				<%
					} 
                       
                        
                        for (int i = 0; i < articleList2.size(); i++) {

	                     winnerDTO article2 = (winnerDTO) articleList2.get(i);
                       
				%>
				
					<tr>
						<th>당첨자 코드</th>
						<td><%=article2.getWinnerCode()%></td>
					</tr>
					<tr>
						<th>당첨자 ID</th>
						<td><%=article2.getId()%></td>
					</tr>
					<tr>
						<th>당첨자 입찰액</th>
						<td><%=article2.getBetPrice()%></td>
					</tr>
					
				</table>

				<%  }  %>
				
					
			</form>
		</div>
	</div>
</body>
<!-- <meta http-equiv="Refresh" content="0; url=auctionList.jsp"> -->