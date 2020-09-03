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
%>    
    
<script src="<%=request.getContextPath()%>/js/jquery.masonryGrid.js"></script>
<div class="content-wrap userMainList">
	<div class="content cf">
	    <div class="my-masonry-grid">
	    <%
			for (int i = 0; i < articleList.size(); i++) {

			auctionDTO article = (auctionDTO) articleList.get(i);
			betCnt = article.getBetCnt();
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
	    <%}%>    
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
