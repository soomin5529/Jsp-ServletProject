<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO, user.MypageDAO"%>
<%@ page import="auction.auctionDAO" %>
<%@ page import="auction.auctionDTO" %>
<%@ page import="auction.winnerDAO" %>

<%
	//해당 상품의 옥션코드 가져오기
	int auctioncode = Integer.parseInt(request.getParameter("auctioncode"));
	//옥션코드에 맞는 상품의 정보를 가져오기
	auctionDAO info = new auctionDAO();
	auctionDTO winnerInfo = new auctionDTO();
	//list로 원하는 컬럼을 뽑아와 하나하나 값을 winnerInfo에다가 넣어주기
	ArrayList<auctionDTO> list = null;
	list = info.getWinnerOrderInfo(auctioncode);
	
	for(int i=0; i<list.size(); i++){
	 winnerInfo = (auctionDTO) list.get(i);
	}
	
	MypageDAO dao = new MypageDAO();
	UserDTO mem = dao.select(id);
	
	if(session.getAttribute("id") != null){
		 id = (String) session.getAttribute("id");
	}
	//winner테이블에서 당첨된 가격을 가져오기
	int betPrice = winnerDAO.getInstance().getWinnerPrice(auctioncode);
%>
<div class="content-wrap userOrder">
<div class="content">
<form action="<%=request.getContextPath()%>/JSP/userOrderBack/userOrderAction.jsp" method="post">
<input type="hidden" name="auctioncode" value="<%=auctioncode%>">
	<!-- 상단 페이지이름/버튼 영역 -->
	<div class="page-top cf">
		<div class="page-name">상품 주문하기</div>
	</div>
	
	<!-- 테이블 영역 -->
	<div class="tbl-tit">상품정보</div>
	<table class="tbl tbl-reg">
		<tr>
			<th class="bg-white"><div class="p-thumb-s" style="background-image:  url(<%=request.getContextPath()%>/uploadFile/<%=winnerInfo.getFilename()%>)"></div></th>
			<td>
				<div class="tit"><%=winnerInfo.getRealProduct() %></div>
				<div class="desc"><%=winnerInfo.getDetail() %></div>
				<div class="price">
					<span>최종 입찰가</span><br/>
					<span class="highlight01"><%=betPrice%>원</span>
				</div>
			</td>
		</tr>
	</table>
	
	<div class="tbl-tit">주문자 정보</div>
	<table class="tbl tbl-reg">
		<tr>
			<th>보내는 사람</th>
			<td>
				<input type="text" name="name" value="<%=mem.getName()%>" />
			</td>
		</tr>
		<tr>
			<th>핸드폰 번호</th>
			<td>
				<input type="text" name="tel" placeholder="-빼고 입력해주세요" value="<%=mem.getTel()%>">
			</td>
		<tr>
			<th>우편번호</th>
			<td>
				<input type="text" name="zipcode" style="width:100px;" id="sample4_postcode" value="<%=mem.getZipcode()%>" readonly/>
				<button type="button" onClick="sample4_execDaumPostcode()" class="btn03">우편번호찾기</button>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" id="sample4_roadAddress" value="<%=mem.getAddress()%>"/></td>
		</tr>
	</table>
	
	<div class="tbl-tit">배송 정보</div>
	<table class="tbl tbl-reg">
		<tr>
			<th>받는 사람</th>
			<td>
				<input type="text" name="name" value="<%=mem.getName()%>" />
			</td>
		</tr>
		<tr>
			<th>핸드폰 번호</th>
			<td>
				<input type="text" name="tel" placeholder="-빼고 입력해주세요" value="<%=mem.getTel()%>">
			</td>
		<tr>
			<th>우편번호</th>
			<td>
				<input type="text" name="zipcode" style="width:100px;" id="sample4_postcode" value="<%=mem.getZipcode()%>" readonly/>
				<button type="button" onClick="sample4_execDaumPostcode()" class="btn03">우편번호찾기</button>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" id="sample4_roadAddress" value="<%=mem.getAddress()%>"/></td>
		</tr>
		<tr>
			<th>배송메모</th>
			<td><textarea name="memo" rows="5"></textarea></td>
		</tr>
	</table>
	
	<div class="tbl-tit">결제 정보</div>
	<table class="tbl tbl-reg">
		<tr>
			<th>총 결제 금액</th>
			<td>
				<span class="highlight03"><%=betPrice%>원</span>
			</td>
		</tr>
		<tr>
			<th>결제 방법</th>
			<td>
				<input type="radio" name="payInfo" id="payInfo01" class="hidden" value="vbank" checked/>
				<label for="payInfo01" class="payinfo on">
					<img src="<%=request.getContextPath()%>/images/vbank.png" alt="무통장입금" />
					<span>무통장입금</span>
				</label>
				<%--<input type="radio" name="payInfo" id="payInfo02" class="hidden" value="card"/>
				 <label for="paInfo02" class="payinfo">
					<img src="<%=request.getContextPath()%>/images/card.png" alt="카드" />
					<span>카드</span>
				</label> --%>
			</td>
		</tr>
		<tr>
			<th>은행</th>
			<td>
				<select name="bank">
					<option value="kakao">카카오뱅크</option>
					<option value="kb">국민은행</option>
					<option value="woori">우리은행</option>
					<option value="shinhan">신한은행</option>
					<option value="ibk">기업은행</option>
					<option value="etc">기타</option>
				</select>
			</td>
		<tr>
	</table>
	<button type="submit" class="btn03-reverse">주문하기</button>
</form>
</div>
</div>