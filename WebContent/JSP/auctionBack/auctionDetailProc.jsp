<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="auction.auctionDetailDAO"%>
<%@page import="auction.auctionDAO"%>
<%@page import="java.io.File"%>
<%@page import="auction.auctionDTO"%>
<%@page import="auction.auctionDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int betCnt = Integer.parseInt(request.getParameter("betCnt"));
	int auctionCode = Integer.parseInt(request.getParameter("auctioncode"));

	String betPrice = request.getParameter("price");
	int betprice = Integer.parseInt(betPrice);
	String id2 = request.getParameter("id");

	// auction 테이블 betCnt 증가 , auctiondetail 테이블 insert

	auctionDetailDTO article = new auctionDetailDTO();
	auctionDetailDAO dao = auctionDetailDAO.getInstance();
	article.setAuctionCode(auctionCode);
	article.setBetPrice(betprice);
	article.setId(id2);

	int count = dao.getbetCnt(auctionCode, id2);

	if (count < 3) {

		dao.insertArticle(article);
	}

	auctionDTO article1 = new auctionDTO();
	auctionDAO dao1 = auctionDAO.getInstance();

	dao1.getBetCnt(auctionCode, betCnt);
%>
<meta http-equiv="Refresh"
	content="0; url=<%=request.getContextPath()%>/JSP/front/userMain.jsp?auctioncode=<%=article.getAuctionCode()%>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<script>
		var betCnt = <%=betCnt%>
		
	</script>

</body>
</html>