<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="auction.auctionDAO"%>
<%@page import="auction.auctionDTO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="dao" class="auction.auctionDAO" />
<%
	String category = request.getParameter("category");
String sentence = request.getParameter("sentence");
String boardid = "auctionList";

auctionDAO auctiontDao = new auctionDAO();
int pageSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
int count = 0;
int number = 0;
List articleList1 = null;
auctionDAO db = auctionDAO.getInstance();

count = auctiontDao.getArticleCount(boardid, category, sentence);
if (count > 0) {
	articleList1 = db.auctionList(startRow, endRow, boardid, category, sentence);
}
number = count - (currentPage - 1) * pageSize;
%>
<%
	ArrayList<auctionDTO> articleList = null;
Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
String today = sdf.format(date);

Date toDay = sdf.parse(today);

int auctionState = 1;

articleList = dao.getArticles();
%>
<body>
	<div class="content-wrap auction-list">
		<div class="content">
			<!-- 상단 페이지이름/버튼 영역 -->
			<div class="page-top cf">
				<div class="page-name">경매관리</div>
				<button class="btn03"
					onclick="location.href='/jspProject/JSP/front/auctionListReg.jsp'">경매등록</button>
			</div>

			<!-- 테이블 영역 -->
			<form method="post" action="auctionDetail.jsp">
				<table class="tbl">
					<tr>
						<th>경매코드</th>
						<th>제품이름</th>
						<th>최초가격</th>
						<th>종류</th>
						<th>시작일</th>
						<th>마감일</th>
						<th>참여자수</th>
						<th style="width: 80px;">상태</th>
					</tr>
					<%
						for (int i = 0; i < articleList.size(); i++) {

						auctionDTO article = (auctionDTO) articleList.get(i);
						String s = article.getOpenDate();
						int auctioncode = article.getAuctionCode();


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


					<tr
						onclick="location.href='<%=request.getContextPath()%>/JSP/front/auctionDetail.jsp?auctioncode=<%=auctioncode%>'">
						<td align="center" width="100"><%=article.getAuctionCode()%></td>
						<td align="center" width="150"><%=article.getProduct()%></td>
						<td align="center" width="50"><%=article.getMinPrice()%></td>
						<td align="center" width="100"><%=article.getCategory()%></td>
						<td align="center" width=20%><%=article.getOpenDate()%></td>
						<td align="center" width=20%><%=article.getCloseDate()%></td>
						<td align="center" width="100"><%=article.getBetCnt()%></td>
						<td><%=auctionState == 1 ? "<span class='highlight04'>대기</span>" : auctionState == 2 ? "<span class='highlight02'>진행</span>" : "<span class='highlight03'>마감</span>"%></td>
					</tr>
					<%
						}
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
					if (startPage > bottomLine) {
				%>
				<a href="auctionList.jsp?pageNum=<%=startPage - bottomLine%>">[이전]</a>
				<%
					}
				%>
				<%
					for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="auctionList.jsp?pageNum=<%=i%>"> <%
 	if (i != currentPage) {
 	out.print("[" + i + "]");
 } else {
 	out.print("<span class='on'>[" + i + "]</span>");
 }
 %>
				</a>
				<%
					}
				if (endPage < pageCount) {
				%>
				<a href="auctionList.jsp?pageNum<%=startPage + bottomLine%>">[다음]</a>
				<%
					}
				}
				%>
			</div>

			<!-- 검색 영역 -->
			<div class="page-bottom" align="center">
				<form name="searchForm" method="post">
					<select name="category" class="category">
						<option value="category">종류</option>
					</select> <input type="text" size="16" name="sentence" class="sentence" />
					<button type="submit" class="btn03-reverse">찾기</button>
					<input type="hidden" name="nowPage" value="1" />
				</form>
			</div>
		</div>
	</div>
</body>

<script>
	console.log(new Date());
</script>