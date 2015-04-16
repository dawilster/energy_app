$( document ).ready(function() {

	//if cookie is set
	if($.cookie('user_id') != undefined){
		//redirect survey
		window.location.href = "index.html";
	}

	$( ".login-button" ).click(function() {
		//set cookie
		$.cookie('user_id', this.id, { path: '/' });
		window.location.href = "index.html";
	});
});
