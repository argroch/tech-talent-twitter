// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .



$(document).ready(function(){
	$('#unfollow_btn').hover(function(){
		$(this).removeClass('btn-primary');
		$(this).addClass('btn-danger');
		$(this).html('Unfollow');
	}, function(){
		$(this).html('Following');
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-primary');
	});

	// $('#unhide_form').click(function(){
	// 	$('#hide_count_btn').removeClass('cant-see-me');
	// });
});

function updateCountdown(){
  // 140 is the max message length
  var remaining = 140 - jQuery('.message').val().length;
  $('.countdown').html(remaining);
  if(remaining < 0) {
  	$('.countdown').addClass('red-text');
  }
}

$(document).ready(function($) {
  updateCountdown();
  $('.message').change(updateCountdown);
  $('.message').keyup(updateCountdown);
});









