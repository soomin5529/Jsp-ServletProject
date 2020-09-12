
$(document).ready(function() {
	 // 스크롤에 따른 헤더 색상 변경
    $(".content-wrap").scroll(function() {
        if($(this).scrollTop() > 1) {
            $(".header").addClass("scroll");
        } else {
            $(".header").removeClass("scroll");
        };
    });
    
    
    //fadein slide
    $('.fadein').animate({'opacity':'1','margin-top':'0px'},800);
    $('.form').animate({'opacity':'1','margin-top':'auto'},800);
})

