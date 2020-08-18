
//login
function openLogin(){
	document.getElementById("logbar").style.display="block";
}
function closeLogin(){
	document.getElementById("logbar").style.display="none";
}
//register
function openRegister(){
	document.getElementById("regbar").style.display="block";
}
function closeRegister(){
	document.getElementById("regbar").style.display="none";
}
//loginCheck()
function loginCheck(){
	 var frm = document.formm;
	 if(frm.id.value =="")
	 {
		 alert("아이디를 입력하세요");
		 frm.id.focus();
		 return;
	 }
	 else if(frm.pwd.value =="")
	 {
		 alert("비밀번호를 입력하세요");
		 frm.pwd.focus();
		 return;
	 }
		frm.submit();
}

//아이디 중복확인
function idCheck(id){
	frm =document.reg_form;
	if(id==""){
		alert("아이디를 입력해 주세요");
		frm.id.focus();
		return;
	}
	url = "idCheck.jsp?id="+ id;
	window.open(url, "IDCheck", "width=300, height=150");
}

//회원가입 check
function inputCheck(){
	if(document.reg_form.id.value==""){
		alert("아이디 입력해주세요");
		document.reg_form.id.focus();
		return false;
	}
	if(document.reg_form.idCheckOk.value!="yes"){
		alert("아이디 중복확인 하세요");
		document.reg_form.id.focus();
		return false;
	}
	if(document.reg_form.pwd.value==""){
		alert("비밀번호를 입력해주세요");
		document.reg_form.pwd.focus();
		return false;
	}
	if(document.reg_form.pwd_co.value != document.reg_form.pwd.value){
		alert("비밀번호가 틀렸습니다 다시입력해주세요");
		document.reg_form.pwd_co.focus();
		return false;
	}
	if(document.reg_form.name.value==""){
		alert("이름을 입력하세요");
		document.reg_form.name.focus();
		return false;
	}
	if(document.reg_form.email.value==""){
		alert("이메일을 입력 하세요");
		document.reg_form.email.focus();
		return false;
	}
	if(document.reg_form.agency.value==""){
		alert("통신사를 선택 하세요");
		return false;
	}
	if(document.reg_form.tel.value==""){
		alert("휴대본 번호를 입력 하세요");
		document.reg_form.tel.focus();
		return false;
	}
	if(document.reg_form.birthdate.value==""){
		alert("생일을 입력 하세요");
		document.reg_form.birthdate.focus();
		return false;
	}
	if(document.reg_form.gender.value=="성별"){
		alert("성별을 확인 하세요");
		document.reg_form.gender.focus();
		return false;
	}
	if(document.reg_form.zipcode.value==""){
		alert("우편번호를 검색 하세요");
		document.reg_form.zipcode.focus();
		return false;
	}

	if(document.reg_form.address.value==""){
		alert("나머지 주소를 입력 하세요");
		document.reg_form.address.focus();
		return false;
	}
	return true;
}
function win_close(){
	self.close();
}

//intro 배경 재생/정지
function mute(){
    var vid = document.getElementById("video");
    var btnPlay = document.querySelector(".btn-play");
    // vid.removeAttribute("muted");
    // vid.mute="false";
    if (vid.paused) {
        vid.play();
        btnPlay.innerHTML="STOP";
    } else {
        vid.pause();
        btnPlay.innerHTML="PLAY";
    }
} 

window.onload = function(){

}