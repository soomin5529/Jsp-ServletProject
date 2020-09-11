<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="auction.auctionDAO"%>
<%@page import="auction.auctionDTO"%>
<%@page import="auction.auctionDetailDAO"%>
<%@page import="auction.auctionDetailDTO"%>
<%@page import="auction.winnerDAO"%>
<%@page import="auction.winnerDTO"%>
<jsp:useBean id="dao" class="auction.auctionDAO" />

<style type="text/css">
font {
	font-size: 3em;
	color: lightblue;
}
</style>
<%

if(id == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요');");
	script.println("location.href = '/jspProject/JSP/introPage.jsp'");
	script.println("</script>");
	script.close();
	return;	
}

int auctioncode = Integer.parseInt(request.getParameter("auctioncode"));

ArrayList<auctionDTO> articleList = null;

articleList = dao.getAllArticles(auctioncode);

auctionDAO auctiontDao = new auctionDAO();

auctionDAO db = auctionDAO.getInstance();
%>

<%
	String name1 = (String) session.getAttribute("id");
    Date date = new Date();
    SimpleDateFormat time2 = new SimpleDateFormat("hh:mm:ss a");
    String today = time2.format(date);
    String timeout = null;
    int betCnt = 0; //auction table 의 betCnt
    String realProduct = null;
%>
<%
	auctionDetailDTO detailDTO = new auctionDetailDTO();
    auctionDetailDAO detailDAO = auctionDetailDAO.getInstance();
    int betcount = detailDAO.getbetCnt(auctioncode, name1);
     //회원 개개인의 betcount 값
 	int minPrice = db.getMinPrice(auctioncode); //최소입찰가보다 작으면 입력 X
 	int state = db.getState(auctioncode);
 	
%>
<title>userMain</title>
</head>
<!-- 오른쪽 콘텐츠 영역 -->

<div class="content-wrap userMain">
	<div class="content cf">

		<%
			for (int i = 0; i < articleList.size(); i++) {

			auctionDTO article = (auctionDTO) articleList.get(i);
			realProduct = article.getRealProduct();
			String closeDate = article.getCloseDate();
			betCnt = article.getBetCnt();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date retime = sdf.parse(closeDate + "closeDate");
			timeout = sdf.format(retime);
			
		%>
		<div class="p-thumb"
			style="background-image: url(<%=request.getContextPath()%>/uploadFile/<%=article.getFilename()%>)"></div>
		<div class="p-text">
			<h1 class="timer" id="start"></h1>
			<div class="tit"><%=article.getProduct()%></div>
			<div class="desc"><%=article.getDetail()%></div>
			<div class="input-wrap">
				<div class="min-price">
					<span>최저 입찰가</span> <span class="highlight01"><%=article.getMinPrice()%></span>
				</div>
				<form id="auctionPrice"  method="post" action="<%=request.getContextPath()%>/JSP/auctionBack/auctionDetailProc.jsp">
					<input type="hidden" name="auctioncode" value="<%=auctioncode%>" />
					<input type="hidden" name="betCnt" id="betCnt" value=<%=betCnt%> />
		
					<% 	
						if(state == 1){
							%>
							<button type="button" class="btn03-reverse" onclick="openWinner(); " >당첨자 확인하기</button>
								<div class="mem">
									<span>현재 경매 참여자 수</span> : <span class="highlight01"><%=betCnt%>
								</span>
							</div>
						<% }
						else{%>
						<input type="hidden" name="id" value="<%=name1%>" /> 
						<input type="text" name="price" id="price" placeholder="경매가를 입력하세요" />
							<button type="button" class="btn03-reverse" id="plus" onclick="priceSend(); " >참여하기</button>
								<div class="mem">
									<span>현재 경매 참여자 수</span> : <span class="highlight01"><%=betCnt%>
								</span>
							</div>
						<% }
						%>

				</form>
				
				<% 
			   		String winnerId = detailDAO.getWinnerId(auctioncode); 
			   %>
					<form method="post"  id="winnerEmail" action="<%=request.getContextPath()%>/JSP/userOrderBack/winnerEmailSendAction.jsp">
					<input type="hidden" name="auctioncode" value="<%=auctioncode%>" />
					<input type="hidden" name="id" value="<%=name1%>" /> 
					<div class="pop-wrap winner" id="popup">
							<div class="pop-bg" onclick="closePop()"></div>
								<span class="closeb" onclick="closePop()">×</span>
							<div class="pop-box" style="width:500px; height:570px;">
							<div class="tit"></div>
							<div class="con">
								<div class="winner-img"></div>
								<div class="input-box" align="center">
									<div class="highlight01">당첨상품</div>
									<div><%=realProduct%></div>
									<br />
									<div class="highlight01">당첨자</div>
									<div><%=winnerId%></div>
									<br />
									<button type="submit" class="btn03-reverse">본인인증</button>
									<br />
								</div>
							</div>
						</div>
					</div>
					</form>
			</div>
		</div>
		<%
			}
		%>

		
		<!-- 채팅영역 -->
		<div class="chat-wrap">

			<fieldset>
				<div class="message-ball" id="messageWindow"></div>
				<div id="curr_time" style="display:none"></div>
				<br>
				<input id="inputMessage" type="text" onkeypress="enterKey(event)" style="width:calc(100% - 113px); margin-right: 10px;"/>
				<button type="submit" value="send" onclick="send()" class="btn03" style="width:100px;">보내기</button>
			</fieldset>
		</div>
