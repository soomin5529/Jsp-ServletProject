//login
function openLogin() {
   document.getElementById("logbar").style.display = "block";
}
function closeLogin() {
   document.getElementById("logbar").style.display = "none";
}
// register
function openRegister() {
   document.getElementById("regbar").style.display = "block";
}
function closeRegister() {
   document.getElementById("regbar").style.display = "none";
}
// loginCheck()
function loginCheck() {
   var frm = document.formm;
   if (frm.id.value == "") {
      alert("아이디를 입력하세요");
      frm.id.focus();
      return;
   } else if (frm.pwd.value == "") {
      alert("비밀번호를 입력하세요");
      frm.pwd.focus();
      return;
   }
   frm.submit();
}

// 아이디 중복확인
function idCheck(id) {
   frm = document.reg_form;
   if (id == "") {
      alert("아이디를 입력해 주세요");
      frm.id.focus();
      return;
   }
   url = "/jspProject/JSP/introBack/idCheck.jsp?id=" + id;
   window.open(url, "IDCheck", "width=300, height=150");
}

// 회원가입 check
function inputCheck() {
   if (document.reg_form.id.value == "") {
      alert("아이디 입력해주세요");
      document.reg_form.id.focus();
      return false;
   }
   if (document.reg_form.idCheckOk.value != "yes") {
      alert("아이디 중복확인 하세요");
      document.reg_form.id.focus();
      return false;
   }
   if (document.reg_form.pwd.value == "") {
      alert("비밀번호를 입력해주세요");
      document.reg_form.pwd.focus();
      return false;
   }
   if (document.reg_form.pwd_co.value != document.reg_form.pwd.value) {
      alert("비밀번호가 틀렸습니다 다시입력해주세요");
      document.reg_form.pwd_co.focus();
      return false;
   }
   if (document.reg_form.name.value == "") {
      alert("이름을 입력하세요");
      document.reg_form.name.focus();
      return false;
   }
   if (document.reg_form.email.value == "") {
      alert("이메일을 입력 하세요");
      document.reg_form.email.focus();
      return false;
   }
   if (document.reg_form.agency.value == "") {
      alert("통신사를 선택 하세요");
      return false;
   }
   if (document.reg_form.tel.value == "") {
      alert("휴대본 번호를 입력 하세요");
      document.reg_form.tel.focus();
      return false;
   }
   if (document.reg_form.birthdate.value == "") {
      alert("생일을 입력 하세요");
      document.reg_form.birthdate.focus();
      return false;
   }
   if (document.reg_form.gender.value == "성별") {
      alert("성별을 확인 하세요");
      document.reg_form.gender.focus();
      return false;
   }
   if (document.reg_form.zipcode.value == "") {
      alert("우편번호를 검색 하세요");
      document.reg_form.zipcode.focus();
      return false;
   }

   if (document.reg_form.address.value == "") {
      alert("나머지 주소를 입력 하세요");
      document.reg_form.address.focus();
      return false;
   }
   return true;
}
function win_close() {
   self.close();
}


//우편번호 찾기
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

// intro 배경 재생/정지
function mute() {
   var vid = document.getElementById("video");
   var btnPlay = document.querySelector(".btn-play");
   // vid.removeAttribute("muted");
   // vid.mute="false";
   if (vid.paused) {
      vid.play();
      btnPlay.innerHTML = "STOP";
   } else {
      vid.pause();
      btnPlay.innerHTML = "PLAY";
   }
}

window.onload = function() {
   /*  gnb 메뉴 선택 start*/
   var userMain = document.getElementById("userMain");
   var schedule = document.getElementById("schedule");
   var mypage = document.getElementById("mypage");
   var qna = document.getElementById("qna");
   var adminMain = document.getElementById("adminMain");
   var auctionList = document.getElementById("auctionList");
   var memberList = document.getElementById("memberList");
   var url = document.location.href.split("/");
   
   //사용자권한 메뉴
   if (url[url.length - 1] == "userMainList.jsp") {
      userMain.className += "on";
   } 
   if (url[url.length - 1] == "userSchedule.jsp") {
      schedule.className += "on";
   } 
   if (url[url.length - 1] == "userMypage.jsp") {
      mypage.className += "on";
   } 
   
   //관리자 권한 메뉴
   if (url[url.length - 1] == "adminMain.jsp") {
      adminMain.className += "on";
   } 
   if (url[url.length - 1] == "auctionList.jsp") {
      auctionList.className += "on"
   } 
   if (url[url.length - 1] == "memberList.jsp") {
      memberList.className += "on";
   } 
   //공통 메뉴
   if (url[url.length - 1] == "qna.jsp") {
	      qna.className += "on";
   } 
   /*  gnb 메뉴 선택 end*/
   
}

function closePop() {
		document.getElementById("popup").style.display = "none";
	}


