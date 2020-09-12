<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/201901_reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<script src = "http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jcommon.js" charset="utf-8"></script>
<title>BLUEOCEAN에 온것을 환영합니다</title>
</head>
<body class="intro">
	<div class="jb-box">
		<video muted autoplay loop id="video">
			<source src="<%=request.getContextPath()%>/images/jetsurf.mp4" type="video/mp4">
		</video>
		
		<div class="jb-text">
			<span class="fadein">B L U E O C E A N</span>
		</div>

		<div class="btn-box">
			<button onClick="openLogin();" class="btn01">로그인</button>
			&nbsp;&nbsp;
			<button onClick="openRegister();" class="btn01">회원가입</button>
		</div>
	</div>

	<div id="logbar">
		<span class="closeb" onclick="closeLogin()">×</span>
		<div>
			<form class="form" name="formm" method="post" action="<%=request.getContextPath()%>/JSP/introBack/userLoginAction.jsp" >
				<fieldset> 
					<h2>로그인</h2>
					<label for="id">아이디</label><br> <input TYPE="text" name="id" placeholder="아이디를 입력해주세요"><br> 
					<label for="pwd">패스워드</label><br>
					<input TYPE="password" name="pwd" placeholder="비밀번호를  입력해주세요">
					<a href="URL" onclick="window.open('<%=request.getContextPath()%>/JSP/introBack/userFindId.jsp', '_blank', 'top=120px,left=500px,width=500px,height=500px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
					<b>아이디 찾기</b>
					</a>
					&nbsp;
					<a href="URL" onclick="window.open('<%=request.getContextPath()%>/JSP/introBack/userFindPwd.jsp', '_blank', 'top=120px,left=500px,width=500px,height=500px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
					<b>비밀번호 찾기</b>
					</a>
					<br><br> <input TYPE="button" value="로그인" onClick="loginCheck();"> <br>
				</fieldset>
			</form>
		</div>
	</div>
	
	<div id="regbar">
		<span class="registerClose" onclick="closeRegister()">×</span>
		<div>
			<form class="regform" name="reg_form" method="post" action="<%=request.getContextPath()%>/JSP/introBack/userRegisterAction.jsp" onsubmit="return inputCheck()" >
			<input type= "hidden" name="idCheckOk" value="no">
				<fieldset>
					<h2 align="center">회원가입</h2>
					<div style="text-align: right;"><span style="color: red; font-weight: bold;">v </span><span>표시항목 필수 입력 항목입니다</span><br>
               <table style="text-align: left; width: 100%; height: 320px; font-weight: bold;"border="1" cellpadding="2" cellspacing="2">
                  <tbody><br><br>
                  <tr>
                        <td><small>v</small>
                        <span>아이디</span></td>
                        <td><input name="id" autofocus placeholder = "아이디를 입력해주세요" title = "아이디 입력창입니다."  style="width:calc(100% - 96px)">
                        <input type="button" value="중복확인"  style="vertical-align: top; height:35px ; width:90px ;  font-size : 13px" onClick="idCheck(this.form.id.value)"><br>   
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>비밀번호</span> </td>
                        <td><input name="pwd" type="password" placeholder = "비밀번호를 입력해주세요" title = "비밀번호 입력창입니다." ><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>비밀번호확인</span> </td>
                        <td><input name="pwd_co" type="password" placeholder = "비밀번호를 확인해주세요" title = "비밀번호 확인 입력창입니다." ><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>이름</span> </td>
                        <td><input name="name" autofocus placeholder = "이름을 입력해주세요" title = "이름 입력창입니다."><br>
                        </td>
                     </tr>
                     <tr>
                        <td><small>v</small>
                        <span>이메일</span> </td>
                        <td>
                            <input name="email" type = "email" placeholder = "@ 포함 이메일을 입력하세요" title = "이메일을 입력하세요" >
                           </td>
                     </tr>
                     <tr>
                        <td>&nbsp;&nbsp;핸드폰번호</td>
                        <td> 
                            <input type = "radio" name = "agency" value="skt" id="agency01" > <label for="agency01">SKT </label>
                            <input type = "radio" name = "agency" value="kt" id="agency02" > <label for="agency02">KT </label>
                            <input type = "radio" name = "agency" value="lgu+" id="agency03"> <label for="agency03">LGU+</label><br> 
                            <input type="text" name="tel" placeholder="-빼고 입력해주세요">
                           </td>
                     </tr>
                     <tr>
                        <td>&nbsp;생년월일</td>
                        <td><input name="birthdate"  placeholder = "ex)19950209" title = "ex)19950209">
                        </td>
                     </tr>
                     <tr>
                        <td>&nbsp;&nbsp;성별</td>
                        <td><select style="width:100px;" name="gender">
                       	 <option value="성별" selected>성별
                           <option value="남">남</option>
                           <option value="여">여</option>
                        </select>
                        </td>
                     </tr>  
                     <tr>
						<td>우변번호</td>
						<td><input type = "text" name="zipcode" id="sample4_postcode" placeholder="우편번호를 검색하세요" style="width:180px">
						<input type="button" value="우편번호 찾기" style="vertical-align: top; height:35px ; width:110px ;  font-size : 13px" onclick="sample4_execDaumPostcode()">
						</td>
					</tr>	
                     <tr>
                        <td>&nbsp;&nbsp;주소</td>
                        <td><input name="address" type="text" id="sample4_roadAddress" placeholder="나머지 주소를 입력하세요">
                        </td>
                     </tr>  
                     
                  </tbody>
               </table>
                  <br>
                  <br>
                  <div style="text-align: center;">
                     <input  type="submit" name="회원가입" value="회원가입">
                     <input type="reset" style="vertical-align: top; height:30px ; width:90px ;  font-size : 13px" value="다시쓰기">
                  </div>
               </div>
			</form>
		</div>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" ></script>


</body>
</html>

