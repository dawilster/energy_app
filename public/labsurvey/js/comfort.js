$( document ).ready(function() {
	
	//when submit is called postData method
	$(".submitted").click(function(){
			postData();
			alert("Submitted your survey! Thank you.");
	});
});

function postData(){
	date = $('#dateinput').val();
	time = $('#timeinput').val();
	loc = $('#locationinput').val();
	cold = $('#cold_level').val();
	crowd = $('#crowd_level').val();
	noise = $('#noise_level').val();
	overall = $('#overall_level').val();

	$.ajax({
	  type: "POST",
	  url: "http://requestb.in/r5a4d7r5",
	  data: {date: date, time: time, location: loc, cold_level:cold, crowd_level:crowd, noise_level:noise, overall_level:overall},
	  success: function(){
	  },
	  dataType: "json"
	});
	
}

function otherLocation(){
    var location = $('.location').val();
    if (location == 'other'){
        document.getElementById("usrLocation").style.display="inline";
        $('#locationinput').val();
    }else{
        document.getElementById("usrLocation").style.display="none";
        $('#locationinput').val(location);
    }
}

function enterLocation(){
    var loc = $('#usrLocation').val();
    $('#locationinput').val(loc);
}
