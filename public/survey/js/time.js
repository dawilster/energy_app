var d = new Date();
var mins = ('0'+d.getMinutes()).slice(-2);
var date = d.getDate() + '/' + (d.getMonth()+1) + '/' + d.getFullYear(); 
var time = d.getHours() + ':' + mins;
document.getElementById("date").innerHTML = date;
document.getElementById("time").innerHTML = time;
document.getElementById("dateinput").value = date;
document.getElementById("timeinput").value = time;
