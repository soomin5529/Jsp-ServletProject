
$(document).ready(function() {
	 // 스크롤에 따른 헤더 색상 변경
    $(".content-wrap").scroll(function() {
        if($(this).scrollTop() > 1) {
            $(".header").addClass("scroll");
        } else {
            $(".header").removeClass("scroll");
        };
    });
    
    
    // vision 영역 - fadeinleft animation
    $(window).scroll( function(){
        $('.fadeinslide').each( function(i){
            var delayPosition = 200;
            var bottomOfEl = $(this).offset().top + $(this).outerHeight() - delayPosition;
            var bottomOfWin = $(window).scrollTop() + $(window).height();
            
            if( bottomOfWin > bottomOfEl ){
                $(this).animate({'opacity':'1','margin-top':'0px'},1000);
            } 
        }); 
    });


    // card 영역 - 버튼 누르면 리스트 더보기
    $('#btnCardMore').click(function(){
        if($('.sec-card ul li').hasClass('hide')){
           $('.sec-card ul li').slideDown();
           $('.sec-card ul li').removeClass('hide');
        }
      });
})