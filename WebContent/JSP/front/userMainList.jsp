<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="auction.auctionDAO"%>
<%@page import="auction.auctionDTO"%>
<jsp:useBean id="dao" class="auction.auctionDAO" />
<%
   ArrayList<auctionDTO> articleList = null;
   articleList = dao.getAllArticles();
   auctionDAO auctiontDao = new auctionDAO();
   auctionDAO db = auctionDAO.getInstance();
   int betCnt = 0;
   int auctionState = 1;
   Date date = new Date();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
   
%>
<script src="<%=request.getContextPath()%>/js/jquery.masonryGrid.js"></script>
<div class="content-wrap userMainList">
	<div class="content cf">
	    <div class="my-masonry-grid">
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
			betCnt = article.getBetCnt();
			if(auctionState == 2){ /* 경매 진행중일 경우 썸네일 이미지만 표시 */
		%>
	        <div class="my-masonry-grid-item" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMain.jsp?auctioncode=<%=article.getAuctionCode()%>'">
	        	<div class="p-thumb">
	        		<div style="background-image: url(<%=request.getContextPath()%>/uploadFile/<%=article.getFilename()%>)"></div>
	        	</div>
	        	<div class="p-text">
	        		<div class="tit"><%=article.getProduct()%></div>
					<div class="desc"><%=article.getDetail()%></div>
	        	</div>
	        	<div class="mem">
					<span>현재 경매 참여자 수</span> <span class="highlight01" id="betCnt">
						<%=article.getBetCnt()%>
					</span>
				</div>
	        </div>
	    <%}if(auctionState == 3){%> <!-- 경매 마감일 경우 썸네일에 '경매마감' 표시 -->
	    	<div class="my-masonry-grid-item" onclick="location.href='<%=request.getContextPath()%>/JSP/front/userMain.jsp?auctioncode=<%=article.getAuctionCode()%>'">
	        	<div class="p-thumb end">
	        		<div style="background-image: url(<%=request.getContextPath()%>/uploadFile/<%=article.getFilename()%>)"></div>
	        	</div>
	        	<div class="p-text">
	        		<div class="tit"><%=article.getProduct()%></div>
					<div class="desc"><%=article.getDetail()%></div>
	        	</div>
	        	<div class="mem">
					<span>현재 경매 참여자 수</span> <span class="highlight01" id="betCnt">
						<%=article.getBetCnt()%>
					</span>
				</div>
	        </div>	
	    <%}}%>
	    </div>
	</div>
</div>
<script>
    jQuery(document).ready(function($) {
        $('.my-masonry-grid').masonryGrid({
            'columns': 5,
        });
    });
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
