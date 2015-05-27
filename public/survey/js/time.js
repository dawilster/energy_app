var d = new Date();
var date = d.getDate() + '/' + (d.getMonth()+1) + '/' + d.getFullYear(); 

var mins = ('0'+d.getMinutes()).slice(-2);
var time = d.getHours() + ':' + mins;

document.getElementById("date").innerHTML = date;
document.getElementById("dateinput").value = date;

document.getElementById("time").innerHTML = time;
document.getElementById("timeinput").value = time;

function inputTime(){
	document.getElementById("time").style.display="none";
	document.getElementById("changeTimebtn").style.display="none";
	document.getElementById("usrtime").style.display="inline";
	document.getElementById("showTimebtn").style.display="block";
}

function addtime(){
	var time = document.getElementById("usrtime").value;
	document.getElementById("time").style.display="inline";
	document.getElementById("changeTimebtn").style.display="inline";
	document.getElementById("usrtime").style.display="none";
	document.getElementById("showTimebtn").style.display="none";
	
	if (time!= ""){
	document.getElementById("time").innerHTML=time;
	document.getElementById("timeinput").value = time;}
}

function inputDate(){
	document.getElementById("date").style.display="none";
	document.getElementById("changeDatebtn").style.display="none";
	document.getElementById("usrdate").style.display="inline";
	document.getElementById("showDatebtn").style.display="block";
}

function addDate(){
	var date = document.getElementById("usrdate").value;
	document.getElementById("date").style.display="inline";
	document.getElementById("changeDatebtn").style.display="inline";
	document.getElementById("usrdate").style.display="none";
	document.getElementById("showDatebtn").style.display="none";
	
	if (date!= ""){
	document.getElementById("date").innerHTML=date;
	document.getElementById("dateinput").value = date;}
}
