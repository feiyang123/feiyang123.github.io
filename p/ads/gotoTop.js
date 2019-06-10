
$(function(){

$(window).scroll(function(){

var $scrollTop = $(window).scrollTop();

if($(window).scrollTop() > $(window).height()/2){

var $wt = parseInt(($(window).height())*0.9);

var $getTop = parseInt($scrollTop)+$wt;

$("#content").fadeIn(500).animate({"top":$getTop + "px"},{duration:600,queue:false});

}else if($(window).scrollTop() <= $(window).height()/2){

$("#content").fadeOut();

}

})

})