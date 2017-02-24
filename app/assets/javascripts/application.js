// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

'use strict';

var pageReady = function(){
	
	setTimeout(function(){
		$('.notice').fadeOut(1000);
		setTimeout(function(){
			$('.notice').addClass('hide');
		}, 1000);
	}, 2000);

	// $('div').each(function(){
 //        // Get the content
 //        var str = $(this).html();
 //        // Set the regex string
 //        var regex = /(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/ig
 //        // Replace plain text links by hyperlinks
 //        var replaced_text = str.replace(regex, "<a href='$1' target='_blank'>$1</a>");
 //        // Echo link
 //        $(this).html(replaced_text);
 //    });

 	$('.stop_slide_show').click(function(){
 		$('.slide_show_wrapper').fadeToggle(1000);
 	});
 	$('.slide_show_wrapper').hover(function(){
	 	$('body').on({
		    'mousewheel': function(e) {
		        if (e.target.id == 'el') return;
		        e.preventDefault();
		        e.stopPropagation();
		    }
		})
	});

};

$(document).ready(pageReady);
$(document).on('page:load', pageReady);