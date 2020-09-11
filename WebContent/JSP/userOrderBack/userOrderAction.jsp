<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="auction.winnerDAO" %>
    
    
    
<%
	//주문하기를 누르면 각각 value값들을 변수에다 집어 넣고 그걸 winner테이블 업테이트를 위해 파라메타로 넣어준다

	request.setCharacterEncoding("UTF-8"); 
	int auctioncode = Integer.parseInt(request.getParameter("auctioncode"));
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String memo = request.getParameter("memo");
	String bank = request.getParameter("bank");
	
	int result = winnerDAO.getInstance().updateWinner(name, tel, zipcode, address, memo, bank, auctioncode);
	
	String location = null;
	String msg = null;
	
	if(result == 1){
		msg ="주문이 완료되었습니다";
		location = "/jspProject/JSP/front/userMainList.jsp";
	}
%>
	
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>