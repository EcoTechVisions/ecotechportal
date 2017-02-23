// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


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

};

$(document).ready(pageReady);
$(document).on('page:load', pageReady);