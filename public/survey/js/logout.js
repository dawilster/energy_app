$( document ).ready(function() {

	
	if($.cookie('user_id') == undefined){
		//redirect survey
		window.location.href = "login.html";
	}

	$("#logout-button").click(function(){
		$.removeCookie('user_id', { path: '/' });
		//redirect survey
		window.location.href = "login.html";
	});

	
});
