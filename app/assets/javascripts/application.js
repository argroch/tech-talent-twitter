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
	// "Following" button on Show User page
	// changes to "Unfollow" when hovered over
	// (also, color change)
	$('#unfollow_btn').hover(function(){
		$(this).removeClass('btn-primary');
		$(this).addClass('btn-danger');
		$(this).html('Unfollow');
	}, function(){
		$(this).html('Following');
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-primary');
	});

	// When you click on the field at the top of
	// the feed, it opens up more, and the button
	// and character count are shown
	$('#feed_tweeting').click(function(){
		$(this).attr('rows','3');
		$('#feed_tweeting_btn').show();
	});

	// When we click anywhere but that input
	// we want the input field to shrink again
	// and the button and character count to be hidden
	$(document).click(function(event){
		if (!($(event.target).closest("#feed_tweeting").length) && $('#feed_tweeting').val() == "") {
			$("#feed_tweeting").attr('rows','1');
			$("#feed_tweeting_btn").hide();
		}
	});
});

// Show character count for Tweeting in the Modal
function updateCountdown(){
  // 140 is the max message length
  var remaining = 140 - $('.message').val().length;
  $('.countdown').html(remaining);
  if(remaining < 0) {
  	$('.countdown').addClass('red-text');
  } else {
  	$('.countdown').removeClass('red-text');
  }
}

$(document).ready(function($) {
  updateCountdown();
  $('.message').change(updateCountdown);
  $('.message').keyup(updateCountdown);
});


// Show character count for Tweeting on top of Feed
function updateFeedCountdown(){
  var remaining = 140 - $('.feed-message').val().length;
  $('.feed-countdown').html(remaining);
  if(remaining < 0) {
  	$('.feed-countdown').addClass('red-text');
  } else {
  	$('.feed-countdown').removeClass('red-text');
  }
}

$(document).ready(function($) {
  updateFeedCountdown();
  $('.feed-message').change(updateFeedCountdown);
  $('.feed-message').keyup(updateFeedCountdown);
});
