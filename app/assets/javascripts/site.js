// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

'use strict';

var pageReady = function(){


	// function sameHeight(){
	// 	var vertical = $(".column_vertical").data("v_set");

	// 	// get element by class name .column_vertical and do a loop

	// 	var column1 = $(".column_vertical[data-v_set='"+vertical+"']");
	// 	var column2 = $(".column_vertical[data-v_take='"+vertical+"']");
	// 	column1.css("height", column2.height());
	// };
	
	// setTimeout(function(){ sameHeight(); }, 100);

	// $( window ).resize(function() {
	//   sameHeight();
	// });

	$('.start_form').on('click', function(event){
		event.preventDefault();
		var form = $(this).data('form');
		$('.show_form[data-form="'+form+'"]').slideToggle();
	});

	$('.cancel_form').on('click', function(event){
		event.preventDefault();
		var form = $(this).data('form');
		$('.show_form[data-form="'+form+'"]').slideToggle();
		$(this).closest($('form')).find("input[type=text], textarea").val("");
	});

	$('.ticket').on('click', function(event){
		event.preventDefault();
		$('.ticket').removeClass('selected')
		$(this).addClass('selected');
	});

};

$(document).ready(pageReady);
$(document).on('page:load', pageReady);