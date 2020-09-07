<%@page import="auction.auctionDetailDAO"%>
<%@page import="auction.auctionDetailDTO"%>
<%@page import="auction.winnerDAO"%>
<%@page import="auction.winnerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   
    int auctionCode = Integer.parseInt(request.getParameter("auctioncode"));
    
   
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
    
    
  
    		
    
    %>
    
    <meta http-equiv="Refresh"
	content="0; url=<%=request.getContextPath()%>/JSP/front/userWinner.jsp?">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>