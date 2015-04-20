$( document ).ready(function() {
	$("#user_id").val($.cookie("user_id"));

	if( $.cookie("user_id") == 1 ){
		document.getElementById("name").innerHTML = "Margaret Hamilton"; //change display value
		document.getElementById("user_id").value = "Margaret Hamilton";	//change input value
		document.getElementById("roomno").innerHTML = "14.10.02 ";
		document.getElementById("room_num").value = "14.10.02";

	}else if( $.cookie("user_id") == 2 ){
		document.getElementById("name").innerHTML = "Irvan Arief Ang";
		document.getElementById("user_id").value = "Irvan Arief Ang";
		document.getElementById("roomno").innerHTML = "14.10.06";
		document.getElementById("room_num").value = "14.10.06";

	}else if( $.cookie("user_id") == 3 ){
		document.getElementById("name").innerHTML = "Flora Salim";
		document.getElementById("user_id").value = "Flora Salim";
		document.getElementById("roomno").innerHTML = "14.10.03";
		document.getElementById("room_num").value = "14.10.03";

	}else if( $.cookie("user_id") == 4 ){
		document.getElementById("name").innerHTML = "Saiedur Rahaman";
		document.getElementById("user_id").value = "Saiedur Rahaman";
		document.getElementById("roomno").innerHTML = "14.10.06";
		document.getElementById("room_num").value = "14.10.06";
	}

	//when submit is called postData method
	$(".submitted").click(function(){
		if (validation() != false){
			postData();
			document.getElementById("num_alert").style.display="none";
			alert("Submitted your survey!");
		}else{
			$('form').submit(function(){return false;}); // stop the form from being submitted.
		}
	});
});

function postData(){
	//alert("post");
	user_id = $.cookie("user_id");
	room_num = $('#room_num').val();
	date = $('#dateinput').val();
	time = $('#timeinput').val();
	people_num = $('#people-num').val();
	cool = $('#cool_level').val();
	noise = $('#noise_level').val();

	$.ajax({
	  type: "POST",
	  url: "/api/v1/surveys.json",
	  data: {survey: {user_id: user_id, occupants: people_num, temperature_value: cool, noise_level:noise }},
	  success: function(){
	  },
	  dataType: "json"
	});

}

//hiding div
function inroom(){
  var x = document.getElementById("switch-state").checked;
  if (x==true){
    document.getElementById("surveydata").style.display="block";}
  else{
    document.getElementById("surveydata").style.display="none";}
}
//hiding the people input
function withothers(){
  var x = document.getElementById("switch-people").checked;
  if (x==true){
    document.getElementById("people-num").disabled = false;
    $("#people-num").focus(); //focusing on the input
	}
  else{
    document.getElementById("people-num").disabled = true;}
}

// validation on number of people
function validation(){
	var withpeople = document.getElementById("switch-people").checked;
	if (withpeople){
		var x=document.getElementById("people-num").value;
	    var regex=/^[0-9]+$/;
	    if (x.match(regex) == null)
	    {
	    	//alert("Must input a number");
	        document.getElementById("num_alert").style.display="block";
	        $("#people-num").focus();
	        return false;
	    }
	}
	else
		document.getElementById("people-num").value = 0;
}