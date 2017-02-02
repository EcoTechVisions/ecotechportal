// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var pageReady = function(){

	$('.create_new_timesheet').click(function(){
		$(this).fadeOut(500);
		$('form.create_new_timesheet_form')[0].reset();
		$('.create_new_timesheet_form').fadeToggle(500);
	});
	$('.cancel_timesheet').click(function(){
		$(this).closest('form')[0].reset();
		$(this).closest('form').fadeOut(500);
		$('.create_new_timesheet').fadeIn(500);
	});

	
	$('#timesheet_from').change(function(){
		console.log($(this).val());
	});	


	var now = new Date();
	// var day = 21;
	var day = parseInt(("0" + now.getDate()).slice(-2));
	// var month = parseInt("01");
	var month = parseInt(("0" + now.getMonth()).slice(-2));
	var year = now.getFullYear();
	var date = now.getFullYear()+"-"+(month-1)+"-"+(day);

	// console.log(days);

	$('.generate_timesheet').click(function(){
		var startDay=0;
		var startMonth=0;
		var startYear=0;
		var endDay=0;
		var endMonth=0;
		var endYear=0;

		$('.auto_date').fadeIn(300);
		setTimeout(function(){
			$('.auto_date').fadeOut(300);
		}, 3000);

		var getMonthYear = function(thisMonth, thisDay, thisYear){

			if(thisDay<15){
				var smonth=0;
				var syear=0;

				if(thisMonth===1){
					smonth=12;
					syear=thisYear-1; 
				}else{
					smonth=thisMonth;
					syear=thisYear; 
				}
			}else{
				smonth=thisMonth+1;
				syear=thisYear; 
			}
			var emonth=smonth;
			var eyear=syear;
			var endDay=Math.round(((new Date(eyear, emonth))-(new Date(eyear, emonth-1)))/86400000);

			return [smonth,syear,emonth,eyear,endDay]
		}

		if(day<15){
			startDay=16;
			endDay=getMonthYear(month, day, year)[4];
		}else{
			startDay="01";
			endDay=15;
		};
		
		startMonth=getMonthYear(month, day, year)[0];
		endMonth=getMonthYear(month, day, year)[2];

		startYear=getMonthYear(month, day, year)[1];
		endYear=getMonthYear(month, day, year)[3];

		$('.auto_date').fadeIn(300)

		var startDate = startYear+"-"+(startMonth)+"-"+(startDay) ;
		var endDate = endYear+"-"+(endMonth)+"-"+(endDay) ;
		$('#timesheet_from').val(startDate);
		$('#timesheet_to').val(endDate);
	});

};

$(document).ready(pageReady);
$(document).on('page:load', pageReady);