<%@page import="auction.auctionDetailDAO"%>
<%@page import="auction.auctionDetailDTO"%>
<%@page import="auction.winnerDAO"%>
<%@page import="auction.winnerDTO"%>
<%@page import="auction.auctionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    auctionDAO auctiontDao = new auctionDAO();

    auctionDAO db = auctionDAO.getInstance();
    
    int auctionCode = Integer.parseInt(request.getParameter("auctioncode"));
    
	int state = db.getState(auctionCode);
	
    auctionDetailDTO detailDto = new auctionDetailDTO();
    auctionDetailDAO detailDao = auctionDetailDAO.getInstance();
    
    detailDto.setAuctionCode(auctionCode);
    
    detailDao.setBetState(auctionCode);  //당첨자 betstate = 1 로 update
    		
   
    String winnerId = detailDao.getWinnerId(auctionCode); 
    System.out.println(winnerId);
    
   int winnerBetprice = detailDao.getBetPrice(auctionCode);
   System.out.println(winnerBetprice);
    
    winnerDTO winnerDto = new winnerDTO();
    winnerDAO winnerDao = winnerDAO.getInstance();
    
    winnerDto.setId(winnerId);
    winnerDto.setBetPrice(winnerBetprice);
    winnerDto.setAuctionCode(auctionCode);
    
    winnerDao.insertArticle(winnerDto); //winner 테이블에 정보 insert

	state = db.changeState(auctionCode); //auction 테이블 state를 마감으로
    %>
     <meta http-equiv="Refresh"
	content="0; url=<%=request.getContextPath()%>/JSP/front/userMain.jsp?auctioncode=<%=auctionCode%>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>