<script>
		if(<%=betcount%> >  3) {
			  alert("더이상 참여하실 수 없습니다.");
		}
	    function priceSend() {
	    	
			var price= document.getElementById("price").value;
		
			if(price < <%=minPrice%>){
				alert("최소입찰가를 맞추어 배팅하시길 바랍니다")
				price.value.focus();
			}
			else{
				alert(price+ "원 입찰 완료되었습니다");
				document.getElementById("auctionPrice").submit();	
			}
		};

		   function openWinner() {
			   document.getElementById("popup").style.display = "block";
			}
			function closeWinner() {
			   document.getElementById("popup").style.display = "none";
			}
		   
			
			var div = document.getElementById("curr_time"); 
			function time() {
			
			  var d = new Date();
			  var s = d.getSeconds();
			  var m = d.getMinutes();
			  var h = d.getHours();
			  var tt = h + "시 " + m + "분 " + s +"초";
			  if(div){
				  div.value = tt;
			  }
			 
			}

			setInterval(time, 1000);
	
   var textarea = document.getElementById("messageWindow");
   
   var webSocket = new WebSocket('ws://192.168.35.149:8089<%=request.getContextPath()%>/weball');
   
   var inputMessage = document.getElementById("inputMessage");

   webSocket.onopen = function(event) {
      onOpen(event);   
   };
   
   webSocket.onmessage = function(event) {
      onMessage(event);   
   };
  
function onMessage(event) {
      textarea.innerHTML += "<div class='bubble-wrap you cf'><div id='you' class='bubble'"
      + "style='width:" + (event.data.length*12)+"px;'>" + event.data + "</div>" + "<div class='time fl' id='curr_time'>"+ div.value +"</div> "  + "</div><br>";
      textarea.scrollTop = textarea.scrollHeight;
   };
   
   function onOpen(event) {
      textarea.innerHTML += "연결 성공<br>";
      webSocket.send("<%=name1%>:입장하였습니다.");
   };
   
   function send() {
	   
      textarea.innerHTML += "<div class='bubble-wrap me cf'><div id='me' class='bubble'"
      + "style='width:" + (inputMessage.value.length*12)+"px;'>나: "
      + inputMessage.value + "</div>" +"<div class='time fr' id='curr_time'>"+ div.value +"</div> " + "</div><br>";
      textarea.scrollTop = textarea.scrollHeight;
      webSocket.send("<%=name1%>:" + inputMessage.value);
				inputMessage.value = "";
			};

			function enterKey(e) {
				if (e.keyCode == 13) {
					send();
				}
				;
			};
		</script>
		<script>
		
	    
		const countDownTimer = function(id, date) {
			var cnt=0; 
			var _vDate = new Date(date); // 전달 받은 일자 		
			var _second = 1000;
			var _minute = _second * 60;
			var _hour = _minute * 60;
			var _day = _hour * 24;
			var timer;

			function showRemaining() {
				var now = new Date();
				var distDt = _vDate - now;
			 
			if(distDt<11000 && distDt>0){
				document.getElementById(id).style.color ="red";
				
		}
		   if (distDt < 0) {
					clearInterval(timer);
					document.getElementById(id).textContent = '해당 이벤트가 종료 되었습니다!';
					
					<%	if(state != 1){ %>
						location.href="/jspProject/JSP/userOrderBack/endEvent.jsp?auctioncode=<%=auctioncode%>";
					<%} %>
					return;
				}
				var days = Math.floor(distDt / _day);
				var hours = Math.floor((distDt % _day) / _hour);
				var minutes = Math.floor((distDt % _hour) / _minute);
				var seconds = Math.floor((distDt % _minute) / _second);
				document.getElementById(id).textContent = days + '일 ';
				document.getElementById(id).textContent += hours + '시간 ';
				document.getElementById(id).textContent += minutes + '분 ';
				document.getElementById(id).textContent += seconds + '초';
			}
			timer = setInterval(showRemaining, 1000);
		}
		var dateObj = new Date();	
		dateObj.setDate(dateObj.getDate() + 1);
	 	countDownTimer('start','<%=timeout%>');
		</script>

	</div>
</div>
