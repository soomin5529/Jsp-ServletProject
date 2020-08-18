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
<link rel="stylesheet" type="text/css" href="../css/201901_reset.css">
<link rel="stylesheet" type="text/css" href="../css/common.css">
<script type="text/javascript" src="../js/common.js" charset="utf-8">
</script>
<title>BLUEOCEAN에 온것을 환영합니다</title>
</head>
<body class="intro">
	<div class="jb-box">
		<video muted autoplay loop id="video">
			<source src="../images/jetsurf.mp4" type="video/mp4">
			<source src="../images/jetsurf.ogg" type="video/ogg">
		</video>
		
		<div class="jb-text">
			<span>B L U E O C E A N</span>
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
			<form class="form" name="formm" method="post" action="/jspProject/JSP/userLoginAction.jsp">
				<fieldset> 
					<h2>로그인</h2>
					<label for="id">아이디</label><br> <input TYPE="text" name="id" placeholder="아이디를 입력해주세요"><br> 
					<label for="pwd">패스워드</label><br>
					<input TYPE="password" name="pwd" placeholder="비밀번호를  입력해주세요">
					<a href="findID.jsp"><b>아이디 찾기</b></a>&nbsp;<a href="findPWD.jsp"><b>비밀번호 찾기</b></a>
					<br><br> <input TYPE="button" value="로그인" onClick="loginCheck();"> <br>
				</fieldset>
			</form>
		</div>
	</div>
	
	<div id="regbar">
		<span class="registerClose" onclick="closeRegister()">×</span>
		<div>
			<form class="regform" name="reg_form" method="post" action="userRegisterAction.jsp" onsubmit="return inputCheck()" >
			<input type= "hidden" name="idCheckOk" value="no">
				<fieldset>
					<h2 align="center">회원가입</h2>
					<div style="text-align: right;"><span style="color: red; font-weight: bold;">v </span><span>표시항목 필수 입력 항목입니다</span><br>
               <table style="text-align: left; width: 700px; height: 320px; font-weight: bold;"border="1" cellpadding="2" cellspacing="2">
                  <tbody><br><br>
                  <tr>
                        <td><small>v</small>
                        <span>아이디</span> </td>
                        <td><input name="id" autofocus placeholder = "아이디를 입력해주세요" title = "아이디 입력창입니다."  >
                        <input type="button" value="중복확인"  style="vertical-align: top; height:30px ; width:90px ;  font-size : 13px" onClick="idCheck(this.form.id.value)"><br>   
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
                            <input type = "radio" name = "agency" value="skt" style="width:20px;"> <span>SKT </span>
                            <input type = "radio" name = "agency" value="kt" style="width:20px;"> <span >KT </span>
                            <input type = "radio" name = "agency" value="lgu+" style="width:20px;"> <span>LGU+</span><br> 
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
                        <td><select style="width:50px;" name="gender">
                       	 <option value="성별" selected>성별
                           <option value="남">남</option>
                           <option value="여">여</option>
                        </select>
                        </td>
                     </tr>  
                     <tr>
						<td>우변번호</td>
						<td><input type = "text" name="zipcode" id="sample4_postcode" placeholder="우편번호를 검색하세요" size="5">
						<input type="button" value="우편번호 찾기" style="vertical-align: top; height:30px ; width:90px ;  font-size : 13px" onclick="sample4_execDaumPostcode()">
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
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

            }
        }).open();
    }
</script>


</body>
</html>

