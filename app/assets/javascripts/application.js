// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

window.onload = function() {
    if (window.location.toString().charAt(window.location.toString().length-1) == '/' || window.location.toString().charAt(window.location.toString().length-1) == '#' || window.location.toString().indexOf('blog') >= 0) {
      $('#body_content').css({'padding-top': 0+'px'});
    }
  };

$(document).ready(
	function (){
    var jmpressOpts = {
      animation   : { transitionDuration : '0.8s' }
    };
        
    $( '#jms-slideshow' ).jmslideshow( $.extend( true, { jmpressOpts : jmpressOpts }, {
      autoplay  : true,
      bgColorSpeed: '0.8s',
      arrows    : true
    }));
    
	$('.caption').css({'right': (1920/2)+($('.row').width()/(-1*2))+(40)+'px'});

	$("nav li").click(function () {
      window.location.replace($(this).find('a').attr('href'));
    });
	$(".description").click(function () {
		window.location.replace($(this).parent().find('a').attr('href'));
	});
  $('.members .info').css({'width': $('.members img').width()-40 + 'px'});
  $('.members .info').css({'height': $('.members img').height()-40 + 'px'});
  $('.members').hover(
    function () {
      $(this).find('img').fadeTo(250, 0.2);
      $(this).parent().find('.info').fadeIn(250);
    }, 
    function () {
      $(this).find('img').fadeTo(250, 1);
      $(this).parent().find(".info").fadeOut(250);
    }
  );
  $('#colorpickerField').ColorPicker({
    onSubmit: function(hsb, hex, rgb, el) {
      $(el).val(hex);
      $(el).ColorPickerHide();
    },
    onBeforeShow: function () {
      $(this).ColorPickerSetColor(this.value);
    }
  })
  .bind('keyup', function(){
    $(this).ColorPickerSetColor(this.value);
  });

});

$(window).resize(function() {
  $('.caption').css({'right': (1920/2)+($('.row').width()/(-1*2))+(40)+'px'});
	var height = ($('.description').parent().height())/4;
	$('.description').css({'top': height+'px'});
  $('.members .info').css({'width': $('.members img').width()-40 + 'px'});
  $('.members .info').css({'height': $('.members img').height()-40 + 'px'});
});