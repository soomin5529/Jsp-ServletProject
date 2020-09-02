<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="chart.chartDAO"/>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
	String regDate = request.getParameter("regDate");
	String[] countnew = dao.countNew();	
	
	String deleteDate = request.getParameter("deleteDate");
	String[] countdelete = dao.countDelete();
%>
<%  String betcode = request.getParameter("betCode");
	int betCode = Integer.parseInt(betcode);
	
	String betprice = request.getParameter("betPrice");
	int betPrice = Integer.parseInt(betprice);
	
	int[] countproduct = dao.countProduct();
%>
<%
	String betDate = request.getParameter("betDate");
	String[] countmonthplayer = dao.countMonthPlayer();
%>
<%
	String category = request.getParameter("category");
	String[] countcategory = dao.countCategory();
%>
<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 차트</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-alpha.2/chart.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-alpha.2/chart.js"></script>
<script src="<%=request.getContextPath()%>/js/chart/Chart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/chart/utils.js"></script>
</head>
<body>
	<table style="margin-left: 15%;">
		<tr>
			<td>
				<table class="container" style="height: 100px; width: 500px;">
					<center>
						<h4>월별 가입 탈퇴</h4>
					</center>
					<canvas id="Chart1"></canvas>

					<!-- 차트 -->
					<script>
						var ctx = document.getElementById('Chart1').getContext(
								'2d');
						var chart = new Chart(ctx, {
							// 챠트 종류를 선택 
							type : 'line',
							// 챠트를 그릴 데이타
							data : {
								labels : [ 'January', 'February', 'March',
										'April', 'May', 'June', 'July',
										'August', 'September', 'October', 'November',
										'December'],
								datasets : [ {
									label : '가입',
									backgroundColor : 'transparent',
									borderColor : 'rgba(54, 162, 235, 0.5)',
									data : [<%=countnew[0]%>,
											<%=countnew[1]%>,
											<%=countnew[2]%>,
											<%=countnew[3]%>,
											<%=countnew[4]%>,
											<%=countnew[5]%>,
											<%=countnew[6]%>,
											<%=countnew[7]%>,
											<%=countnew[8]%>,
											<%=countnew[9]%>,
											<%=countnew[10]%>,
											<%=countnew[11]%>
											]
								}, {
									label : '탈퇴',
									backgroundColor : 'transparent',
									borderColor : 'rgba(255, 99, 132, 0.5)',
									data : [<%=countnew[0]%>,
											<%=countdelete[1]%>,
											<%=countdelete[2]%>,
											<%=countdelete[3]%>,
											<%=countdelete[4]%>,
											<%=countdelete[5]%>,
											<%=countdelete[6]%>,
											<%=countdelete[7]%>,
											<%=countdelete[8]%>,
											<%=countdelete[9]%>,
											<%=countdelete[10]%>,
											<%=countdelete[11]%> 
											],
								} ]
							},
							// 옵션 
							options : {}
						});
					</script>
				</table>
			</td>
			<td>
				<table class="container" style="height: 100px; width: 500px;">
					<center>
						<h4>제품별 입찰가</h4>
					</center>
					<canvas id="Chart2"></canvas>
					<!-- 차트 -->
					<script>
						var ctx = document.getElementById('Chart2');
						var myChart = new Chart(ctx, {
							type : 'bar',
							data : {
								labels : [ 'A', 'B', 'C', 'D','E', 'F', 'F', 'G', 'H', 'I' ],
								datasets : [ {
									label : 'product',
									data : [ 
										<%=countproduct[0]%>,
										<%=countproduct[1]%>,
										<%=countproduct[2]%>,
										<%=countproduct[3]%>,
										<%=countproduct[4]%>,
										<%=countproduct[5]%>,
										<%=countproduct[6]%>,
										<%=countproduct[7]%>,
										<%=countproduct[8]%>,
										<%=countproduct[9]%>,
									],
									backgroundColor : [
										'rgba(151, 193, 51, 0.2)',
										'rgba(51, 193, 111, 0.2)',
										'rgba(51, 193, 148, 0.2)',
										'rgba(51, 193, 182, 0.2)',
										'rgba(51, 170, 193, 0.2)',
										'rgba(51, 137, 193,, 0.2)',
										'rgba(51, 103, 193, 0.2)',
										'rgba(51, 68, 193, 0.2)',
										'rgba(92, 51, 193, 0.2)',
										'rgba(134, 51, 193, 0.2)' ],
									borderColor : [
										'rgba(151, 193, 51, 1)',
										'rgba(51, 193, 111, 1)',
										'rgba(51, 193, 148, 1)',
										'rgba(51, 193, 182, 1)',
										'rgba(51, 170, 193, 1)',
										'rgba(51, 137, 193,, 1)',
										'rgba(51, 103, 193, 1)',
										'rgba(51, 68, 193, 1)',
										'rgba(92, 51, 193, 1)',
										'rgba(134, 51, 193, 1)' ],
									borderWidth : 1
								} ]
							},
							options : {
								scales : {
									yAxes : [ {
										ticks : {
											beginAtZero : true
										}
									} ]
								}
							}
						});
					</script>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table class="container" style="height: 100px; width: 500px;">
					<center>
						<h4>월별 참여자</h4>
					</center>
					<canvas id="Chart3"></canvas>
					<!-- 차트 -->
					<script>
						var ctx = document.getElementById('Chart3');
						var myChart = new Chart(ctx, {
							type : 'bar',
							data : {
								labels : [  'January', 'February', 'March',
									'April', 'May', 'June', 'July',
									'August', 'September', 'October', 'November',
									'December' ],
								datasets : [ {
									label : 'player',
									data : [ 
										<%=countmonthplayer[0]%>,
										<%=countmonthplayer[1]%>,
										<%=countmonthplayer[2]%>,
										<%=countmonthplayer[3]%>,
										<%=countmonthplayer[4]%>,
										<%=countmonthplayer[5]%>,
										<%=countmonthplayer[6]%>,
										<%=countmonthplayer[7]%>,
										<%=countmonthplayer[8]%>,
										<%=countmonthplayer[9]%>,
										<%=countmonthplayer[10]%>,
										<%=countmonthplayer[11]%>
										],
									backgroundColor : [
										'rgba(255, 99, 132, 0.2)',
										'rgba(255, 99, 132, 0.2)',
										'rgba(255, 99, 132, 0.2)',
										'rgba(255, 99, 132, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)' ],
									borderColor : [ 
										'rgba(255, 99, 132, 1)',
										'rgba(255, 99, 132, 1)',
										'rgba(255, 99, 132, 1)',
										'rgba(255, 99, 132, 1)',
										'rgba(255, 159, 64, 1)',
										'rgba(255, 159, 64, 1)',
										'rgba(255, 159, 64, 1)',
										'rgba(255, 159, 64, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)' ],
									borderWidth : 1
								} ]
							},
							options : {
								scales : {
									yAxes : [ {
										ticks : {
											beginAtZero : true
										}
									} ]
								}
							}
						});
					</script>
				</table>
			</td>
			<td>
				<table style="height: 100px; width: 500px;">
				<center><h4>카테고리별 제품개수</h4></center>
					<div id="canvas-holder">
						<canvas id="chart-area"></canvas>
					</div>
					<script>
						var randomScalingFactor = function() {
							return Math.round(Math.random() * 100);
						};

						var config = {
							type : 'pie',
							data : {
								datasets : [ {
									data : [ 
										<%=countcategory[0]%>,
										<%=countcategory[1]%>,
										<%=countcategory[2]%>,
										<%=countcategory[3]%>,
										<%=countcategory[4]%>, ],
									backgroundColor : [
										'rgba(255, 99, 132, 0.3)',
										'rgba(255, 159, 64, 0.3)',
										'rgba(255, 206, 86, 0.3)',
										'rgba(75, 192, 192, 0.3)',
										'rgba(54, 162, 235, 0.3)' ],
						
								
								} ],
								labels : [ '전자제품', '휴대용품', '자동차', '화장품',
										'기타' ]
							},
							options : {
								responsive : true
							}
						};

						window.onload = function() {
							var ctx = document.getElementById('chart-area')
									.getContext('2d');
							window.myPie = new Chart(ctx, config);
						};
					</script>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>

