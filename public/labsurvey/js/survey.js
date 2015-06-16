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
	happy = $('#happy_level').val();
	excited = $('#excited_level').val();
	safe = $('#safe_level').val();
	peace = $('#peace_level').val();
	usercomment = $('#comment').val();

	$.ajax({
	  type: "POST",
	  url: "/api/v1/open_surveys.json",
	  data: {open_survey: {date: date, time: time, location: loc, happy_level:happy, excited_level:excited, safe_level:safe, peace_level:peace, comment:usercomment}},
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
