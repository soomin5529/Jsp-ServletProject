<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="auction.auctionDetailDAO"%>
<%@page import="java.io.File"%>
<%@page import="auction.auctionDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    int betCnt = Integer.parseInt(request.getParameter("betCnt").trim());
    int auctionCode = Integer.parseInt(request.getParameter("autioncode"));
    int betPrice = Integer.parseInt(request.getParameter("price").trim());
    String id2 = request.getParameter("id");
    
    auctionDetailDTO article = new auctionDetailDTO();
    
    article.setAuctionCode(auctionCode);
    article.setBetPrice(betPrice);
    article.setId(id2);
    auctionDetailDAO dao = auctionDetailDAO.getInstance();

	dao.insertArticle(article);
%>
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